tell application "Finder"
	
	set theSel to selection
	activate
	delay 0.1
	tell application "System Events" to key code 125 -- Down 
	
	repeat with anFile in theSel
		
		if kind of anFile is not "folder" then
			set parentDirName to name of folder of anFile as string
			if (name of anFile as string) does not start with parentDirName then
				set name of anFile to parentDirName & " - " & (name of anFile)
			end if
		end if
		
	end repeat
	
end tell