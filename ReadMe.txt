Ransomware Jail - Beta
Author: Rami Alhaddad @ AM Data Service, Inc.


This program creates ~15k of dummy files, which are ~150MB in size, and located in [UserName]\$.RwJail folder.
Then the program monitors that folder for any changes (Edit, Rename, Delete, etc.).
When any change happens, the program will create linked folder as a trap inside each sensitive area (such as C:\, My Documents, etc.) this folder linked to $.RwJail folder,
then the program tries to detect the process who caused this change and kill it after notifying the user.

The Monitor process in Task Manager is: "RwJail.exe", and it is scheduled to run when user loggs in.
The files and the monitor are NOT installed on [All Users], you will need to install RwJail on each user you want to active the monitor on him.
