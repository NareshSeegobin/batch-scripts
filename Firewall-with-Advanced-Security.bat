@REM Filename: Firewall-with-Advanced-Security.bat
@REM Purpose: Document windows firewall rules used in system configurations
@REM Author: Naresh Seegobin (www.nareshseegobin.com)

@REM Revision history:
@REM 20200114-01 - NS - Initial version

@REM https://support.microsoft.com/en-us/help/947709/how-to-use-the-netsh-advfirewall-firewall-context-instead-of-the-netsh

@REM https://winaero.com/blog/how-to-backup-and-restore-firewall-rules-in-windows-10/
@REM above not required unbless you are backing up the entire firewall policy.

@REM https://superuser.com/questions/468475/viewing-windows-firewall-settings-from-the-command-line-and-a-gui
netsh advfirewall firewall show rule name="VirtualBox Manager" verbose

@REM https://www.itninja.com/blog/view/how-to-add-firewall-rules-using-netsh-exe-advanced-way
@REM VirtualBox
@REM Omitting the protocol=tcp and/or protocol=udp will configure the rule to allow ALL protocols.
@netsh advfirewall firewall add rule name="VirtualBox Manager - TCP and UDP - CUSTOM" dir=in action=allow description="VirtualBox Manager - TCP and UDP - CUSTOM" program="C:\program files\oracle\virtualbox\virtualbox.exe" enable=yes profile=any 



@REM #http://superuser.com/questions/136579/automate-windows-7s-file-sharing-and-firewall-settings
@REM #Allow Remote Desktop
@netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes


@REM #Allow File and Printer Sharing
@netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes


@REM #Allow Remote Scheduled Tasks Management
@netsh advfirewall firewall set rule group="Remote Scheduled Tasks Management" new enable=Yes


@REM #http://www.howtogeek.com/howto/windows-vista/allow-pings-icmp-echo-request-through-your-windows-vista-firewall/
@netsh firewall set icmpsetting 8 enable


@REM #http://support.microsoft.com/kb/947709
@REM netsh advfirewall firewall add rule name=”All ICMP V4” protocol=icmpv4:any,any dir=in action=allow



@REM #http://msdn.microsoft.com/en-us/library/windows/desktop/aa822854(v=vs.85).aspx
@netsh advfirewall firewall set rule group="windows management instrumentation (wmi)" new enable=yes


@REM #http://stackoverflow.com/questions/4579643/use-netsh-advfirewall-to-add-windows-7-firewall-exception


@REM # Maple 13
@netsh advfirewall firewall delete rule name="DCIT-Maple 13" protocol=tcp dir=in profile=any  program="C:\program files\maple 13\jre\bin\maple.exe"
@netsh advfirewall firewall add rule name="DCIT-Maple 13" protocol=tcp dir=in action=allow profile=any description="Maple 13" program="C:\program files\maple 13\jre\bin\maple.exe" enable=yes

@netsh advfirewall firewall delete rule name="DCIT-Maple 13" protocol=udp dir=in profile=any  program="C:\program files\maple 13\jre\bin\maple.exe"
@netsh advfirewall firewall add rule name="DCIT-Maple 13" protocol=udp dir=in action=allow profile=any description="Maple 13" program="C:\program files\maple 13\jre\bin\maple.exe" enable=yes


@REM # Maple 2017
@netsh advfirewall firewall delete rule name="DMS-Maple 2017 64 Java - TCP" protocol=tcp dir=in profile=any  program="C:\program files\maple 2017\jre\bin\javaw.exe"
@netsh advfirewall firewall add rule name="DMS-Maple 2017 64 Java - TCP" protocol=tcp dir=in action=allow profile=any description="DMS-Maple 2017 64 Java" program="C:\program files\maple 2017\jre\bin\javaw.exe" enable=yes

@netsh advfirewall firewall delete rule name="DMS-Maple 2017 64 Java - UDP" protocol=udp dir=in profile=any  program="C:\program files\maple 2017\jre\bin\javaw.exe"
@netsh advfirewall firewall add rule name="DMS-Maple 2017 64 Java - UDP" protocol=udp dir=in action=allow profile=any description="DMS-Maple 2017 64 Java" program="C:\program files\maple 2017\jre\bin\javaw.exe" enable=yes



@REM echo For multiple rule entries see page below
@REM #http://www.sevenforums.com/system-security/109593-netsh-advfirewall-add-how-prevent-multiple-entries-command-line.html



@REM # Statistics18 - SPSS18
@netsh advfirewall firewall delete rule name="DCIT-Statistics18-SPSS18-TCP" protocol=tcp dir=in profile=any  program="C:\Program Files\SPSSInc\PASWStatistics18\paswstat.exe"
@netsh advfirewall firewall add rule name="DCIT-Statistics18-SPSS18-TCP" protocol=tcp dir=in action=allow profile=any description="Statistics18-SPSS18" program="C:\Program Files\SPSSInc\PASWStatistics18\paswstat.exe" enable=yes

@netsh advfirewall firewall delete rule name="DCIT-Statistics18-SPSS18-UDP" protocol=udp dir=in profile=any  program="C:\Program Files\SPSSInc\PASWStatistics18\paswstat.exe"
@netsh advfirewall firewall add rule name="DCIT-Statistics18-SPSS18-UDP" protocol=udp dir=in action=allow profile=any description="Statistics18-SPSS18" program="C:\Program Files\SPSSInc\PASWStatistics18\paswstat.exe" enable=yes


@netsh advfirewall firewall delete rule name="DCIT-Statistics18-SPSS18-COM-TCP" protocol=tcp dir=in profile=any  program="C:\Program Files\SPSSInc\PASWStatistics18\paswstat.com"
@netsh advfirewall firewall add rule name="DCIT-Statistics18-SPSS18-COM-TCP" protocol=tcp dir=in action=allow profile=any description="Statistics18-SPSS18" program="C:\Program Files\SPSSInc\PASWStatistics18\paswstat.com" enable=yes

@netsh advfirewall firewall delete rule name="DCIT-Statistics18-SPSS18-COM-UDP" protocol=udp dir=in profile=any  program="C:\Program Files\SPSSInc\PASWStatistics18\paswstat.com"
@netsh advfirewall firewall add rule name="DCIT-Statistics18-SPSS18-COM-UDP" protocol=udp dir=in action=allow profile=any description="Statistics18-SPSS18" program="C:\Program Files\SPSSInc\PASWStatistics18\paswstat.com" enable=yes


@netsh advfirewall firewall delete rule name="DCIT-Statistics18-SPSS18-Script-TCP" protocol=tcp dir=in profile=any  program="C:\Program Files\SPSSInc\PASWStatistics18\WinWrapIDE.exe"
@netsh advfirewall firewall add rule name="DCIT-Statistics18-SPSS18-Script-TCP" protocol=tcp dir=in action=allow profile=any description="Statistics18-SPSS18" program="C:\Program Files\SPSSInc\PASWStatistics18\WinWrapIDE.exe" enable=yes

@netsh advfirewall firewall delete rule name="DCIT-Statistics18-SPSS18-Script-UDP" protocol=udp dir=in profile=any  program="C:\Program Files\SPSSInc\PASWStatistics18\WinWrapIDE.exe"
@netsh advfirewall firewall add rule name="DCIT-Statistics18-SPSS18-Script-UDP" protocol=udp dir=in action=allow profile=any description="Statistics18-SPSS18" program="C:\Program Files\SPSSInc\PASWStatistics18\WinWrapIDE.exe" enable=yes



@netsh advfirewall firewall set rule name="SPSS Basic Script Editor" new enable=Yes
@netsh advfirewall firewall set rule name="Statistics18:com" new enable=Yes
@netsh advfirewall firewall set rule name="Statistics18:exe" new enable=Yes



@REM # DCIT Servers, e.g. Java RMI, Apache. Range 4000 to 20000

@netsh advfirewall firewall delete rule name="DCIT-Servers-PortRange-DCIT-DirIn-TCP" protocol=TCP dir=in profile=any  localport=4000-20000
@netsh advfirewall firewall add rule name="DCIT-Servers-PortRange-DCIT-DirIn-TCP" protocol=TCP dir=in action=allow profile=any localport=4000-20000 description="DCIT-Servers" enable=yes


@netsh advfirewall firewall delete rule name="DCIT-Servers-PortRange-DCIT-DirIn-UDP" protocol=UDP dir=in profile=any  localport=4000-20000
@netsh advfirewall firewall add rule name="DCIT-Servers-PortRange-DCIT-DirIn-UDP" protocol=UDP dir=in action=allow profile=any localport=4000-20000 description="DCIT-Servers" enable=yes



@netsh advfirewall firewall delete rule name="DCIT-Servers-PortRange-DCIT-DirOut-TCP" protocol=TCP dir=out profile=any  localport=4000-20000
@netsh advfirewall firewall add rule name="DCIT-Servers-PortRange-DCIT-DirOut-TCP" protocol=TCP dir=out action=allow profile=any localport=4000-20000 description="DCIT-Servers" enable=yes


@netsh advfirewall firewall delete rule name="DCIT-Servers-PortRange-DCIT-DirOut-UDP" protocol=UDP dir=out profile=any  localport=4000-20000
@netsh advfirewall firewall add rule name="DCIT-Servers-PortRange-DCIT-DirOut-UDP" protocol=UDP dir=out action=allow profile=any localport=4000-20000 description="DCIT-Servers" enable=yes



@REM # DCIT Servers, e.g. 80,21,443,3306,2224,143,25,110,587

@netsh advfirewall firewall delete rule name="DCIT-Servers-DefaultPorts-DCIT-DirIn-TCP" protocol=TCP dir=in profile=any  localport=80,21,443,3306,2224,143,25,110,587
@netsh advfirewall firewall add rule name="DCIT-Servers-DefaultPorts-DCIT-DirIn-TCP" protocol=TCP dir=in action=allow profile=any localport=80,21,443,3306,2224,143,25,110,587 description="DCIT-Servers-TCP-Default" enable=yes


@netsh advfirewall firewall delete rule name="DCIT-Servers-DefaultPorts-DCIT-DirIn-UDP" protocol=UDP dir=in profile=any  localport=80,21,443,3306,2224,143,25,110,587
@netsh advfirewall firewall add rule name="DCIT-Servers-DefaultPorts-DCIT-DirIn-UDP" protocol=UDP dir=in action=allow profile=any localport=80,21,443,3306,2224,143,25,110,587 description="DCIT-Servers" enable=yes



@netsh advfirewall firewall delete rule name="DCIT-Servers-DefaultPorts-DCIT-DirOut-TCP" protocol=TCP dir=out profile=any  localport=80,21,443,3306,2224,143,25,110,587
@netsh advfirewall firewall add rule name="DCIT-Servers-DefaultPorts-DCIT-DirOut-TCP" protocol=TCP dir=out action=allow profile=any localport=80,21,443,3306,2224,143,25,110,587 description="DCIT-Servers" enable=yes


@netsh advfirewall firewall delete rule name="DCIT-Servers-DefaultPorts-DCIT-DCIT-DirOut-UDP" protocol=UDP dir=out profile=any  localport=80,21,443,3306,2224,143,25,110,587
@netsh advfirewall firewall add rule name="DCIT-Servers-DefaultPorts-DCIT-DCIT-DirOut-UDP" protocol=UDP dir=out action=allow profile=any localport=80,21,443,3306,2224,143,25,110,587 description="DCIT-Servers" enable=yes


@REM -----------------------------------------------------------------------------------------------------------

@REM # DCIT Servers, e.g. mongodb 27017,27018,27019,28017,28018,28019

@netsh advfirewall firewall delete rule name="DCIT-Servers-PortRange-mongodb-DirIn-TCP" protocol=TCP dir=in profile=any  localport=27017,27018,27019,28017,28018,28019
@netsh advfirewall firewall add rule name="DCIT-Servers-PortRange-mongodb-DirIn-TCP" protocol=TCP dir=in action=allow profile=any localport=27017,27018,27019,28017,28018,28019 description="DCIT-Servers-mongodb" enable=yes

@netsh advfirewall firewall delete rule name="DCIT-Servers-PortRange-mongodb-DirIn-UDP" protocol=UDP dir=in profile=any  localport=27017,27018,27019,28017,28018,28019
@netsh advfirewall firewall add rule name="DCIT-Servers-PortRange-mongodb-DirIn-UDP" protocol=UDP dir=in action=allow profile=any localport=27017,27018,27019,28017,28018,28019 description="DCIT-Servers-mongodb" enable=yes



@REM -----------------------------------------------------------------------------------------------------------

@REM C:\windows\system32\ftp.exe

@REM # ftp
@netsh advfirewall firewall delete rule name="MSFTP_tcp" protocol=tcp dir=in profile=any  program="C:\Windows\system32\ftp.exe"
@netsh advfirewall firewall add rule name="MSFTP_tcp" protocol=tcp dir=in action=allow profile=any description="MSFTP_tcp" program="C:\Windows\system32\ftp.exe" enable=yes

@netsh advfirewall firewall delete rule name="MSFTP_udp" protocol=udp dir=in profile=any  program="C:\Windows\system32\ftp.exe"
@netsh advfirewall firewall add rule name="MSFTP_udp" protocol=udp dir=in action=allow profile=any description="MSFTP_udp" program="C:\Windows\system32\ftp.exe" enable=yes


@REM -----------------------------------------------------------------------------------------------------------






@REM -----------------------------------------------------------------------------------------------------------

@REM C:\Program Files\Java\jre6\bin\java.exe (Version 6.0.290.11)

@REM # Java
@netsh advfirewall firewall delete rule name="Java6.0.290.11_jre6_tcp" protocol=tcp dir=in profile=any  program="C:\Program Files\Java\jre6\bin\java.exe"
@netsh advfirewall firewall add rule name="Java6.0.290.11_jre6_tcp" protocol=tcp dir=in action=allow profile=any description="java" program="C:\Program Files\Java\jre6\bin\java.exe" enable=yes

@netsh advfirewall firewall delete rule name="Java6.0.290.11_jre6_udp" protocol=udp dir=in profile=any  program="C:\Program Files\Java\jre6\bin\java.exe"
@netsh advfirewall firewall add rule name="Java6.0.290.11_jre6_udp" protocol=udp dir=in action=allow profile=any description="java" program="C:\Program Files\Java\jre6\bin\java.exe" enable=yes


@REM c:\Program Files (x86)\Java\jre6\bin\java.exe (Version 6.0.290.11)

@REM # Java
@netsh advfirewall firewall delete rule name="jre-Java6.0.290.11_jre6_tcp" protocol=tcp dir=in profile=any  program="c:\Program Files (x86)\Java\jre6\bin\java.exe"
@netsh advfirewall firewall add rule name="jre-Java6.0.290.11_jre6_tcp" protocol=tcp dir=in action=allow profile=any description="java" program="c:\Program Files (x86)\Java\jre6\bin\java.exe" enable=yes

@netsh advfirewall firewall delete rule name="jre-Java6.0.290.11_jre6_udp" protocol=udp dir=in profile=any  program="c:\Program Files (x86)\Java\jre6\bin\java.exe"
@netsh advfirewall firewall add rule name="jre-Java6.0.290.11_jre6_udp" protocol=udp dir=in action=allow profile=any description="java" program="c:\Program Files (x86)\Java\jre6\bin\java.exe" enable=yes


@REM C:\Program Files\Java\jdk1.6.0_29\bin (Version 6.0.290.11)

@REM # jdk1.6.0_29
@netsh advfirewall firewall delete rule name="Java6.0.290.11_jdk_tcp" protocol=tcp dir=in profile=any  program="C:\Program Files\Java\jdk1.6.0_29\bin\java.exe"
@netsh advfirewall firewall add rule name="Java6.0.290.11_jdk_tcp" protocol=tcp dir=in action=allow profile=any description="jdk1.6.0_29" program="C:\Program Files\Java\jdk1.6.0_29\bin\java.exe" enable=yes

@netsh advfirewall firewall delete rule name="Java6.0.290.11_jdk_udp" protocol=udp dir=in profile=any  program="C:\Program Files\Java\jdk1.6.0_29\bin\java.exe"
@netsh advfirewall firewall add rule name="Java6.0.290.11_jdk_udp" protocol=udp dir=in action=allow profile=any description="jdk1.6.0_29" program="C:\Program Files\Java\jdk1.6.0_29\bin\java.exe" enable=yes


@REM C:\Program Files (x86)\Xinox Software\JCreatorV5LE\JCreator.exe (Version 5.0.0.10)

@REM # JCreator
@netsh advfirewall firewall delete rule name="JCreator5.0.0.10_tcp" protocol=tcp dir=in profile=any  program="C:\Program Files (x86)\Xinox Software\JCreatorV5LE\JCreator.exe"
@netsh advfirewall firewall add rule name="JCreator5.0.0.10_tcp" protocol=tcp dir=in action=allow profile=any description="JCreator" program="C:\Program Files (x86)\Xinox Software\JCreatorV5LE\JCreator.exe" enable=yes

@netsh advfirewall firewall delete rule name="JCreator5.0.0.10_udp" protocol=udp dir=in profile=any  program="C:\Program Files (x86)\Xinox Software\JCreatorV5LE\JCreator.exe"
@netsh advfirewall firewall add rule name="JCreator5.0.0.10_udp" protocol=udp dir=in action=allow profile=any description="JCreator" program="C:\Program Files (x86)\Xinox Software\JCreatorV5LE\JCreator.exe" enable=yes


@REM C:\Program Files\Java\jdk1.6.0_29\bin\javaws.exe (Version 6.0.290.11)

@REM # Javaws
@netsh advfirewall firewall delete rule name="javaws6.0.290.11_tcp" protocol=tcp dir=in profile=any  program="C:\Program Files\Java\jdk1.6.0_29\bin\javaws.exe"
@netsh advfirewall firewall add rule name="javaws6.0.290.11_tcp" protocol=tcp dir=in action=allow profile=any description="javaws" program="C:\Program Files\Java\jdk1.6.0_29\bin\javaws.exe" enable=yes

@netsh advfirewall firewall delete rule name="javaws6.0.290.11_udp" protocol=udp dir=in profile=any  program="C:\Program Files\Java\jdk1.6.0_29\bin\javaws.exe"
@netsh advfirewall firewall add rule name="javaws6.0.290.11_udp" protocol=udp dir=in action=allow profile=any description="javaws" program="C:\Program Files\Java\jdk1.6.0_29\bin\javaws.exe" enable=yes


@REM C:\Program Files\Java\jdk1.6.0_29\bin\javaw.exe (Version 6.0.290.11)

@REM # Javaw
@netsh advfirewall firewall delete rule name="javaw6.0.290.11_tcp" protocol=tcp dir=in profile=any  program="C:\Program Files\Java\jdk1.6.0_29\bin\javaw.exe"
@netsh advfirewall firewall add rule name="javaw6.0.290.11_tcp" protocol=tcp dir=in action=allow profile=any description="javaw" program="C:\Program Files\Java\jdk1.6.0_29\bin\javaw.exe" enable=yes

@netsh advfirewall firewall delete rule name="javaw6.0.290.11_udp" protocol=udp dir=in profile=any  program="C:\Program Files\Java\jdk1.6.0_29\bin\javaw.exe"
@netsh advfirewall firewall add rule name="javaw6.0.290.11_udp" protocol=udp dir=in action=allow profile=any description="javaw" program="C:\Program Files\Java\jdk1.6.0_29\bin\javaw.exe" enable=yes

@REM C:\program files (x86)\java\jre6\bin\javaw.exe (Version 6.0.290.11)

@REM # Javaw
@netsh advfirewall firewall delete rule name="jre-javaw6.0.290.11_tcp" protocol=tcp dir=in profile=any  program="C:\program files (x86)\java\jre6\bin\javaw.exe"
@netsh advfirewall firewall add rule name="jre-javaw6.0.290.11_tcp" protocol=tcp dir=in action=allow profile=any description="javaw" program="C:\program files (x86)\java\jre6\bin\javaw.exe" enable=yes

@netsh advfirewall firewall delete rule name="jre-javaw6.0.290.11_udp" protocol=udp dir=in profile=any  program="C:\program files (x86)\java\jre6\bin\javaw.exe"
@netsh advfirewall firewall add rule name="jre-javaw6.0.290.11_udp" protocol=udp dir=in action=allow profile=any description="javaw" program="C:\program files (x86)\java\jre6\bin\javaw.exe" enable=yes



@REM C:\Program Files\Java\jre6\bin\javacpl.exe (Version 6.0.290.11)

@REM # javacpl
@netsh advfirewall firewall delete rule name="javacpl6.0.290.11_tcp" protocol=tcp dir=in profile=any  program="C:\Program Files\Java\jre6\bin\javacpl.exe"
@netsh advfirewall firewall add rule name="javacpl6.0.290.11_tcp" protocol=tcp dir=in action=allow profile=any description="javacpl" program="C:\Program Files\Java\jre6\bin\javacpl.exe" enable=yes

@netsh advfirewall firewall delete rule name="javacpl6.0.290.11_udp" protocol=udp dir=in profile=any  program="C:\Program Files\Java\jre6\bin\javacpl.exe"
@netsh advfirewall firewall add rule name="javacpl6.0.290.11_udp" protocol=udp dir=in action=allow profile=any description="javacpl" program="C:\Program Files\Java\jre6\bin\javacpl.exe" enable=yes


@REM -----------------------------------------------------------------------------------------------------------




