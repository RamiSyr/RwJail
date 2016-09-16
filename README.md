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
- Change everything related to "$.RwJail" into "!.RwJail" after finding that the encryption process of some ransomwares skip folders start with "$".
- Add Auto Update function in Setup.exe-
The script will check if there is a newer version, if yes, will download it in the same folder with name RwJailMMDDYYYY.exe then will run the new setup and delete itself.

9-14-2016
- Add "Detection History" as a tray menu in RwJail Monitor to show the detected processes, by other means: write every detected process into "Detection.log" file in "RwJail" folder in "Program Files", then open it from tray menu.
- Addition to Setup.exe to ask for uninstalling the RwJail if exist. If yes, it will uninstall it for you.
- Add TrayTip to Monitor when detection, and then big MagicBox Warning message disapears after 10 seconds.

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
The setup will download the rest of the files as needed. Will also uninstall any version if exist , and will be available to always update to newest version when releases.
