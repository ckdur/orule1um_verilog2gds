# OpenRule1um verilog to gds attempt

This repository contains an attempt to do verilog to GDS flow.

The run contains:

- Standard cells
- Synthesis
- Place and Route
- Signoff
- DRC

To test this project, please run the following commands:

```
# Synthesis
make -C syn all

# Place and Route
make -C pnr all

# Signoff
make -C signoff gds

# DRC (It just outputs the report file)
make -C signoff drc
```

## Errdata

- The DRC is not complete. Alineation of the CNT to VIA1 is not done yet as the
LEF files do not have definition of CNT. This needs to be done manually.
- There is no way to convert the vias 1 and 2 with the DM implementation. It seems
it needs an actual klayout script exclusively for the VIARULEs
- The DM_pscn cannot be over itself. ... why? Just join them together in the DRC? 
But because of that probably Y-symmetry is not possible in the cells
- No LVS yet. We need a way to convert verilog to spice. This task was done via
magic before, but openrule1um does not have magic technology files

