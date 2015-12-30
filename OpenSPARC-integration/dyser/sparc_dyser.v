/////////////////////////////////
// 
//  sparc_dyser.v 
//  -------------
//  Last modification: Chen-Han Ho @ 2013/1/4
// 
/////////////////////////////////

module sparc_dyser (
  //OUTPUT
  dyser_ifu_stallreq,    // dyser to ifu stall request
  dyser_exu_data_e,      // dyser data to exu 
  dyser_exu_write_e,     // dyser has to write irf
  dyser_lsu_st_e,        // dyser has to store to memory
  dyser_exu_killwen_w,   // load data is to dyser, so kill irf write enable in exu

  //INPUT
  ifu_dyser_config_enable_d, // enable dyser's configure phase
  ifu_dyser_enq_enable_d,    // dyser enqueue enable
  ifu_dyser_deq_enable_d,    // dyser deq enable
  ifu_dyser_enq_port_d,      // enq port
  ifu_dyser_deq_port_d,      // deq port
  exu_dyser_data_e,          // data from exu register file
  ifu_dyser_commit_d,        // dummy signal for now 
  ifu_dyser_kill_e,          // this kills register writes in exu
  ifu_dyser_rollback_e,      // this rollback instructions from e stage
  ifu_dyser_rollback_w,      // this rollback instructions from w stage
  // dyload
  lsu_dyser_dfill_data_w, // load data
  lsu_dyser_dfill_vld_w,
  lsu_dyser_ldst_miss_w,
  lsu_dyser_flush_pipe_w,
  ifu_dyser_flush_m,
//  exu_dyser_ld_wb_kill_w,
  ifu_dyser_ld_d,
  ifu_dyser_st_d,
  ifu_dyser_vec_d,
  grst_l,                    // reset
  rclk                       // clk
  );
  
  //OUTPUT
  output        dyser_ifu_stallreq; //stall now happens at m stage, rollback 2 instructions, d and e
  output [63:0] dyser_exu_data_e;
  output        dyser_exu_write_e;
  output        dyser_lsu_st_e;
  output        dyser_exu_killwen_w;

  //INPUT
  input         ifu_dyser_config_enable_d;
  input         ifu_dyser_enq_enable_d; 
  input         ifu_dyser_deq_enable_d;    
  input  [4:0]  ifu_dyser_enq_port_d;
  input  [4:0]  ifu_dyser_deq_port_d;
  input  [63:0] exu_dyser_data_e;
  input         ifu_dyser_commit_d;
  input         ifu_dyser_kill_e;
  input         ifu_dyser_rollback_e;
  input         ifu_dyser_rollback_w; // have to rollback w-stage

  // dyload
  input  [63:0] lsu_dyser_dfill_data_w; // load data
  input         lsu_dyser_dfill_vld_w;
  input         lsu_dyser_ldst_miss_w;
  // e,d rollback is implemented, only w trap is needed here for a dyload miss
  input         lsu_dyser_flush_pipe_w;
  // this is the flush when lsu causes rollback from w stage
  // e.g. dmmu miss and other traps
  input         ifu_dyser_flush_m;
  // m-stage flush to kill m-stage enq and flush_w at next cycle 
//  input         exu_dyser_ld_wb_kill_w;  // lsu flush | ifu_tlu_flush, not needed anymore
  input         ifu_dyser_ld_d;
  input         ifu_dyser_st_d;
  input         ifu_dyser_vec_d;

  input         grst_l;
  input         rclk;

  wire          se; // dummy signal for now
  wire          send_stall;
  wire          receive_stall;
  wire   [31:0] receive_data;
  wire   [31:0] receive_data_from_dyser;
  wire   [31:0] receive_data_m;
  wire   [31:0] receive_data_w;
  wire   [31:0] receive_data_w_from_rbuf;

  wire          config_en_e;
  wire          enq_enable_e;
  wire          enq_enable_m;
  wire          enq_enable;
  wire          deq_enable;
  wire          deq_enable_e;
  wire          deq_enable_m;
  wire          deq_enable_w;
  wire          deq_enable_w_from_rbuf;
  wire   [4:0]  enq_port_e;
  wire   [4:0]  enq_port_m;
  wire   [4:0]  enq_port_w;
  wire   [4:0]  enq_port;

  wire   [4:0]  deq_port_e;
  wire   [63:0] enq_data_m;
  wire   [63:0] enq_data;

  wire          dyser_kill_e;
  wire          ifu_dyser_flush_w;
  wire          dyser_flush_pipe_w;

  wire          ifu_dyser_ld_e;
  wire          ifu_dyser_st_e;
  wire          dyser_ld_e;
  wire          dyser_ld_m;
  wire          dyser_ld_w; // last stage of dyser load
  wire          dyload_vld;
  wire          dyser_ld_curr_state;
  wire          dyser_ld_next_state;

  wire          vec_ctl;
  wire          vec_ctl_e;
  wire          vec_ctl_m;
  wire          vec_ctl_w;  // dyser vector interface control

  wire          sel_w;

  wire          dyser_retire_buf_curr_state;
  wire          dyser_retire_buf_next_state;
  wire          deq_sel_rbuf_m;
  wire          deq_sel_rbuf_w;

  // dyser load, 1 stage before actual w2 in irf (aggressive timing)
  assign dyload_vld = lsu_dyser_dfill_vld_w & ~lsu_dyser_ldst_miss_w &
                     ~ifu_dyser_flush_w     & ~lsu_dyser_flush_pipe_w;
 
  // kill, have to kill dyser instruction at e stage in both cases
  assign dyser_kill_e = ifu_dyser_kill_e | ifu_dyser_rollback_e | ifu_dyser_flush_m; 

  // ifu_tlu_flush_m stage flipflop:
  // ifu_dyser_flush_m (externally ifu_tlu_flush_m) will flush lsu and irf write operations
  // not sure why it is not a global w stage signal. 
  // Anyways, this is critical and you'lll found this stage ff in exu_ecl and
  // lsu. May because timing issue.
  dff_s #(1) ifu_tlu_flush_m2w(.din   (ifu_dyser_flush_m),
                               .clk   (rclk),
                               .q     (ifu_dyser_flush_w),
                               .se    (se), .si(), .so());

  // w stage flush pipe signal
  assign dyser_flush_pipe_w = lsu_dyser_flush_pipe_w | ifu_dyser_flush_w | ifu_dyser_rollback_w;

  // pipeline ff has enable for stall
  assign se = 1'b0;

  dffrle_s #(1) config_en_d2e(.din   (ifu_dyser_config_enable_d),
                              .clk   (rclk),
                              .rst_l (grst_l),
                              .q     (config_en_e),
                              .en    (~(send_stall & ~dyser_kill_e)),
                              // [FIXME: not implemented yet] 
                              .se    (se), .si(), .so());

  // enq at m stage
  // ---------------
  dff_s #(1) enq_enable_d2e(.din   (ifu_dyser_enq_enable_d & ~dyser_flush_pipe_w),
                            .clk   (rclk),
                            .q     (enq_enable_e),
                            .se    (se), .si(), .so());

  dffrle_s #(1) enq_enable_e2m(.din   (enq_enable_e & ~dyser_kill_e & ~dyser_flush_pipe_w ),
                               .clk   (rclk),
                               .rst_l (grst_l),
                               .q     (enq_enable_m),
                               .en    (~send_stall),
                               .se    (se), .si(), .so());

  // enq port at m stage
  // -------------------
  dff_s #(5) enq_port_d2e(.din   (ifu_dyser_enq_port_d),
                          .clk   (rclk),
                          .q     (enq_port_e),
                          .se    (se), .si(), .so());

  dffrle_s #(5) enq_port_e2m(.din   (enq_port_e),
                             .clk   (rclk),
                             .rst_l (grst_l),
                             .q     (enq_port_m),
                             .en    (~send_stall), 
                             .se    (se), .si(), .so());
  // ld enq port at w stage, stall when miss
  dffrle_s #(5) enq_port_m2w(.din   (enq_port_m),
                             .clk   (rclk),
                             .rst_l (grst_l),
                             .q     (enq_port_w),
                             .en    (~send_stall & ~dyser_ld_next_state), // if miss state, enable=0
                             .se    (se), .si(), .so());
                              
  // dyser data
  dffe_s #(64) exu_dyser_data_e2m(.din   (exu_dyser_data_e),
                                  .clk   (rclk),
                                  .q     (enq_data_m),
                                  .en    (~send_stall),
                                  .se    (se), .si(), .so());
   
  // enq vec at w stage
  // -------------------
  dff_s #(1) ld_vec_d2e(.din   (ifu_dyser_vec_d),
                        .clk   (rclk),
                        .q     (vec_ctl_e),
                        .se    (se), .si(), .so());

  dff_s #(1) ld_vec_e2m(.din   (vec_ctl_e),
                        // 1. only ld has vector interface, no m-stage stall
                        .clk   (rclk),
                        .q     (vec_ctl_m),
                        .se    (se), .si(), .so());

  // ld enq port at w stage, stall when miss
  dffrle_s #(1) ld_vec_m2w(.din   (vec_ctl_m),
                           .clk   (rclk),
                           .rst_l (grst_l),
                           .q     (vec_ctl_w),
                           .en    (~send_stall & ~dyser_ld_next_state), // if miss state, enable=0
                           .se    (se), .si(), .so());
 
  // dyser ld
  // ld will not follow a send because switch out, no worries about 
  // the hazard that ld(w-stage) and send(m-stage) collision.
  dff_s #(1) dyser_ld_d2e(.din   (ifu_dyser_ld_d & ~dyser_flush_pipe_w),
                          .clk   (rclk),
                          .q     (ifu_dyser_ld_e),
                          .se    (se), .si(), .so());

  // kill dyser ld if there is a rollback happened
  assign dyser_ld_e = ifu_dyser_ld_e & ~dyser_kill_e & ~dyser_flush_pipe_w;

  dff_s #(1) dyser_ld_e2m(.din   (dyser_ld_e),
                          .clk   (rclk),
                          .q     (dyser_ld_m),
                          .se    (se), .si(), .so());

  dff_s #(1) dyser_ld_m2w(.din   (dyser_ld_m & ~dyser_flush_pipe_w),
                          .clk   (rclk),
                          .q     (dyser_ld_w),
                          .se    (se), .si(), .so());

  // 1 bit state machine 
  // 1'b1 = ld in a miss, 1'b0 = free
  assign dyser_ld_next_state =((dyser_ld_w & lsu_dyser_ldst_miss_w &
                               ~dyser_ld_curr_state & ~dyser_flush_pipe_w)| //new ld miss
                               (dyser_ld_curr_state & ~dyload_vld))?
                               // in a miss and no vld ld data back
                                1'b1 :1'b0;
                              
  dffrl_s #(1) dyser_ld_state_ff(.din   (dyser_ld_next_state),
                                 .clk   (rclk),
                                 .rst_l (grst_l),
                                 .q     (dyser_ld_curr_state),
                                 .se    (se), .si(), .so());

  // enq arbiter, m or w stage. **No send follow ld will happen because ld will
  // switch out.
  assign sel_w    = dyser_ld_w |         // load
                    dyser_ld_curr_state; // valid load data after miss

  assign enq_data  =  (sel_w)? lsu_dyser_dfill_data_w[31:0] // dyload miss
                             : enq_data_m[31:0];

  assign enq_port  =  (sel_w) ? enq_port_w[4:0]: enq_port_m[4:0]; 

  assign enq_enable=  (sel_w) ?  dyload_vld :  // not in a miss
                                  enq_enable_m & ~dyser_flush_pipe_w & ~ifu_dyser_flush_m; 

  // vector:
  // vec should be a special contorl bit on dyloads for broadcast, 
  // but in old broadcast load design it is a special enq...
  // so here we cannot treat it as enq_port.
  // Additional mask here to make sure dyser only see vec_ctl when ld is
  // there. [This is BAD for timing]
  assign vec_ctl=  sel_w & vec_ctl_w & dyload_vld;

  // kill wb from lsu to exu in dyser_ld
  assign dyser_exu_killwen_w = sel_w & dyload_vld;

  // deq at e stage
  // ---------------
  // deq is at e stage, and has a 3-entry retire buffer
  dffrl_s #(1) deq_enable_d2e(.din   ((ifu_dyser_deq_enable_d|ifu_dyser_st_d)& ~dyser_flush_pipe_w),
                               .clk   (rclk),
                               .rst_l (grst_l),
                               .q     (deq_enable_e),
                               .se    (se), .si(), .so());

  dffrl_s #(5) deq_port_d2e(.din   (ifu_dyser_deq_port_d),
                             .clk   (rclk),
                             .rst_l (grst_l),
                             .q     (deq_port_e),
                             .se    (se), .si(), .so());
  // retire buffer for deq enable, 
  // it can actually be a fifo [TODO: make it a fifo if it's simpler to read]
  dff_s #(1) deq_enable_retire_buffer_e2m(
                             .din   (deq_enable & ~receive_stall),
                             .clk   (rclk),
                             .q     (deq_enable_m), 
                             .se    (se), .si(), .so());

  dffrle_s #(1) deq_enable_retire_buffer_m2w(
                             .din   (deq_enable_m & ~deq_sel_rbuf_m),//if selected, reset din
                             .clk   (rclk),
                             .rst_l (grst_l),
                             .q     (deq_enable_w),
                             .en    (~dyser_retire_buf_curr_state | deq_sel_rbuf_m),// reset when selected
                             .se    (se), .si(), .so());

  dffrle_s #(1) deq_enable_retire_buffer_w(
                             .din   (deq_enable_w & ~deq_sel_rbuf_w),
                             .clk   (rclk),
                             .rst_l (grst_l),
                             .q     (deq_enable_w_from_rbuf), //keeps dyser st miss's w stage deqs
                             .en    (~dyser_retire_buf_curr_state | deq_sel_rbuf_w),
                             .se    (se), .si(), .so());

  // retire buffer for deq data
  dff_s #(32) deq_data_retire_buffer_e2m(
                             .din   (receive_data_from_dyser),
                             .clk   (rclk),
                             .q     (receive_data_m),
                             .se    (se), .si(), .so());

  dffrle_s #(32) deq_data_retire_buffer_m2w(
                             .din   (receive_data_m),
                             .clk   (rclk),
                             .rst_l (grst_l),
                             .q     (receive_data_w),
                             .en    (~dyser_retire_buf_curr_state),
                             .se    (se), .si(), .so());

  dffrle_s #(32) deq_data_retire_buffer_w(
                             .din   (receive_data_w),
                             .clk   (rclk),
                             .rst_l (grst_l),
                             .q     (receive_data_w_from_rbuf),
                             .en    (~dyser_retire_buf_curr_state),
                             .se    (se), .si(), .so());


  // 1 bit state machine to check if there is a w stage rollback 
  // 1'b1 = serving an exception
  // 1st try: only can recover from first exception**A CHEAT VERSION**
  // [FIXME] fifo implementation and saparate check logic for m and w stage
  assign dyser_retire_buf_next_state =((dyser_flush_pipe_w & (deq_enable_m | deq_enable_w))
                                      //  exception when deq at m or w stage is valid
                                      )? 1'b1 : //stall retire buf
                                       (deq_sel_rbuf_m |( ~deq_enable_w & deq_sel_rbuf_w))?
                                         1'b0 : // next state will be free
                                         dyser_retire_buf_curr_state;
                              
  dffrl_s #(1) dyser_retire_buf_state_ff(
                                 .din   (dyser_retire_buf_next_state),
                                 .clk   (rclk),
                                 .rst_l (grst_l),
                                 .q     (dyser_retire_buf_curr_state),
                                 .se    (se), .si(), .so());

  // deq arbiter, e stage
  assign deq_sel_rbuf_m =(deq_enable_e & ~(dyser_kill_e | dyser_flush_pipe_w) & ~send_stall &
                          dyser_retire_buf_curr_state & 
                          deq_enable_w & ~deq_enable_w_from_rbuf)?
                          // there was a value in m stage when flush, and no
                          // w_rbuf values now. (w_rbuf has to be popped out
                          // first) 
                          1'b1:1'b0;

  assign deq_sel_rbuf_w =(deq_enable_e & ~(dyser_kill_e | dyser_flush_pipe_w) & ~send_stall & 
                          dyser_retire_buf_curr_state &
                          deq_enable_w_from_rbuf)?
                          // a value in w stage retire buffer
                          1'b1:1'b0;

  assign deq_enable =(deq_enable_e & ~(dyser_kill_e | dyser_flush_pipe_w) & ~send_stall & 
                      // send stall will rollback this deq
                      // when recv stall, deq_enable will take no effect and
                      // re-issued by pipeline
                     ~(dyser_retire_buf_curr_state & (deq_enable_w | deq_enable_w_from_rbuf)))?
                      // has something in retire buffer
                      1'b1 : 1'b0;
                                       

  // receive data mux
  assign receive_data =  deq_sel_rbuf_m? receive_data_w : 
                         deq_sel_rbuf_w? receive_data_w_from_rbuf : 
                         receive_data_from_dyser;
                         
  // dyser st
  dff_s #(1) ifu_dyser_st_d2e(.din   (ifu_dyser_st_d & ~dyser_flush_pipe_w),
                              .clk   (rclk),
                              .q     (ifu_dyser_st_e),
                              .se    (se), .si(), .so());

  // DySER top module is subject to change
  dyser dyser(
    /* inputs */
    // dyser_send
    .send_data_r0(enq_data[31:0]),
    .send_data_r1(32'b0),
    .send_port_r0(enq_port[4:0]),
    .send_port_r1(5'b0),
    .send_en0(enq_enable),
    .send_en1(1'b0),
    // dyser_recv
    .recv_port_r0(deq_port_e),
    .recv_port_r1(5'b0),
    .recv_en0(deq_enable),
    .recv_en1(1'b0),
    // dyser_init
    //.conf_en(config_en & ~dyser_kill_e),
    .config_en(config_en_e & ~dyser_kill_e),//**old
    .config_bits(21'b0), //***old
    .broad_load_en(vec_ctl), // **old
    // dyser_commit
    .commit(1'b0),
    .clk(rclk),
    //.rst_n(grst_l),
    .rst(~grst_l),//**old
    /* outputs */
    // dyser_send
    //.send_stall_r0(send_stall),
    .send_stall(send_stall), //**old
    //.send_stall_r1(),
    // dyser_recv
    .recv_data_r0(receive_data_from_dyser),
    .recv_data_r1(),
    //.recv_stall_r0(receive_stall),
    .recv_stall(receive_stall) //**old
    //.recv_stall_r1()
  );

  // output 
  assign dyser_ifu_stallreq = (send_stall | receive_stall) /*FIXME: need ld and send structure hazard (sel_w & enq_en_e)*/; // this will rollback d and e
  assign dyser_exu_data_e   = {32'b0,receive_data};
  assign dyser_exu_write_e  = deq_enable_e & ~send_stall & ~receive_stall &
                             ~dyser_kill_e & ~ifu_dyser_st_e & ~dyser_flush_pipe_w;
  assign dyser_lsu_st_e     = deq_enable_e & ifu_dyser_st_e;

  //---------------
  // VCS Debugging
  //---------------
  //

  `ifdef DYSER_SIM_TRACE
  //  initial begin
  //  always@(posedge rclk)begin
      
  //  end
  `endif


 
endmodule
