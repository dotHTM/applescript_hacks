tell application "iTunes"
	
	set theSel to selection
	
	repeat with anTrack in theSel
		set similarTracks to (tracks whose name is (name of anTrack as string) and artist is (artist of anTrack as string) and time is (time of anTrack as string))
		set origTime to time of anTrack
		set origArtist to artist of anTrack
		
		set totalPlays to 0
		
		if (count of similarTracks) > 1 then
			repeat with anSimTrack in similarTracks
				tell anSimTrack
					
					
					set simPC to played count
					set totalPlays to totalPlays + simPC
					set played count to 0
					set comment to "Dupe? " & comment
					
					
				end tell
			end repeat
			
			set played count of anTrack to totalPlays
			
		end if
		
	end repeat
end tell