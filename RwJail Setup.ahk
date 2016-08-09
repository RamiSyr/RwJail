#Persistent
#SingleInstance, force
#NoEnv
#NoTrayIcon

; *** Force to run as Administrator ***
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}


MsgBox, 4, Install, Are you sure you want to install "Ransomware Jail"?
IfMsgBox No
	ExitApp
else
Progress, b w350, %A_ProgramFiles%\RwJail\,Downloading & Preparing Files..., Progress
Progress, 10

; *** Insure that the computer is connected to Internet ***
ConnectedToInternet(flag=0x40) 
{
	Return DllCall("Wininet.dll\InternetGetConnectedState", "Str", flag,"Int",1) 
}
	If ConnectedToInternet()
    {
    Progress, Off
	msgbox, 48, No Internet Connection, No Internet Connection has detected.`n"Ransomware Jail" requires internet connection to continue installation.`n
    ExitApp
    }
Progress, 20

; *** Creating FOLDERS&FILES ***
Process, Exist, RwJail_Monitor.exe
If (ErrorLevel)
	{
		Run, taskkill /im RwJail.exe /f
		sleep, 3000
	}

Progress, 30

IfExist, %A_Temp%\RwJailFiles\
	{
	FileRemoveDir, %A_Temp%\RwJailFiles, 1
	}

Progress, 40

IfExist, C:\Users\%A_UserName%\$.RWJail\
	{
	FileRemoveDir, C:\Users\%A_UserName%\$.RWJail, 1
	sleep, 2000
	}
	
Progress, 60

IfExist, %A_ProgramFiles%\RwJail\
	{
	FileRemoveDir, %A_ProgramFiles%\RwJail, 1
	sleep, 2000
	}
Progress, 70
FileCreateDir, %A_Temp%\RwJailFiles
FileCreateDir, %A_ProgramFiles%\RwJail
UrlDownloadToFile, https://github.com/RamiSyr/RwJail/raw/master/Handle.exe, %A_ProgramFiles%\RwJail\Handle.exe
UrlDownloadToFile, https://github.com/RamiSyr/RwJail/raw/master/RwJail`%20Monitor.exe, %A_ProgramFiles%\RwJail\RwJail.exe
UrlDownloadToFile, https://github.com/RamiSyr/RwJail/raw/master/Uninstall.exe, %A_ProgramFiles%\RwJail\Uninstall.exe
UrlDownloadToFile, https://github.com/RamiSyr/RwJail/raw/master/Icon.ico, %A_ProgramFiles%\RwJail\Icon.ico
UrlDownloadToFile, https://github.com/RamiSyr/RwJail/raw/master/uninstall.ico, %A_ProgramFiles%\RwJail\uninstall.ico

FileAppend,
(

================================================================================================

These dummy files & Folders will be monitored for any changes `(Edit, Delete, Rename, ..etc.`).
Please do NOT make any change inside this folder and its subfolders.

================================================================================================
), %A_Temp%\RwJailFiles\DummyFiles.txt

Progress, 80

FileAppend,
(
@echo off
MD C:\Users\%A_UserName%\$.RwJail
TYPE %A_Temp%\RwJailFiles\DummyFiles.txt >C:\Users\%A_UserName%\$.RwJail\$ReadMe.txt
FOR /L `%`%H in `(0,1,5`) DO `(MD C:\Users\%A_UserName%\$.RwJail\`%`%H && TYPE %A_Temp%\RwJailFiles\DummyFiles.txt >C:\Users\%A_UserName%\$.RwJail\`%`%H\$ReadMe.txt && FOR /L `%`%K IN `(1,1,5`) DO `(FOR `%`%T IN `(".c",".h",".m",".ai",".cs",".db",".nd",".pl",".ps",".py",".rm",".3dm",".3ds",".3fr",".3g2",".3gp",".ach",".arw",".asf",".asx",".avi",".bak",".bay",".cdr",".cer",".cpp",".cr2",".crt",".crw",".dbf",".dcr",".dds",".der",".des",".dng",".doc",".dtd",".dwg",".dxf",".dxg",".eml",".erf",".fla",".flv",".hpp",".iif",".jpe",".jpg",".kdc",".key",".lua",".m4v",".max",".mdf",".mef",".mov",".mp3",".mp4",".mpg",".mrw",".msg",".nef",".nk2",".nrw",".oab",".obj",".odb",".odc",".odm",".odp",".ods",".odt",".orf",".ost",".p12",".p7b",".p7c",".pab",".pas",".pct",".pdb",".pdd",".pdf",".pef",".pem",".pfx",".pps",".ppt",".prf",".psd",".pst",".ptx",".qba",".qbb",".qbm",".qbr",".qbw",".qbx",".qby",".r3d",".raf",".raw",".rtf",".rw2",".rwl",".sql",".sr2",".srf",".srt",".srw",".svg",".swf",".tex",".tga",".tlg",".txt",".vob",".wav",".wb2",".wmf",".wmv",".wpd",".wps",".x3f",".xlk",".xlr",".xls",".yuv",".back",".docm",".docx",".flac",".indd",".java",".jpeg",".pptm",".pptx",".xlsb",".xlsm",".xlsx",".zip",".vb",".vbs",".csv",".rar",".7z",".m4a",".wma",".d3dbsp",".sc2save",".sie",".sum",".ibank",".t13",".t12",".qdf",".gdb",".tax",".pkpass",".bc6",".bc7",".bkp",".qic",".bkf",".sidn",".sidd",".mddata",".itl",".itdb",".icxs",".hvpl",".hplg",".hkdb",".mdbackup",".syncdb",".gho",".cas",".wmo",".map",".itm",".sb",".fos",".mcgame",".vdf",".ztmp",".sis",".sid",".ncf",".menu",".layout",".dmp",".blob",".esm",".001",".vtf",".dazip",".fpk",".mlx",".kf",".iwd",".vpk",".tor",".psk",".rim",".w3x",".fsh",".ntl",".arch00",".lvl",".snx",".cfr",".ff",".vpp_pc",".lrf",".m2",".mcmeta",".vfs0",".mpqge",".kdb",".db0",".DayZProfile",".rofl",".hkx",".bar",".upk",".das",".iwi",".litemod",".asset",".forge",".ltx",".bsa",".apk",".re4",".lbf",".slm",".bik",".epk",".rgss3a",".pak",".big",".unity3d",".wotreplay",".xxx",".desc",".m3u",".js",".css",".rb",".png",".mrwref",".dbfv",".xf",".accdb",".1cd",".3pr",".aac",".ab4",".abd",".accde",".accdr",".accdt",".acr",".act",".adb",".adp",".ads",".agdl",".aiff",".ait",".al",".aoi",".apj",".ascx",".asm",".asp",".aspx",".atb",".awg",".backup",".backupdb",".bank",".bdb",".bgt",".bin",".blend",".bpw",".cash",".cdb",".cdf",".cdr3",".cdr4",".cdr5",".cdr6",".cdrw",".cdx",".ce1",".ce2",".cfg",".cfn",".cgm",".cib",".class",".cls",".cmt",".config",".contact",".cpi",".craw",".csh",".csl",".dac",".dat",".db3",".db_journal",".dbx",".dc2",".dcs",".dxb",".ddd",".ddoc",".ddrw",".design",".dgc",".dit",".djvu",".dot",".dotm",".dotx",".drf",".drw",".edb",".eps",".erbsql",".fdb",".ffd",".fff",".fh",".fhd",".flb",".flf",".flvv",".fpx",".fxg",".gif",".gray",".grey",".groups",".gry",".hbk",".hdd",".ibz",".idx",".iiq",".incpas",".info",".info_",".ini",".jar",".jnt",".json",".k2p",".kc2",".kdbx",".kwm",".laccdb",".lck",".ldf",".lit",".litesql",".lock",".log",".m2ts",".m4p",".mab",".mapimail",".mbx",".mdb",".mdc",".mid",".mkv",".mlb",".mmw",".mny",".money",".moneywell",".mos",".msf",".myd",".ndd",".ndf",".nop",".ns2",".ns3",".ns4",".nsd",".nsf",".nsg",".nsh",".nvram",".nwb",".nx2",".nxl",".nyf",".ogg",".oil",".omg",".oth",".otp",".ots",".ott",".pages",".pat",".pbf",".pcd",".plus_muhd",".pm",".pm!",".pmi",".pmj",".pml",".pmm",".pmo",".pmr",".pnc",".pnd",".pnx",".pot",".potm",".potx",".ppam",".ppsm",".ppsx",".private",".psafe3",".pspimage",".pwm",".qcow",".qcow2",".qed",".qtb",".rdb",".rvt",".s3db",".safe",".sas7bdat",".sav",".save",".say",".sd0",".sda",".sdb",".sdf",".sh",".sldm",".sldx",".sqlite",".sqlite-shm",".sqlite-wal",".sqlite3",".sqlitedb",".srb",".srs",".st4",".st5",".st6",".st7",".st8",".stc",".std",".sti",".stm",".stw",".stx",".sxc",".sxd",".sxg",".sxi",".sxm",".sxw",".tbb",".tbn",".thm",".tif",".tiff",".usr",".vbox",".vdi",".vhd",".vhdx",".vmdk",".vmsd",".vmx",".vmxf",".wab",".wad",".wallet",".war",".x11",".xlam",".xlm",".ycbcra",".zixis"`) DO `(`(fsutil file createnew C:\Users\%A_UserName%\$.RwJail\`%`%H\DummyFile`%`%K`%`%T 10240`)`)`)`)
), %A_Temp%\RwJailFiles\DummyFiles.bat

Run %comspec% /c %A_Temp%\RwJailFiles\DummyFiles.bat,,hide
Progress, 90

FileAppend,
(
Ransomware Jail v1.0 Beta
Author: AM Data Service Inc.
2016


This program creates thousands of dummy files, which are ~150MB in size, and located in [UserName]\$.RwJail folder.
Then the program monitors that folder for any changes (Edit, Rename, Delete, etc.).
When any change happens, the program tries to detect which process caused this change to kill it after notifying the user.
The Monitor process in Task Manager is: "RwJail.exe", and it is scheduled to run with Windows startup.
), %A_ProgramFiles%\RwJail\ReadMe.txt

Progress, 100
sleep, 1000
Progress, Off
Progress, b w350, It may take 3-5 minutes.,Installing..., Progress
Progress, 5
sleep, 20000
Progress, 10
sleep, 20000
Progress, 20
sleep, 20000
Progress, 30
sleep, 20000
Progress, 40
sleep, 20000
Progress, 50
sleep, 20000
Progress, 60
sleep, 20000
Progress, 70
sleep, 20000
Progress, 80
sleep, 20000
Progress, 90
sleep, 20000

loop, 5
{
Process, Exist, cmd.exe
If (ErrorLevel)
	{
		Progress, 95
		sleep, 20000
	}
}

FileRemoveDir, %A_Temp%\RwJailFiles
FileCreateDir, %A_ProgramsCommon%\Ransomware Jail
FileCreateShortcut, %A_ProgramFiles%\RwJail\RwJail.exe, %A_Startup%\RwJail Monitor.lnk,,, Ransomware Monitor, %A_ProgramFiles%\RwJail\Icon.ico
FileCreateShortcut, %A_ProgramFiles%\RwJail\RwJail.exe, %A_ProgramsCommon%\Ransomware Jail\RwJail Monitor.lnk,,, Ransomware Monitor, %A_ProgramFiles%\RwJail\Icon.ico
FileCreateShortcut, %A_ProgramFiles%\RwJail\Uninstall.exe, %A_ProgramsCommon%\Ransomware Jail\Uninstall.lnk,,, Uninstall, %A_ProgramFiles%\RwJail\win_uninstall.ico

Progress, 100
sleep, 2000
Progress, Off
msgbox, 64, Success, Ransomware Jail Beta has been installed successfully.`n`n   [User] directory will be monitored for any changes`n
run, %A_ProgramFiles%\RwJail\RwJail.exe,,Min
ExitApp
