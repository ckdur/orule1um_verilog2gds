ROOT_DIR=$(abspath ../)
include $(ROOT_DIR)/settings.mk
PNR_DIR=$(abspath ../pnr)
SYN_DIR=$(abspath ../syn)
LIB_DIR=$(abspath ../lib)
SIGN_DIR=$(abspath .)

GDS=$(SIGN_DIR)/outputs/$(TOP).gds
export GDS
SPICE=$(SIGN_DIR)/outputs/$(TOP).spice
export SPICE
DEF=$(PNR_DIR)/outputs/$(TOP).def
export DEF
NET=$(PNR_DIR)/outputs/$(TOP)_pg.v
export NET
LEF=$(LIB_DIR)/$(TECH).lef
export LEF
TLEF=$(LIB_DIR)/$(TECH).defin.tlef
export TLEF
TGDS=$(LIB_DIR)/$(TECH).gds
export TGDS
MAP=$(LIB_DIR)/$(TECH).map
export MAP
export TOP

PDK_ROOT?=$(HOME)/.klayout/salt

gds: $(GDS)

$(GDS): $(SIGN_DIR)/scripts/import_def.rb $(DEF) $(LEF) $(TLEF) $(TGDS)
	mkdir -p $(SIGN_DIR)/outputs
	klayout -z -rx -rd input=$(DEF) -rd macros=$(TGDS) -rd map=$(MAP) -rd lefs=$(LEF),$(TLEF) -rd output=$(GDS) -rm $(SIGN_DIR)/scripts/import_def.rb

view: $(GDS)
	klayout $(GDS)

spice: $(SPICE)

$(SPICE): $(SIGN_DIR)/tcl/spice.tcl $(DEF)

drc: $(GDS) $(SIGN_DIR)/scripts/$(TECH).drc
	mkdir -p $(SIGN_DIR)/reports
	klayout -b -rd input=$(GDS) -rd report=$(SIGN_DIR)/reports/drc.rpt -r $(SIGN_DIR)/scripts/$(TECH).drc

lvs: $(GDS) $(SPICE) $(NET)
# TODO: For LVS to work, we need to extract a .spice from a _pg.v file
	klayout -b -r $(PDK_ROOT)/sky130A/libs.tech/klayout/lvs/sky130.lvs -rd input=$(GDS) -rd report=$(SIGN_DIR)/reports/lvs_report.lvsdb -rd schematic=$(SPICE) -rd thr=2 -rd run_mode=deep -rd target_netlist=$(SIGN_DIR)/outputs/$(TOP).ext.spice -rd scale=true -rd lvs_sub=VNB

clean:
	rm -vrf  outputs reports

.PHONY: all manual clean

