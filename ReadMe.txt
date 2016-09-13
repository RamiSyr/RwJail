Ransomware Jail - Beta 3
Author: Rami Alhaddad @ AM Data Service, Inc.

UPDATES:
--------
08-03-2016  Released

09-01-2016  
- Fix bug when "uninstall.exe" doesn't delete the monitor shortcut from the Startup Folder
- Fix bug when "uninstall.exe" doesn't delete itself from "Program Files\RwJail\"

9-13-2016
- Change the monitored folder from "$.RwJail" to "!.RwJail" after finding that there are some ransomwares skip folders start with "$".
- Add Auto Update.


INSTRUCTIONS:
-------------
This program creates ~15k of dummy files, which are ~150MB in size, and located in [UserName]\!.RwJail folder.
Then the program monitors that folder for any changes (Edit, Rename, Delete, etc.).
When any change happens, the program will create linked folder as a trap inside each sensitive area (such as C:\, My Documents, etc.) this folder linked to !.RwJail folder, (infinite loop).
Then the program tries to detect the process who caused this change and kill it after notifying the user.

The Monitor process in Task Manager is: "RwJail.exe", and it is scheduled to run when user loggs in.
