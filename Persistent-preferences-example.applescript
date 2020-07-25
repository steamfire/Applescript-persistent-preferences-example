-- MIT License 2020 
-- Dan Bowen steamfire@gmail.com


-- This is to store persistent preference variables.  In this case, 
-- so that on first run this automator applet can ask you for 
-- a URL that you'd like to open at the end.  Intended to open your 
-- twitter or buffer.com or whatever.
-- Stores a preferences script in ~/Library/Preferences/pdf-snapshot-automator-applet-preferences.scpt
-- 		To change the URL, or to add one if you declined it previously,
-- 		you must delete that file.

on run
	-- Persistent preferences script from https://stackoverflow.com/questions/13325386/persistent-variable-storage-in-automator
	-- Path of script which holds data
	set thePath to (path to preferences as text) & "pdf-snapshot-automator-applet-preferences.scpt" -- better
	
	script myPreferences
		property URLDesired : missing value
	end script
	
	try
		-- THIS IS WHEN THE PREFERENCES ARE READ FROM THE FILE.
		-- AFTER THIS the "URLDesired" property holds the stored data.
		set myPreferences to load script file thePath
	on error
		-- On first run, set the initial value of the variable
		set myPreferences's URLDesired to "nope"
	end try
	
	-- THIS IS WHERE THE PREFERENCE IS SET
	set myPreferences's URLDesired to "Hello"
	
	-- Save the variable to the preferences file (script) 
	-- IF THE PREFERENCE FILE(SCRIPT) DOESN'T EXIST, IT IS CREATED HERE
	store script myPreferences in file thePath replacing yes
	
	
	-- Return the URLDesired contents
	return myPreferences's URLDesired
end run



