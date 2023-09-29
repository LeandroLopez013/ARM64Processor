transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/writeback.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/sl2.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/signext.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/regfile.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/processor_arm.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/mux2.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/memory.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/maindec.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/imem.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/flopr.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/fetch.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/execute.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/decode.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/datapath.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/controller.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/aludec.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/alu.sv}
vlog -sv -work work +incdir+/home-local/visitante/ArqComputadoras/PipelineProcessor {/home-local/visitante/ArqComputadoras/PipelineProcessor/adder.sv}
vcom -93 -work work {/home-local/visitante/ArqComputadoras/PipelineProcessor/dmem.vhd}

