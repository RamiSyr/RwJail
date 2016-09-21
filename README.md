#Ransomware Jail - Beta 4

Author: AM Data Service, Inc.

UPDATES:
----
>**09-19-2016**
- Give **Detection.log** Read Only attribute, now we cannot change the data after open it from the Detection History Tray and read it after changes.

>**9-14-2016**
- Add **Detection History** as a tray menu in RwJail Monitor to show the detected processes, by other means: write every detected process into **Detection.log** file in **RwJail** folder in **Program Files**, then open it from tray menu.
- Addition to Setup.exe to ask for uninstalling the RwJail if exist. If yes, it will uninstall it for you.
- Add TrayTip to Monitor when detection, and then big MagicBox Warning message disapears after 10 seconds. 

>**9-13-2016**
- Change everything related to the name **$.RwJail** into **!.RwJail** after finding that the encryption process of some ransomwares skip folders start with `$`.
- Add Always Update to newer version in Setup.exe -
  The script will check if there is a newer version, if yes, will download it in the same folder with name **RwJailMMDDYYYY.exe** then will delete itself and will run the new setup.

>**09-01-2016**
- Fix bugs when **uninstall.exe** doesn't delete the monitor shortcut from the Startup Folder, and doesn't delete itself from `Program Files\RwJail\`
- Add codes to: Setup and Uninstall scripts: Have the script run at maximum speed, Never sleep.
                Monitor.exe: Prevent the script from using any more than 50% of an idle CPU's time. This allows scripts to run quickly while still maintaining a high level of cooperation with CPU sensitive tasks such as games and video capture/playback.

>**08-30-2016**
- Released

INSTRUCTIONS:
-------------
This program creates ~15k of dummy files, which are ~150MB in size, and located in [UserName]\!.RwJail folder.
Then the program monitors that folder for any changes (Edit, Rename, Delete, Modifying, etc.).

When any change happens, the program creates few linked folders inside some sensitive areas such as (C:\, My Documents, etc.). This linked folders navigate to !.RwJail folder (the encryption process should hit a recursive loop).

Then the program tries to detect the process who caused this change and kill it after notifying the user.

The Monitor process in Task Manager is: "RwJail.exe", and it is scheduled to run when user logs in.

How To Setup:
-------------
Downloading and running ***`Ransomware_Jail_Setup.exe`*** is enough to get everything ready for you.
The setup will download the rest of the files as needed. Will also uninstall any version if exist , and will be available to always update to newest version when releases.
