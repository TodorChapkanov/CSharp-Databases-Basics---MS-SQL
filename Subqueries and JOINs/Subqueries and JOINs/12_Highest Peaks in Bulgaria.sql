SELECT c.CountryCode, 
       m.MountainRange, 
	   p.PeakName, 
	   p.Elevation 
 FROM  Countries AS c
  JOIN MountainsCountries AS mc
    ON (mc.CountryCode = c.CountryCode AND c.CountryCode = 'BG')
  JOIN Mountains AS m
    ON m.Id = mc.MountainId
  JOIN Peaks AS p
    ON p.MountainId = m.Id
 WHERE p.Elevation > 2835
ORDER BY p.Elevation DESC