#!/usr/bin/tclsh

# strings


# string manipulation

set name "Prince Thapa"

puts [string length $name]

if 0 {
	string compare ?-nocase? ?-length len? str1 str2
	-nocase ---> case insenstive operation
	-length ---> compare str1 and str2 upto some length

    Returns 0 if equal 
	-1 if str1 < str2 , else 1
}
puts [string compare -nocase "prince thapa" $name]
puts [string compare "prince thapa" $name]
puts [string compare -nocase -length 4 "prin" $name]  ; # compare first 4 characters

# string equal ?-nocase? str1 str2
# returns 1 if they are same, else 0

puts [string equal "prince thapa" $name]
puts [string equal -nocase "prince thapa" $name]

if 0 {
	Glob style pattern matching
	*       Matches any sequence of zero or more characters.
    ?       Matches any single character.
    [chars] Matches any single character in chars. If chars contains a
            sequence of the form a-b then any character between a and b, 
			inclusive, will match.
    \x      Matches the single character x. This provides a way to avoid special
            interpretation for any of the characters *?[]\ in the pattern.
	-------------------------------------------------------------------------------		
    Many simple things can be done easily with glob-style patterns. For example,
    “*.[ch]” matches all strings that end with either “.c” or “.h”.
	
}
puts "************* string match commands *****************"
#puts [string match a* alpha] ;#matches
puts [string match *e* boxer] ;#matches
#puts [string match b? alpha]

#puts [string match a alpha] ; # doesn't match
#puts [string match a???? alpha] ; # matches

#puts [string match {[ab]*x} tcellox] ; #doesn't match
#puts [string match {[a-z1-5]*x} abdef56ddefx]

set pat {[x-z1-5]t*.pc}
set filename "xyz123452341test.pc"
puts [regexp $pat $filename] ; # matches  returns 1

set filename1 "zxy1236test1.pc"
puts [regexp $pat $filename1] ; # doesn't match returs 0

if 0 {
  the glob command
  Return names of files that match patterns 
  
  glob ?switches...? pattern ?pattern ...?
  
  Supported switches are:

    -directory directory
    -join
    -nocomplain
    -path pathPrefix
    -tails
    -types typeList
	--
}

puts "************* glob commands *****************"

proc printList {my_list} {
    puts "**********"
	foreach item $my_list {
		puts $item
	}
}

# find all the files ending with '.tcl'
set files [glob -type f *.tcl]
# find all the files starting with 'ar' and ending with '.tcl'
set files1 [glob -type f ar*.tcl]  
# find all the subdirectories
set subdirs [glob -type d *] 
# find all the subdirectories whose name starts with a
set subdirs_startingWith_a [glob -type d a*]

printList $files
printList $files1
printList $subdirs
printList $subdirs_startingWith_a






