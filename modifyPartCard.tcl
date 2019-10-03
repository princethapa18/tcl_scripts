# Author : Prince Thapa 07-04-2017 
# To Modify IORT and TCONT value for PART CARD in a pc file
# IORT value is set empty
# TCONT value will be taken from hcont incase of BIW.
# For plastic part TCONT will be set as 0.0

# procedure to read and modify a file and move it to the outDir
proc readFile {inputFile outDir} {
	
        set idx [string last "." $inputFile]        
	set temp [string replace $inputFile $idx $idx "_out."]     ; # input = filename.pc   output = filename_out.pc 

	# open the input file	
	set in  [open $inputFile r] 
	
	# write a temporary output file
	set out [open $temp     w]     
        
        set insidePartCard 0	
	set count 0
        
	while { [eof $in] != 1} {
		set line [gets $in]
		set outLine $line

                # Check for PART CARD 
		if { [string first "PART  /" $line] >= 0 } {
			set insidePartCard 1	
		}
		
		# Modify IORT and TCONT inside the PART CARD
		if { $insidePartCard == 1 } {
			
			# Modify TCONT
			# get hcont value
			# goto line containing TCONT value
			# set TCONT = hcont

			# Modify IORT
			# check for IORT 			
			if { [regexp "IORT BLNK" $line]  } {
				incr count
				puts $out $outLine	; # write this line to the temp file				
				continue			
		        }
			
			# set IORT value empty		
			if { $count == 1} {
				set outLine [string replace $line 4 4 " "]
				set count 0
			}
			# ------------------------------------------------

			# End of PART CARD
			if { [regexp "END_PART" $line]  } {
				set insidePartCard 0
			}
		}

		puts $out $outLine	; # write this line to the temp file	
	}

	# close the input file
	close $in
	close $out
	
	
	exec mv $temp $outDir  ; # moves output files to the output folder
}

# --------------------------------------------------------------
# create a new folder named "output" to keep all the outputfiles

if { $argc > 0} {
	set curDir  [lindex $argv 0]
} else {
	set curDir [exec pwd]
}

cd $curDir
set newDir [file join $curDir "output"]

if { ![file exist $newDir] } {
	file mkdir $newDir	
} 

#-------------------------------------------------------------
# get a list of pc files in a folder

set fileList [glob -nocomplain *.pc]
foreach item $fileList {
	readFile $item $newDir
}

puts "Modified pc files moved to $newDir"

# ------------------------------------------------------------
# rename files to the original name
cd $newDir
set fileList [glob -nocomplain *.pc]
foreach item $fileList {
	set from [string last "_" $item]        
	set to   [string last "."    $item]	
	set newName [string replace $item $from $to "."]
	file rename -force $item $newName
}






 



