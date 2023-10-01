transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/writeback.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/sl2.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/signext.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/regfile.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/processor_arm.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/mux2.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/memory.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/maindec.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/imem.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/flopr.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/fetch.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/execute.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/decode.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/datapath.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/controller.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/aludec.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/alu.sv}
vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/adder.sv}
vcom -2008 -work work {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/dmem.vhd}

vlog -sv -work work +incdir+/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor {/home/kevin/MEGA/arqui/ArqComputadoras/PipelineProcessor/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
