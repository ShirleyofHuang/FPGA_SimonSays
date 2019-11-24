# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns fsmachine.v

# Load simulation using mux as the top level simulation module.
vsim fsmachine

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

force {clicked} 0 0, 1 20 -r 40
force {reset_n} 0 0, 1 20
force {clock} 0 0, 1 10 -r 20
force {direction} 00 0, 01 50
force {direction} 01 50, 10 100
force {direction} 10 100, 11 150

run 150ns
