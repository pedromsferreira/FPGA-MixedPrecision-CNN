# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_BUS1 {
numFilters { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
numKernels { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
inputMapSizeX { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
inputMapSizeY { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
ctrl { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict BUS1 $port_BUS1


