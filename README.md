# FPGA_FIR_lopass_filter
Matlab files, HDL implementation, and simulation.

I designed an FIR lo pass filter in matlab. I converted the filter to fixed point in matlab, and then implemented it in HDL.

signal_generation.m is a matlab script that creates the low pass filter, and converts it to fixed point
hdl_ref_x.txt is a text file output from the matlab script containing the input test data, in this case a noisy signal with a 5KHz tone to be recovered
hdl_ref_y.txt is a text file output from the matlab script containing the fixed point filter outputs to the input x
hdl_ref_coefficients.txt is a text file output from the matlab script containing the fixed point filter coefficients
top.v is a verilog implementation of the FIR filter
sim.sv is the test bench of top.v
