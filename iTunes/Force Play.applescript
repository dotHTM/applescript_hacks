tell application "iTunes"
	
	
	set theSel to selection
	
	play item 1 of theSel
	
	repeat with i from 1 to count of theSel
		
		set oldCurr to current track
		
		set player position to ((duration of current track) - 1)
		
		repeat while oldCurr is current track
			delay 1
		end repeat
		
		
	end repeat
	
end tell