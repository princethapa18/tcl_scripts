#!/usr/bin/tclsh

# file.tcl filename.pc

if {$argc != 1} {
	puts "please enter filename"
}

set inputFile [lindex $argv 0] 

# File I/O

#  open inputFile
set fid [open $inputFile r]

# create and write to a new file
set out_fid [open "out_file.txt" w+]

puts "fid : $fid   out_fid : $out_fid\n"

# reading the file line by line

set doWrite 0
while { [eof $fid] != 1} {
	set line [gets $fid]
	global doWrite 
	if { [regexp "NAME" $line] == 1 } {
		set doWrite 1
		continue
	} elseif { [regexp "END" $line] == 1 } {
		set doWrite 0
	}

	if { $doWrite } {
	    # prints the current line
	    puts $line
		set outline $line
		# write outline to the out_file
		puts $out_fid $outline
	}
}

# close the inputFile
close $fid

# close the out_file
close $out_fid


