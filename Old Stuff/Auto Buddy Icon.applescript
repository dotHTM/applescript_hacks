(*

Auto Buddy Icon - Sets Buddy Icon for AOL Instant Messanger to your iSight
camera or currently playing iTunes album art.

This script is a colaboration between Mike Henley and Mike Cramer.

Original prototype by Mike Henley on March 10, 2009.
Other features added by Mike Henley and Mike Cramer on March 11, 2009.

This script relies on the isightcapture CLI program to be installed in the
~/Library/Scripts/Applications/iChat/ folder.

The isightcapture program can be downloaded from
http://www.intergalactic.de/pages/iSight.html where the owner makes no claim
to any specific licence.  If you know of a GNU GPL or other similar FOSS
solution to taking pictures via a Firewire or USB camera on the Mac OS X,
then suggestions are welcome.

If you have questions, email Mike Cramer at kiodane+iChatIcon@gmail.com

*)


------------------------------------------------------------------------------------
------------------------------------------------------------------------------------


property looptime : 30
property iChatIconSource : "iSight"

------------------------------------------------------------------------------------

on run
	set_source()
	idle
end run


------------------------------------------------------------------------------------

on reopen
	set_source()
end reopen

------------------------------------------------------------------------------------

on idle
	tell application "System Events" to set iChatIsRunning to (name of processes) contains "iChat"
	
	if iChatIsRunning then
		if iChatIconSource is "iTunes" then
			ituenser()
			
		else if iChatIconSource is "iSight" then
			isightser()
			
		else if iChatIconSource is "unsupported" then
			errorSource()
			
		end if
	else
		--When iChat quits, the assistant should quit too.
		quit me
	end if
	
	return looptime
end idle

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

on set_source()
	set OldiChatIconSource to iChatIconSource
	
	set iChatIconSource to (choose from list {"iSight", "iTunes"} with title "iChat icon Source" with prompt "What image would you like to use as your iChat Buddy image?") as text
	
	--If no choice, then old setting
	if iChatIconSource is "false" then
		set iChatIconSource to OldiChatIconSource
	else
		log iChatIconSource
	end if
	
	
	--set loop time
	set fflag to 0
	repeat while fflag = 0
		display dialog "Change the loop time while paused?" default answer looptime buttons {"Quit", "Okay"} default button 2 with title "Buddy picture Paused"
		copy the result as list to {text_returned, button_pressed}
		try
			set looptime to text_returned as integer
			if looptime > 0 then
				set fflag to 1
			end if
		end try
	end repeat
	
	if button_pressed = "Quit" then quit
	
end set_source

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

on isightser()
	try
		tell application "Finder" to set isCLIpresent to (file "Library:Scripts:Applications:iChat:isightcapture" of home exists)
		
		if isCLIpresent then
			do shell script "~/Library/Scripts/Applications/iChat/isightcapture -w 86 -h 64.5 -t tiff ~/Library/Scripts/Applications/iChat/ichat.tiff; sips -c 64 64 ~/Library/Scripts/Applications/iChat/ichat.tiff"
			tell application "Messages" to set image to (read ((path to scripts folder from user domain as string) & "Applications:iChat:ichat.tiff" as alias) as TIFF picture)
		else
			set iChatIconSource to "unsupported"
			display dialog "The file \"~/Library/Scripts/Applications/iChat/isightcapture\" is missing.  Did you install it correctly?" buttons {"OK"} default button 1
		end if
	end try
end isightser

------------------------------------------------------------------------------------

on ituenser()
	tell application "System Events" to set iTunesIsRunning to (name of processes) contains "iTunes"
	
	if iTunesIsRunning then
		try
			tell application "iTunes" to get data of first artwork of current track
			tell application "Messages" to set image to result
		on error
			errorSource()
		end try
	else
		errorSource()
	end if
end ituenser

------------------------------------------------------------------------------------

on errorSource()
	tell application "Messages" to set image to (read POSIX file "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Unsupported.icns" as TIFF picture)
end errorSource





