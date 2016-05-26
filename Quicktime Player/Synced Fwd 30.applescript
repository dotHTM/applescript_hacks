tell application "QuickTime Player"
	
	set isPlaying to (playing of document 1)
	
	set doc1time to current time of document 1
	
	tell every document
		
		set current time to doc1time + 30
		
	end tell
	
end tell