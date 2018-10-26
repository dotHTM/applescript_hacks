-- ### /// Logging /// ### 

to loginit(log_string)
    set log_file to "TestDrive"
    set editor_path to "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
    
    do shell script "echo \"" & log_string & "\" > $HOME/Library/Logs/" & log_file & ".log"
end loginit

to logit(log_string)
    set log_file to "TestDrive"
    set editor_path to "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
    
    do shell script "echo \"" & log_string & "\" >> $HOME/Library/Logs/" & log_file & ".log"
end logit
