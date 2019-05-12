SELECT mc.CountryCode, 
       COUNT(mc.MountainId) AS MountainRanges  
  FROM Countries AS c
INNER JOIN MountainsCountries AS mc
ON mc.CountryCode = c.CountryCode 
WHERE c.CountryName IN ('United States', 'Russia', 'Bulgaria')
GROUP BY mc.CountryCode