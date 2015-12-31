// **** Design size ****
//

//FIFO DEPTH
//DOES NOT WORK FOR 1 ENTRY FIFO!
`define  FIFO_DEPTH 4
`define  FIFO_WIDTH (`FIFO_DEPTH - 1)

// data path
`define  DATA_BITS 32
`define  DATA_WIDTH (`DATA_BITS - 1)


// meta bits are 2 bits (valid and ready)
`define  META_BITS 2
`define  PATH_BITS (`DATA_BITS + `META_BITS)
`define  PATH_WIDTH (`PATH_BITS - 1)


// directions for static config path
`define NORTH 0
`define EAST  1
`define SOUTH 2
`define WEST  3


// number of bits embedded in dyser_init instructions
`define CONFIG_BITS 21

`define CONF_BITS (`CONFIG_BITS <= `PATH_BITS ? `CONFIG_BITS : `PATH_BITS)
`define CONF_WIDTH (`CONF_BITS-1)
