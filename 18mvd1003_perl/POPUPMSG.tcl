
set x 10
set y 5

proc sum {widget} {
   	set text Sum
 	global x
	global y		
    if {$text == "Sum"} {
        set z [expr $x + $y]
	}
      
      
    set answer [tk_messageBox -message "The sum is $z" \
        -icon question -type ok \
        -detail "Select \"Ok\" to make the application exit"]
    
               $widget configure -text $text
    }
    
   


proc Diff {widget} {
   	set text Diff
 	global x
	global y		
    if {$text == "Diff"} {
        set z [expr $x - $y]
    }
    set answer [tk_messageBox -message "The DIff is $z" \
        -icon question -type ok \
        -detail "Select \"Ok\" to make the application exit"]
    $widget configure -text $text
}

proc Mul {widget} {
   	set text Mul
 	global x
	global y		
    if {$text == "Mul"} {
        set z [expr $x * $y]
    }
    set answer [tk_messageBox -message "The Mul is $z" \
        -icon question -type ok \
        -detail "Select \"Ok\" to make the application exit"]
    $widget configure -text $text
}

proc Div {widget} {
   	set text Div
 	global x
	global y		
    if {$text == "Div"} {
        set z [expr $x / $y]
    }
    set answer [tk_messageBox -message "The Div is $z" \
        -icon question -type ok \
        -detail "Select \"Ok\" to make the application exit"]
    $widget configure -text $text
}


button .b1 -text "Sum" \
    -command "sum .b1"
button .b2 -text "Diff" \
    -command "Diff .b2"
button .b3 -text "Mul" \
    -command "Mul .b3"
button .b4 -text "Div" \
    -command "Div .b4"

button .b5 -text 'EXIT"\
	-command "destroy ."

grid .b1 -row 0 -column 0
grid .b2 -row 0 -column 1
grid .b3 -row 1 -column 0
grid .b4 -row 1 -column 1
grid .b5 -row 2 -column 2
