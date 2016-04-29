on run
	
	set testTXT to "Jackie Jackie (Spend This Winter With Me)"
	
	change_case(justTheLetters(testTXT), 0)
	
end run


on justTheLetters(inputString)
	
	set theLetters to "qwertyuiopasdfghjklzxcvbnm"
	
	set outputString to ""
	
	repeat with anChar in inputString
		
		if theLetters contains anChar then set outputString to outputString & anChar
		
	end repeat
	
	return outputString
end justTheLetters


on change_case(this_text, this_case)
	if this_case is 0 then
		set the comparison_string to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		set the source_string to "abcdefghijklmnopqrstuvwxyz"
	else
		set the comparison_string to "abcdefghijklmnopqrstuvwxyz"
		set the source_string to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	end if
	set the new_text to ""
	repeat with this_char in this_text
		set x to the offset of this_char in the comparison_string
		if x is not 0 then
			set the new_text to (the new_text & character x of the source_string) as string
		else
			set the new_text to (the new_text & this_char) as string
		end if
	end repeat
	return the new_text
end change_case

