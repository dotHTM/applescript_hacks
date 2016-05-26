tell application "QuickTime Player"
	
	set isPlaying to (playing of document 1)
	
	set doc1time to current time of document 1
	
	tell every document
		
		if isPlaying then pause
		set current time to doc1time
		if not isPlaying then play
		
	end tell
	
end tell