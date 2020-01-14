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
netsh advfirewall firewall add rule name="Custom - VirtualBox Manager" dir=in action=allow program="C:\program files\oracle\virtualbox\virtualbox.exe" enable=yes profile=any 







