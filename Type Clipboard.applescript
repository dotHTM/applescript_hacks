-- Type Clipboard - Type the contents of the clipboard. Useful for websites that disallow pasting into the password field. Save into the application script folder of your choice or run from AppleScript Editor with the noted lines uncommented or modifed at your choice. The Return key is NOT sent, to allow prevention of missed targets.
--
--   Script written by Mike Cramer on May 26, 2012.
--
--   If released to the public, assume this is under a BSD/GPL style license.
--
--   Questions about this script? Send a message to kiodane {at} Google's email service.

on run
	-- ** If running this from AppleScript Editor, the following two lines should be uncommented to switch back to the app you want the typing to go into. The delay is to make sure the correct field has focus.
	--	tell application "System Events" to keystroke tab using command down
	--	delay 5
	
	set theClipboard to «class ktxt» of ((the clipboard as text) as record)
	keyStroker(theClipboard, 0.05)
end run

on keyStroker(inputString, delTimer)
	repeat with anChar in inputString
		tell application "System Events" to keystroke anChar
		delay delTimer
	end repeat
end keyStroker