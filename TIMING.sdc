# Define the clock frequency (100 MHz means 10ns period)
create_clock -period 10.000 -name clk [get_ports {clk}]

# Set input/output delays (optional but good for professional practice)
set_input_delay -clock clk 1.0 [get_ports {rst}]
set_output_delay -clock clk 1.0 [get_ports {cpu_result[*]}]