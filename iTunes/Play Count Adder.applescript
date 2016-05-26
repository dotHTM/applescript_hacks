tell application "iTunes"
	
	set theSel to selection
	
	set numberToAdd to missing value
	
	set mssgText to "Add how many plays to the selected tracks?"
	
	repeat while numberToAdd is missing value
		
		display dialog mssgText default answer "0" buttons {"Add", "Cancel"} default button 1
		copy the result as list to {text_returned, button_pressed}
		
		try
			
			set numberToAdd to text_returned as integer
			
		on error
			set mssgText to "Please try again, I didn't understand that.\n\nAdd how many plays to the selected tracks?"
			
		end try
		
	end repeat
	
	if button_pressed is "Add" then
		repeat with anTrack in theSel
			
			tell anTrack
				set oldCount to played count
				set played count to oldCount + numberToAdd
			end tell
			
		end repeat
	end if
	
end tell
