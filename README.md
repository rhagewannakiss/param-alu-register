# Parametric ALU Register

> *Implementation of a parametric ALU with output register as a homework for "Introduction to Architecture of Computing Systems" 2026*

## Documentation

The file [`makarskaia_verilog.pdf`](makarskaia_verilog.pdf) contains a full project report, including:

- Functional description
- Structural diagram (drawn in draw.io)
- Parameter and port tables
- Timing and reset description
- Test scenario
- Verilog source code
- Simulation waveforms analysis

## How It Works

The `alu_register` module performs one of four arithmetic or logical operations on two input operands (`first_i` and `second_i`) according to the `opcode_i` value. The result is **registered** and appears on the output (`result_o`) on the next clock cycle only when the `valid_i` signal is asserted. 

The `valid_o` output is a registered version of `valid_i`, indicating that a valid result is available on `result_o`. The module features:
- Asynchronous active-low reset for the `valid_o` register
- Non-resettable result register
- Parameterized data width (`WIDTH`)

Supported operations:

| opcode | Operation                  |
|--------|----------------------------|
| `00`   | Unsigned addition          |
| `01`   | NAND (`~(first & second)`) |
| `10`   | Arithmetic left shift      |
| `11`   | Not equal (`second != first`) |

## Project Structure

The project includes:

- `src/alu_reg.sv` — main module implementation
- `src/alu_reg_tb.sv` — testbench with full functional verification
- `Makefile` — build automation

## Requirements

- `Icarus Verilog` — for compilation and simulation
- `GTKWave` — for viewing waveforms

## Installation

```sh
git clone git@github.com:rhagewannakiss/param-alu-register.git
cd param-alu-register
