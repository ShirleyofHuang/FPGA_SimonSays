# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns automated_sequence.v

# Load simulation using mux as the top level simulation module.
vsim automated_sequence

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {begin_signal} 1 1, 1 20 -r 40
force {clock} 0 0, 1 10 -r 20
force {sequence} 11001100


run 15000ns
