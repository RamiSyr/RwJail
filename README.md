Ransomware Jail - Beta 3

Author: Rami Alhaddad @ AM Data Service, Inc.

UPDATES:
--------
08-03-2016
- Releas Beta version

09-01-2016  
- Fix bug when "uninstall.exe" doesn't delete the monitor shortcut from the Startup Folder
- Fix bug when "uninstall.exe" doesn't delete itself from "Program Files\RwJail\"

9-13-2016
- Change the monitored folder from "$.RwJail" to "!.RwJail" after finding that the encryption process of some ransomwares skip folders start with "$".
- Add Auto Update function -
The script will check if there is a newer version, if yes, will download it in the same folder with name RwJailMMDDYYYY.exe then will run the new setup and delete itself.

INSTRUCTIONS:
-------------
This program creates ~15k of dummy files, which are ~150MB in size, and located in [UserName]\!.RwJail folder.
Then the program monitors that folder for any changes (Edit, Rename, Delete, Modifying, etc.).

When any change happens, the program creates few linked folders inside some sensitive areas such as (C:\, My Documents, etc.). This linked folders navigate to !.RwJail folder (the encryption process should hit a recursive loop).

Then the program tries to detect the process who caused this change and kill it after notifying the user.

The Monitor process in Task Manager is: "RwJail.exe", and it is scheduled to run when user logs in.

How To Setup:
-------------
Downloading and running "Ransomware_Jail_Setup.exe" is enough to get everything ready for you.
The setup will download the rest of files as needed.
