
set VoiceList to {"Karen", "Lee", "Sangeeta", "Moira", "Fiona", "Tessa", "Daniel", "Emily", "Serena", "Jill", "Samantha", "Tom", "Alex"}

set textList to {"We are the borg", "The telephone is ringing"}

repeat with thisText in textList
	do shell script "mkdir -p ~/Desktop/Voices/\"" & thisText & "\""
	repeat with theVoice in VoiceList
		do shell script "say -v " & theVoice & " -o ~/Desktop/Voices/\"" & thisText & "\"/\"" & theVoice & "\".aiff \"" & thisText & "\""
	end repeat
end repeat