
task ASSERT;
  input           condition;
  input [256*8:0] message;
  input integer   cycle;
  inout           err;
  
  begin
    if (!condition) begin
      err = 1;
      $display("  assert failed: (CLK=%0d) %0s", cycle, message);
    end
  end
endtask


task check_error;
  input         err;
  input integer cycle;
  
  begin
    $display("Done after %0d cycles.", cycle);
    if (err == 1'b1)
      $display("<< ERROR DURING TEST >>");
    else
      $display("-- ALL TESTS PASSED --");
  end
endtask
