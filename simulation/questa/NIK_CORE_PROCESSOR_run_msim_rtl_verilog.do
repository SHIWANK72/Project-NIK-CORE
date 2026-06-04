transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+D:/My_Processor_Design {D:/My_Processor_Design/processor_top.v}
vlog  -work work +incdir+D:/My_Processor_Design {D:/My_Processor_Design/reg_file.v}
vlog  -work work +incdir+D:/My_Processor_Design {D:/My_Processor_Design/pc.v}
vlog  -work work +incdir+D:/My_Processor_Design {D:/My_Processor_Design/instruction_mem.v}
vlog  -work work +incdir+D:/My_Processor_Design {D:/My_Processor_Design/control_unit.v}
vlog  -work work +incdir+D:/My_Processor_Design {D:/My_Processor_Design/ALU.v}

