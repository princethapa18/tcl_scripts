# tcl script to change the ownership of file

set parentPath [exec pwd]
cd $parentPath

puts " $parentPath ownership changed\n"
#exec chown <user> $parentPath
exec chown thapa $parentPath

set childList [exec ls]

proc process {childList parentPath} {  
   foreach item $childList {
	cd $parentPath      
        if {[file isdirectory $item]} {               	
		set childPath [file join $parentPath $item]
		puts " $childPath ownership changed\n"
                exec chown thapa $item

		cd $childPath 
                set childs [exec ls]
                puts " Going inside directory: $childPath\n"
        	process $childs $childPath
    	} elseif {[file isfile $item]} {
                set filename [file join $parentPath $item]           
		puts " $filename ownership changed\n"
		exec chown thapa $item       
        }
   }
}

process $childList $parentPath


