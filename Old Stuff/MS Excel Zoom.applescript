-- published online at http://hints.macworld.com/article.php?story=20080530061550929
--
-- This code was originally written by Mike Cramer on 2008-05-29.  Email me at kiodane@gmail.com


property zoomFactor : ""
property prevWinNameList : {}

--------------------------------------------

on open theseFiles
  tell application "Microsoft Excel" to open theseFiles
  initializeZoomFactor()
end open

--------------------------------------------

on run
  initializeZoomFactor()
end run

--------------------------------------------

on idle
  
  --Find out if Excel is still running.
  tell application "System Events" to set ExcelIsRunning to (name of processes) contains "Microsoft Excel"
  
  if ExcelIsRunning then
    try
      tell application "Microsoft Excel"
        
        --Get the currently open windows.
        set currWinNameList to name of every window
        set currWinList to every window
        
        repeat with anWindow in currWinList --i from 1 to (count of currWinList)
          
          --Compare current windows to the last check 
          if prevWinNameList contains name of anWindow then
          else
            tell anWindow to set zoom to zoomFactor
          end if
          
        end repeat
        
        --The current windows are next check's old windows.       
        set prevWinNameList to currWinNameList
        
      end tell
    end try
  else
    --When Excel quits, the assistant should quit too.
    quit
  end if
  
  --repeat every 5 seconds.
  return 5
end idle

--------------------------------------------

on initializeZoomFactor()
  
  --Make sure Excel is running to begin with.
  tell application "Microsoft Excel" to activate
  
  set errMsg to ""
  set output to 0
  repeat while (output < 25 or output > 400) --The range of Excel's zoom is 25-400%
    
    activate
    
    display dialog errMsg & "Please enter a Zoom Factor to use with all documents in Excel (25-400):" default answer zoomFactor buttons {"Okay", "Nevermind"} default button 1
    copy the result as list to {text_returned, button_pressed}
    
    
    if button_pressed = "Okay" then
      
      --Verify the entered text can be converted to a number.
      set output to 0
      try
        set output to text_returned as number
      end try
      
      --Check the number is within range
      if (output ≥ 25 and output ≤ 400) then
        set zoomFactor to output as number
      else
        set errMsg to "There was an error with your last input.\r\r"
      end if
    else
      quit
    end if
  end repeat
  
  --For some reason Excel likes to hide at a previous step sometimes.  This line fixes that:
  tell application "Microsoft Excel" to activate
  
end initializeZoomFactor



