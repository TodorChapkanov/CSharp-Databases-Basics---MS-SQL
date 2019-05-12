WITH CTE_CountriesWithoutMountains (CountyCode, CountryName)
AS(
  SELECT c.CountryCode, c.CountryName FROM Countries AS c
  LEFT OUTER JOIN MountainsCountries AS mc
  ON mc.CountryCode = c.CountryCode
  WHERE mc.MountainId IS NULL
)

SELECT COUNT(CountriesWithoutMountains.CountryName) AS [CountryCode]
 FROM CTE_CountriesWithoutMountains AS CountriesWithoutMountains