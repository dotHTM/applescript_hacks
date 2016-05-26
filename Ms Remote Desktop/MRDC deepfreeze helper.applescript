tell application "Microsoft Remote Desktop" to activate
delay 1


repeat with i from 1 to 20
	
	
	DF_unlock()
	
end repeat

on CAD_ks()
	tell application "System Events"
		key code 117 using {control down, option down}
		keystroke "`" using command down
	end tell
end CAD_ks


on DF_unlock()
	tell application "System Events"
		key code 97 using {option down, control down, shift down}
		delay 0.2
		keystroke "DEEPFREEZEPASSWORD"
		key code 36
		keystroke "`" using command down
	end tell
end DF_unlock