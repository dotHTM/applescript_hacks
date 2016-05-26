on run
	tell application "Microsoft Remote Desktop" to activate
	delay 1
	
	
	repeat with i from 1 to 5
		-- open_chemLocalShare()
		-- browser_check()
		-- win_update()
		-- win_restart()
		-- cmd_admin_geoUserAdd()
		
		--run_string("\\Windows\\system32\\mmc.exe \\Windows\\system32\\lusrmgr.msc") -- user edit panel
		
		--keystroke_delay("2", {command down}, 0.1) -- Mac App Scaling	
		-- keycode_delay(118, {option down}, 0.1) -- Alt-F4
		
		--open_ghost1_ls()
		
		switch_windows()
		
	end repeat
end run


------------------------------------------------
------------------------------------------------


on keycode_delay(thisKC, thisMOD, delayTime)
	tell application "System Events"
		key code thisKC using thisMOD
		delay delayTime
	end tell
end keycode_delay

on keystroke_delay(thisKS, thisMOD, delayTime)
	tell application "System Events"
		keystroke thisKS using thisMOD
		delay delayTime
	end tell
end keystroke_delay

------------------------------------------------
------------------------------------------------

on hide_MRDCWindow()
	keystroke_delay("w", {option down, control down}, 1)
	keystroke_delay("w", {command down}, 0.1)
end hide_MRDCWindow

on switch_windows()
	keystroke_delay("`", {command down}, 0.1)
end switch_windows

------------------------------------------------
------------------------------------------------

on run_string(input)
	keystroke_delay("r", {command down}, 0.1)
	keystroke_delay(input, {}, 0.1)
	keycode_delay(36, {}, 0.1)
end run_string


on cmd_admin_UserAdd()
	keystroke_delay("cmd", {}, 1)
	keycode_delay(36, {shift down, control down}, 5)
	keycode_delay(123, {}, 1)
	keycode_delay(36, {}, 3)
	keystroke_delay("net user USERNAME PASSWORD /add /expires:never /passwordchg:no", {}, 1)
	keycode_delay(36, {}, 1)
	
end cmd_admin_UserAdd






on text_init()
	tell application "Microsoft Remote Desktop"
		display dialog "Repeat text followed by return key." default answer "" buttons {"OK", "Cancel"} default button 1
		copy the result as list to {text_returned, button_pressed}
	end tell
	return text_returned
end text_init

on repeatText_return(text_returned)
	
	if text_returned = "" then
		return
	else
		keystroke_delay(text_returned, {}, 0.1)
		keycode_delay(36, {}, 0.1)
	end if
end repeatText_return





------------------------------------------------
------------------------------------------------

on computer_name()
	run_string("\\Windows\\system32\\SystemPropertiesComputerName.exe")
end computer_name

on user_edit()
	run_string("\\Windows\\system32\\rundll32.exe sysdm.cpl,EditUserProfiles")
end user_edit

on mmc_user()
	run_string("\\Windows\\system32\\mmc.exe \\Windows\\system32\\lusrmgr.msc")
end mmc_user



on dev_manage()
	run_string("mmc devmgmt.msc")
end dev_manage

on win_restart()
	run_string("shutdown /r /t 1")
end win_restart

on win_update()
	run_string("wuapp.exe")
end win_update

------------------------------------------------

on test_stereonet()
	run_string("c:\\Stereonet_Windows\\Stereonet.exe")
end test_stereonet

on browser_check()
	run_string("http://browsertuneup.pearsoncmg.com/mastering-a/")
end browser_check

------------------------------------------------