# Set the working dir, where all compiled Verilog goes.

vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)

vlog -timescale 1ns/1ns combined_fsm.v

# Load simulation using mux as the top level simulation module.
vsim combined_fsm

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*}would add all items in top level simulation module.
add wave {/*}

# Set input values using the force command, signal names need to be in {} brackets.
force {clock} 0 0, 1 10 -r 20
force {x_auto} 00000000
force {y_auto} 0000000
force {color_auto} 000
force {x_manual} 11111111
force {y_manual} 1111111
force {color_manual} 111
force {stop} 0 0, 1 20 -r 40
run 40ns
