property my_username : "domain\\username"
property computer_list : {"123", "124", "125"}
property host_prefix : "abc-"
property host_sufix : "domain.com"

on run
	
	display dialog "Domain Username" default answer my_username buttons {"OK", "Cancel"} default button 1
	set my_username to text returned of result
	
	display dialog "Password for " & my_username default answer "" buttons {"OK", "Cancel"} default button 1
	set my_password to text returned of result
	
	display dialog "Local Username" default answer "" buttons {"OK", "Cancel"} default button 1
	set local_username to text returned of result
	
	display dialog "Password for " & local_username default answer "" buttons {"OK", "Cancel"} default button 1
	set local_password to text returned of result
	
	repeat with an_computer in computer_list
		add_computer("Dom", host_prefix & an_computer & host_sufix, my_username, my_password)
		add_computer("Loc", host_prefix & an_computer & host_sufix, local_username, local_password)
	end repeat
	
end run


on add_computer(computer_label, this_computer_name, username, the_password)
	tell application "Microsoft Remote Desktop" to activate
	delay 1
	tell application "System Events"
		
		keystroke "n" using command down
		delay 0.1
		keystroke computer_label & " - " & this_computer_name
		keystroke tab
		delay 0.1
		keystroke this_computer_name
		keystroke tab
		keystroke tab
		delay 0.1
		keystroke username
		keystroke tab
		delay 0.1
		keystroke the_password
		keystroke tab
		delay 0.1
		keystroke "1"
		delay 0.1
		keystroke tab
		delay 0.1
		keystroke tab
		delay 0.1
		keystroke tab
		delay 0.1
		keystroke tab
		delay 0.1
		keystroke tab
		
		keystroke space
		
		delay 0.1
		keystroke "w" using command down
		
	end tell
end add_computer