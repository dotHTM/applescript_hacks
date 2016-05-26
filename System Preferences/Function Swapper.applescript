tell application "System Preferences"
	set current pane to pane "com.apple.preference.keyboard"
end tell


tell application "System Events"
	if UI elements enabled then
		tell tab group 1 of window "Keyboard" of process "System Preferences"
			click checkbox "Use all F1, F2, etc. keys as standard function keys"
			
			if (do shell script "defaults read -g com.apple.keyboard.fnState") = "1" then
				set fnStateRead to "Special Keys - Volume, iTunes..."
			else
				set fnStateRead to "Function Keys - F1, F2, F3..."
			end if
			
			do shell script "~/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier -message \"Function Swapper, an AS & Shell script\" -title \"" & fnStateRead & "\"  -activate com.orderedbytes.ControllerMate4"
			
		end tell
	else
		tell application "System Preferences"
			set current pane Â
				to pane "com.apple.preference.universalaccess"
			display dialog Â
				"UI element scripting is not enabled. Check \"Enable access for assistive devices\""
		end tell
	end if
end tell

tell application "System Preferences"
	quit
end tell