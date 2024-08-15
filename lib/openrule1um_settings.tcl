set ROOT_DIR $env(ROOT_DIR)
set LIB_PATHS "$ROOT_DIR"
set LIBS "${ROOT_DIR}/lib/openrule1um.lib"
set LEFS "${ROOT_DIR}/lib/openrule1um.tlef ${ROOT_DIR}/lib/openrule1um.lef"
set GDSS "${ROOT_DIR}/lib/openrule1um.gds"

# TODO: Do the characterization of the lib
set LIBS_BC "${ROOT_DIR}/lib/openrule1um.lib"
set LIBS_WC "${ROOT_DIR}/lib/openrule1um.lib"

if { [info exists ::env(PDK_ROOT)]} {
  # Setting a default
  set PDK_ROOT $::env(PDK_ROOT)
} else {
  # Setting a default
  set PDK_ROOT "$::env(HOME)/.klayout"
}
# TODO: No RC rules
set RCX_RULES "$PDK_ROOT/openrule1umA/libs.tech/openlane/rules.openrcx.openrule1umA.nom.calibre"
