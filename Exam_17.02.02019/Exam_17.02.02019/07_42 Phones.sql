SELECT FirstName, [Address], Phone FROM Students
WHERE MiddleName IS NOT NULL AND LEFT(Phone,2) = '42'
ORDER BY FirstName