# Set the working dir, where all compiled Verilog goes.

vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)

vlog -timescale 1ns/1ns shift_sequence.v

# Load simulation using mux as the top level simulation module.
vsim shift_sequence

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*}would add all items in top level simulation module.
add wave {/*}

# Set input values using the force command, signal names need to be in {} brackets.
force {clock} 0 0, 1 10 -r 20
force {} 0
run 20ns
force {resetn} 1
run 20ns
force {ld_x} 1
force {ld_y} 0
force {ld_color} 0
force {color_in[2:0]} 110
force {coordinate[6:0]} 1010101
run 20ns
force {ld_x} 0
run 5ns
force {ld_y} 1
force {ld_color} 1
force {color_in[2:0]} 110
force {coordinate[6:0]} 0001110
run 20ns
