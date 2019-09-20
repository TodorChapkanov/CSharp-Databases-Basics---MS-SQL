SELECT Username,
RIGHT(Email,LEN(Email) - CHARINDEX('@', Email))  AS [Provider] FROM Users
ORDER BY Provider , USERNAME ASC