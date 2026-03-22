MODULE = src/alu_reg.sv
TESTBENCH = src/alu_reg_tb.sv
TARGET = alu_reg
VCD_FILE = alu_reg.vcd

$(TARGET): $(MODULE) $(TESTBENCH)
	iverilog -o $@ $^

test: $(TARGET)
	./$(TARGET)

view: $(VCD_FILE)
	gtkwave $(VCD_FILE)

clean:
	rm -f $(TARGET) $(VCD_FILE)

help:
	@echo "  test  - Compile and run testbench"
	@echo "  view  - Open waveform in GTKWave (requires gtkwave)"
	@echo "  clean - Remove generated files"
	@echo "  help  - Show this help"

.PHONY: test view clean help