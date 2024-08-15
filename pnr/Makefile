ROOT_DIR=$(abspath ../)
include $(ROOT_DIR)/settings.mk
PNR_DIR=$(abspath .)
SYN_DIR=$(abspath ../syn)

export SYN_DIR
export PNR_DIR
export SYN_SRC
export TOP
export ROOT_DIR
export PX
export PY
export PR
export X
export Y
export TECH

SYN_NET=$(SYN_DIR)/$(TOP)_net.v
export SYN_NET

all: $(PNR_DIR)/outputs/$(TOP).def

$(PNR_DIR)/outputs/$(TOP).def: $(SYN_DIR)/$(TOP)_net.v $(PNR_DIR)/tcl/pnr.tcl
	openroad -exit $(PNR_DIR)/tcl/pnr.tcl | tee -a openroad.log

manual: $(SYN_DIR)/$(TOP)_net.v $(PNR_DIR)/tcl/pnr.tcl
	openroad -gui $(PNR_DIR)/tcl/pnr.tcl | tee -a openroad.log

debug: $(SYN_DIR)/$(TOP)_net.v $(PNR_DIR)/tcl/pnr.tcl
	gdb --args openroad -gui $(PNR_DIR)/tcl/pnr.tcl

clean:
	rm -vrf fv/ outputs reports *.size *.log DesignLib

.PHONY: all manual clean

