property imageURLPath : "http://www.example.com/"
property localFileOutput : "~/Desktop/IMG\\ Tag\\ Markup.html"

on run
	
	-- Get URL path
	display dialog "Enter the URL Path to the image folder" default answer imageURLPath buttons {"Cancel", "OK"} default button 2
	copy the result as list to {text_returned, button_pressed}
	
	if button_pressed is "OK" then
		
		set imageURLPath to text_returned
		
		tell application "Finder"
			set theSelection to selection
			
			repeat with anItem in theSelection
				
				-- Get Dimensions
				tell application "Image Events"
					set thisImage to open (get anItem as alias)
					set {thisWidth, thisHeight} to dimensions of thisImage
					close thisImage
				end tell
				
				-- Create the IMG tag and append to the output path
				set thisLine to "<IMG SRC=\"" & imageURLPath & (name of anItem) & "\" WIDTH=" & thisWidth & " HEIGHT=" & thisHeight & " />"
				do shell script "echo '" & thisLine & "' >> " & localFileOutput
				
			end repeat
			
		end tell
	end if
end run

