BACKUP DATABASE SoftUni  
TO DISK = 'C:\usb flash\softuni-backup.Bak'  
WITH FORMAT,  
MEDIANAME = 'Z_SQLServerBackups',  
NAME = 'Full Backup of softuni-backup';  

DROP DATABASE SoftUni

USE master

RESTORE DATABASE SoftUni
FROM DISK = 'C:\usb flash\softuni-backup.Bak'

USE SoftUni