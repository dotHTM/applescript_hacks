-- SCRIPTNAME - PURPOSETEXT
--
--   Script written by Mike Cramer on December 9, 2011.
--
--   If released to the public, assume this is under a BSD/GPL style license.
--


property theUsers : {"username1", "username2"}
property thePasswds : {"hello", "password"}

property waitTimer : 0.05

property RemoveOffline : true
property RemoveBroken : true


on run
	repeat with anUser in theUsers
		repeat with anPasswd in thePasswds
			newPass(anUser, anPasswd)
			
			set theSel to getComputerList()
			
			checkStatus(theSel)
			sortComputers(theSel)
			
		end repeat
	end repeat
end run

on getComputerList()
	tell application "Remote Desktop"
		activate
		delay waitTimer
		tell application "System Events" to keystroke "a" using command down
		set theSel to selection
	end tell
	return theSel
end getComputerList

on newPass(theUsername, thePassword)
	tell application "Remote Desktop"
		activate
		delay waitTimer
		tell application "System Events" to keystroke "a" using command down
		delay waitTimer
		tell application "System Events" to keystroke "i" using command down
		delay waitTimer
		tell application "System Events" to keystroke tab using shift down
		delay waitTimer
		tell application "System Events" to keystroke space
		delay waitTimer
		tell application "System Events" to keystroke tab
		delay waitTimer
		tell application "System Events" to keystroke tab
		delay waitTimer
		tell application "System Events" to keystroke theUsername
		delay waitTimer
		tell application "System Events" to keystroke tab
		delay waitTimer
		tell application "System Events" to keystroke thePassword
		delay waitTimer
		tell application "System Events" to keystroke tab
		delay waitTimer
		tell application "System Events" to keystroke tab
		delay waitTimer
		tell application "System Events" to keystroke space
		delay waitTimer
		tell application "System Events" to keystroke "w" using command down
		delay waitTimer
	end tell
end newPass

on checkStatus(theSel)
	tell application "Remote Desktop"
		set theStati to {"--"}
		repeat while theStati contains "--" or theStati contains "Authenticating"
			delay 1
			set theStati to {}
			repeat with anComputer in theSel
				set theStati to theStati & status message of anComputer
			end repeat
		end repeat
	end tell
end checkStatus


on sortComputers(theSel)
	tell application "Remote Desktop"
		activate
		delay waitTimer
		repeat with thisComputer in theSel
			set theStatus to status message of thisComputer
			if (theStatus is "Available" or theStatus contains "Idle") then
				add thisComputer to computer list "Available"
				remove thisComputer from computer list "Authenticating"
			else
				if (theStatus is "Offline" and RemoveOffline) then
					add thisComputer to computer list "Offline"
					remove thisComputer from computer list "Authenticating"
				else
					if (theStatus is not "Access Denied" and RemoveBroken) then
						add thisComputer to computer list "ARD off or broken"
						remove thisComputer from computer list "Authenticating"
					end if
				end if
			end if
		end repeat
	end tell
end sortComputers