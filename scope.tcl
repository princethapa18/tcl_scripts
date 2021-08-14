#!/usr/bin/tclsh

if 0 {
   this is a multiline comment
   scope
   Global vs Local variables
   global keyword
   
   Variables defined inside a procedure are called local variables.
   Variables referenced outside any
   procedure are called global variables.
}


set a 12; # global a
set b 15; # global b

proc someProc {} {
  puts [expr $a + $b]; # will this work?
  set x 5
}

puts $x; # will this work?

someProc

proc someProc1 {} {
  global a
  global b
  set a [expr $a * 5]
  set b [expr $b * 4]
  set x 5
  
  return [expr $a + $b]
}

puts someProc1 ; # what will it print?


puts "a:  $a  and b : $b"

proc someProc2 {} {
  set a 14 ; # local a
  set b 16 ; # local b
  set x 5  ; # local x
}

someProc2

puts "a:  $a  and b : $b"

