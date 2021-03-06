--Where POSIX uses the slash / as the separator for directories, AppleScript uses the colon :.
--You can use colon : in a POSIX file name, and you can use slash / in an AppleScript file name: they translate one into the other.
--To translate a UNIX path (file or directory, valid or not) into an AppleScript file reference, use POSIX file. POSIX file returns a file reference, that your script can use directly to create or use the file. 
set p to "/usr/local/bin/" 
set a to POSIX file p 
   -- file "Macintosh HD:usr:local:bin:"
To translate an AppleScript path (file or directory, valid or not) into a POSIX path use POSIX path of.
set a to "Macintosh HD:usr:local:bin:" 
set p to POSIX path of a 
   -- "/usr/local/bin/"
POSIX path also understands AppleScript's file references.
set a to alias "Macintosh HD:usr:local:bin:" 
set p to POSIX path of a 
   -- "/usr/local/bin/" 
set a to file "Macintosh HD:usr:local:bin:" 
set p to POSIX path of a 
   -- "/usr/local/bin/"
A file name may include characters which need to be escaped to be passed to a shell command. Use quoted form to get the quoted form of a string.
set a to path to application support 
set p to POSIX path of a 
  --  "/Library/Application Support/" -- contains a space 
do shell script "ls " & p -- does not work 
  --  "" 

do shell script "ls " & quoted form of p -- works 
  --  Result: 
Adobe 
Lexmark Z53 Files 
etc.
The reserved directories may have various names (for localization purposes). Instead of accessing those directories with their names, you use keywords and the path to command. Most of the keywords are given in the dictionary of StandardAdditions.osax (select path to, press ⌘⇧F).
path to accepts a from parameter to specify either the user domain, local domain or system domain. Compare to the example just above.
set a to path to application support from user domain 
set p to POSIX path of a 
  --  "/Users/<login>/Library/Application Support/"
For the exhaustive list of the keywords recognized by path to, use the following tool: User Scripts > More Smile commands > Scripting > Path to menu.
