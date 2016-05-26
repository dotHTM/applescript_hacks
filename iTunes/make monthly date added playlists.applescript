property monthList : {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}

on run {}
	
	set anyear to 2014
	
	repeat with anMonth from 1 to 12
		mkDtPL(anMonth, anyear)
		delay 20
	end repeat
	
	
end run



(*
on getNextDate(theMonth, theYear)
	
	set theNextMonth to theMonth + 1
	set theNextMonthYear to theYear
	
	if theNextMonth ³ 13 then
		set theNextMonth to 1
		set theNextMonthYear to theYear + 1
	end if
	
	return {theNextMonth, theNextMonthYear}
end getNextDate
*)




on mkDtPL(theMonth, theYear)
	
	tell application "iTunes" to activate
	tell application "System Events"
		keystroke "n" using {command down, option down}
		keystroke "\t date add"
		delay 0.5
		keystroke "\r"
		delay 0.1
		keystroke "\t " --is in the range"
		key code 125 using command down
		delay 0.1
		keystroke "\r"
		delay 0.1
		keystroke "\t"
		
		keystroke theMonth as string
		keystroke "\t1\t"
		keystroke theYear as string
		keystroke "\t"
		
		
		keystroke theMonth as string
		keystroke "\t1"
		key code 125
		keystroke "\t"
		keystroke theYear as string
		keystroke "\t "
		delay 0.5
		keystroke "\t" using shift down
		delay 0.1
		keystroke "\t" using shift down
		delay 0.5
		keystroke " media"
		delay 0.1
		keystroke "\r"
		delay 0.2
		
		keystroke "\r"
		delay 1
		
		keystroke ((theYear - 2000) as string)
		keystroke "-"
		if theMonth < 10 then
			set montxt to "0" & (theMonth as string)
		else
			set montxt to (theMonth as string)
		end if
		keystroke montxt
		keystroke " "
		keystroke (item theMonth of monthList)
		keystroke "\r"
		
		
	end tell
end mkDtPL
