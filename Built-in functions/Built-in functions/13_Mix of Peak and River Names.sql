SELECT P.PeakName, R.RiverName ,
LOWER(CONCAT(LEFT(P.PeakName, LEN(P.PeakName) -1), R.RiverName)) AS [Mix]
FROM Peaks AS P, Rivers AS R 
WHERE RIGHT(P.PeakName, 1) = LEFT(R.RIVERNAME, 1)
ORDER BY Mix