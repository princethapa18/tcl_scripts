#!/usr/bin/tclsh

# Array 
# Syntax:
set ArrayName(index) value

set Days(1) "Monday"
set Days(2) "Tuesday"
set Days(3) "Wednesday"
set Days(4) "Thursday"
set Days(5) "Friday"
set Days(6) "Saturday"
set Days(7) "Sunday"

for {set i 1} {$i <= [array size Days]} {incr i} {
  puts "Days($i) : $Days($i)"
}

for {set i 0} {$i < [array size Days2]} {incr i} {
  puts "Days2($i) : $Days2($i)"
}

# using array set

array set Days1 {1 "Monday"}
array set Days1 {2 "Tuesday"}
array set Days1 {3 "Wednesday"}

puts "$Days1(1) $Days1(2) "

# array set Days2 { } ; # empty array

array set Days2 {
    1 Monday
    2 Tuesday
    3 Wednesday
    4 Thursday
    5 Friday
    6 Saturday
    7 Sunday
}

for {set i 1} {$i <= [array size Days2]} {incr i} {
  puts "Days2($i) : $Days2($i)"
}


# associated array
array set Employee { 
      "Name" "Shravan"
      "Age"  23
      "Id"   100
      "Dept" "CAE"
}

set keys [array names Employee]

puts "size of array Employee : [array size Employee]"

foreach key $keys {
  puts "Employee($key) : $Employee($key)"
}

unset Employee

puts "size of array Employee : [array size Employee]"



