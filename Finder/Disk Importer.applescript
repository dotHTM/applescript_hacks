property destFolderName : "FloppyStore"
property thisStep : 92

--------------------------------

on run
	set ignoreTheseDisks to getDisks()
	repeat while appOpen("iTunes")
		set theNewDisks to newDisks(ignoreTheseDisks, getDisks())
		if (count of theNewDisks) > 0 then
			repeat with anDisk in theNewDisks
				set thisStep to thisStep + 1
				set thisDestFolder to (destFolderName & "/" & thisStep)
				mkDstDir(thisDestFolder)
				copyDisk(anDisk, destFolderName, thisStep)
				--delay 5
				ejectDisk(anDisk)
				iTAlert()
			end repeat
		end if
		delay 1
	end repeat
end run

--------------------------------
--------------------------------

on mkDstDir(folderName)
	do shell script "mkdir -p ~/Desktop/" & folderName
end mkDstDir

--------------------------------

on newDisks(oldList, newList)
	set newDiskList to {}
	repeat with anItem in newList
		if oldList does not contain anItem then set newDiskList to newDiskList & anItem
	end repeat
	return newDiskList
end newDisks

--------------------------------

on getDisks()
	tell application "Finder" to set diskList to name of disks
	return diskList
end getDisks

--------------------------------

on iTAlert()
	tell application "iTunes" to play playlist "AS Alert"
end iTAlert

--------------------------------

on appOpen(testName)
	tell application "System Events" to set openProcesses to name of processes
	return (openProcesses contains testName)
end appOpen

--------------------------------

on copyDisk(diskName, destFold, thisSteper)
	tell application "Finder"
		try
			with timeout of (30 * 60) seconds
				set theStepper to thisSteper as string
				copy contents of disk diskName to folder theStepper of folder destFold of desktop
				
				--display dialog theStepper
				
			end timeout
		end try
	end tell
end copyDisk

--------------------------------

on ejectDisk(diskName)
	tell application "Finder"
		try
			eject disk diskName
		end try
	end tell
end ejectDisk



