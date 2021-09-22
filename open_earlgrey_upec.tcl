# Author: Dino Mehmedagić

# Tcl script loads all OpenTitan Earl Grey HDL files with the top_level_upec as the top level file,
# containing two instances of the Earl Grey chip, for verifivcation with UPEC

# @lang=tcl @ts=8# @lang=tcl @ts=8# findFiles
# basedir - the directory to start looking in
# pattern - A pattern, as defined by the glob command, that the files must match
proc findFiles { basedir pattern } {

    # Fix the directory name, this ensures the directory name is in the
    # native format for the platform and contains a final directory seperator
    set basedir [string trimright [file join [file normalize $basedir] { }]]
    set fileList {}

    # Look in the current directory for matching files, -type {f r}
    # means ony readable normal files are looked at, -nocomplain stops
    # an error being thrown if the returned list is empty
    foreach fileName [glob -nocomplain -type {f r} -path $basedir $pattern] {
        lappend fileList $fileName
    }

    # Now look for any sub direcories in the current directory
    foreach dirName [glob -nocomplain -type {d  r} -path $basedir *] {
        # Recusively call the routine on the sub directory and append any
        # new files to the results
        set subDirList [findFiles $dirName $pattern]
        if { [llength $subDirList] > 0 } {
            foreach subDirFile $subDirList {
                lappend fileList $subDirFile
            }
        }
    }
    return $fileList
 }

restart -force

cd "~/opentitan"

set_read_hdl_option -golden -verilog_version sv2012

# read_verilog -golden  -pragma_ignore {} -version sv2012 ./hw/ip/prim/rtl/prim_util_pkg.sv

# read_verilog -golden  -pragma_ignore {} -version sv2012 ./build/lowrisc_systems_chip_earlgrey_verilator_0.1/src/lowrisc_prim_abstract_buf_0/prim_buf.sv

# read_verilog -golden  -pragma_ignore {} -version sv2012 ./build/lowrisc_systems_chip_earlgrey_verilator_0.1/src/lowrisc_prim_abstract_prim_pkg_0.1/prim_pkg.sv

# set pkgIPfiles [findFiles ./hw/ip "*_pkg.sv"]

# set hdlIPfiles [findFiles ./hw/ip  "*.sv"]

# set pkgvendorfiles [findFiles ./hw/vendor  "*_pkg.sv"]

# set hdlvendorfiles [findFiles ./hw/vendor  "*.sv"]

# set pkgtoplvlfiles [findFiles ./hw/top_earlgrey  "*_pkg.sv"]

# set hdltoplvlfiles [findFiles ./hw/top_earlgrey  "*.sv"]

set pkgbuildfiles [findFiles ./build_upec/lowrisc_systems_chip_earlgrey_verilator_0.1/src  "*_pkg.sv"]

set hdlbuildfiles [findFiles ./build_upec/lowrisc_systems_chip_earlgrey_verilator_0.1/src  "*.sv"]

# foreach f $pkgIPfiles {
# 	puts "$f"
# 	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
# }

# foreach f $hdlIPfiles {
# 	puts "$f"
# 	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
# }

# foreach f $pkgvendorfiles {
# 	puts "$f"
# 	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
# }

# foreach f $hdlvendorfiles {
# 	puts "$f"
# 	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
# }

# foreach f $pkgtoplvlfiles {
# 	puts "$f"
# 	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
# }

# foreach f $hdltoplvlfiles {
# 	puts "$f"
# 	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
# }

foreach f $pkgbuildfiles {
	puts "$f"
	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
}

foreach f $hdlbuildfiles {
	puts "$f"
	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
}

read_verilog -golden  -pragma_ignore {} -version sv2012 ./hw/top_earlgrey/rtl/top_level_upec.sv

set_elaborate_option -top verilog!work.top_level_upec

set_elaborate_option -loop_iter_threshold 1000

elaborate -golden

set_compile_option -macro_iterations 512

compile -golden