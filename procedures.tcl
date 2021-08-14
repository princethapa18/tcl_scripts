#!/usr/bin/tclsh

if 0 {
   this is a multiline command
   tcl procedures
   the proc command
   Syntax for creating procedures:
   
   proc procedure_name {arg1 arg2 ... argn} {
    # do something ...
   }
}

set color_names_list "red blue green yellow"

# llength list Returns the number of elements in list.
set list_size [llength $color_names_list]

puts "size of the list is $list_size"

# procedure printList prints all the items in a list
# takes a list as a parameter
# A procedure that does not return anything

proc printList { my_list } {
  foreach item $my_list {
    puts "$item" 
  }
}

printList $color_names_list ; # printList procedure is called here $color_names_list is passed as a parameter

set intList {1 2 5 6 12 15 19} ; # intList is a list of integers

printList $intList ; # printList procedure is called here $intList is passed as a parameter

set x 3
set y 9

# returning something from a procedure
proc add {a b} {
  return [expr $a + $b]
}

set sum [add $x $y]

puts "$x + $y is : $sum"

puts [add 10 25]

# working with arguments

set num1 0
set num2 0

if {$argc == 2} {
  global num1 ; # global ????
  global num2
  set num1 [lindex $argv 0]
  set num2 [lindex $argv 1]
}

puts "$num1 + $num2 is : [add $num1 $num2]" 


proc sum_of_list { lst } {
  set sum 0
  foreach item $lst {
    set sum [expr $sum + $item]
  }
  return $sum
}

set sum [sum_of_list $argv] 

puts "sum of arguments : $sum"


