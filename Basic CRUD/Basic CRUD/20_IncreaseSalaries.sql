USE SoftUni

BACKUP DATABASE SoftUni
TO DISC = 'C:\SoftUni.BAK'
WITH FORMAT,
[MEDIANAME] = 'C_',
[NAME] = 'Full backup on SoftUni database'

UPDATE Employees
SET Salary = Salary * 1.12
WHERE DepartmentId IN(1,2,4,11)

SELECT Salary FROM Employees