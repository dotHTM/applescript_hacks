on run
	
	digitizer(3, 4)
	
end run


on digitizer(theNumber, theLength)
	
	set theString to theNumber as string
	
	repeat while (count of theString) < theLength
		
		set theString to "0" & theString
		
	end repeat
	
	return theString
end digitizer