default: compile execute display


compile:
	iverilog test.v $(wildcard ./src/*.v)
execute:
	vvp a.out

display:
	gtkwave *.vcd