# taking arguments in tcl 

# argc means no. of arguments passed
# argv0 name of the script
# arrgv array containing arguments

puts "There are $argc arguments to this script"
puts "The name of this script is $argv0"

if {$argc > 0} {
   puts "The other arguments are: $argv" 
}    

for {set i 0} {$i < [llength $argv]}  {incr i}  {
    puts "arg $i is [lindex $argv $i]"
}


