# 29 Mar 2022
# run like this tclsh chown.tcl <username>
# tcl script to change the ownership of file

set parentPath [exec pwd]
cd $parentPath

#set user gns137
#set user thapa

set user [lindex $argv 0]
puts "user name : $user\n"

puts " $parentPath ownership changed\n"
#exec chown <user> $parentPath
exec chown $user $parentPath

set childList [exec ls]

proc process {childList parentPath user} {  
   foreach item $childList {
	cd $parentPath      
        if {[file isdirectory $item]} {               	
		set childPath [file join $parentPath $item]
		puts " $childPath ownership changed\n"
                exec chown $user $item

		cd $childPath 
                set childs [exec ls]
                puts " Going inside directory: $childPath\n"
        	process $childs $childPath $user
    	} elseif {[file isfile $item]} {
                set filename [file join $parentPath $item]           
		puts " $filename ownership changed\n"
		exec chown $user $item       
        }
   }
}

process $childList $parentPath $user
