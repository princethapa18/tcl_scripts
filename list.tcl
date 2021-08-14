#!/usr/bin/tclsh

# string
set var "Hello"
append var " World" ; # append " World"  to a string variable 'var'

puts $var

set myVariable "some string"
puts $myVariable

# integer
set myVariable 18
puts $myVariable
puts [expr $myVariable + 6 + 9]

set new_var [concat $myVariable "test"]
puts $new_var

# List

# Creating a list by setting a variable to be a list of values
set color_names_list "red blue green"

# accesing an item in the list
# [lindex <list> <index>]

puts "color name at index 1 is : [lindex $color_names_list 1]" ;

# llength list Returns the number of elements in list.
set list_size [llength $color_names_list]

puts "size of the list is $list_size"

# iterating a list

# using for
for {set idx 0} {$idx < $list_size} {incr idx} {
    puts "string at index $idx is [lindex $color_names_list $idx]"
}

# using foreach
set idx 0
foreach str $color_names_list {
    puts "string at index $idx is $str" 
    incr idx	; # increment idx by 1
}

# by using split command

set str "hello this is tcl"
set stringlist [split $str " "] 

foreach item $stringlist {
    puts $item
}

set presentWorkingDirectory [exec pwd]
puts $presentWorkingDirectory

set strlist [split $presentWorkingDirectory "/"]

foreach item $strlist {
  puts $item
}

# by using the list command
set int_list [list 12 13 14 15] ; # list of integers

foreach item $int_list {
  puts $item
}


set my_list [list "abc" "def" "fgh" 12 13 16.7 18.9 {4 5 6}] ; # mixed list contains string, integers, floats and a list of integers

foreach item $my_list {
  puts $item
}

if 0 {
 adding elements to a list
 lappend varName ?arg1 arg2 ... argn?
     Appends the args to the list in variable varName treating each arg as a list element.
}

puts "********* no. of strings in stringlist before lappend : [llength $stringlist]"

lappend stringlist "and" "tk" "some" "more"     ; # " " 1 item
lappend stringlist {hello world} {test1 test2}  ; # { } 1 item

puts "********** no. of strings in stringlist after lappend : [llength $stringlist]"
foreach item $stringlist {
    puts $item
}


