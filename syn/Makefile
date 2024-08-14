ROOT_DIR=$(abspath ..)
include $(ROOT_DIR)/settings.mk
SYN_DIR=$(abspath .)

export SYN_DIR
export SYN_SRC
export TOP
export ROOT_DIR
export TECH

SYN_NET=$(SYN_DIR)/outputs/$(TOP)_net.v

all: $(SYN_NET)

$(SYN_NET): $(SYN_DIR)/tcl/synthesis.tcl $(SYN_SRC) $(SYN_DIR)/tcl/rtl.sdc.tcl
	yosys -h tcl $(SYN_DIR)/tcl/synthesis.tcl | tee -a yosys.log

manual: $(SYN_DIR)/tcl/synthesis.tcl $(SYN_SRC) $(SYN_DIR)/tcl/rtl.sdc.tcl
	yosys -h tcl

clean:
	rm -rfv *.log* *.cmd* *_intermediate.v *_net.v *.sdf fv reports outputs *.tstamp

.PHONY: clean

