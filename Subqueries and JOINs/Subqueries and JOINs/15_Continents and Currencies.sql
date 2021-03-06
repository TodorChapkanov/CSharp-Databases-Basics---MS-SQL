WITH CTE_Sample (ContinentCode, CurrencyCode, CurrencyUsage) 
AS (
SELECT 
		ContinentCode,
		CurrencyCode,
		COUNT(CurrencyCode) AS CurrencyUsage
	FROM Countries
GROUP BY ContinentCode, CurrencyCode
HAVING COUNT(CountryCode) > 1)

SELECT 
		ContinentMaximums.ContinentCode,
		CodeTaker.CurrencyCode,
		ContinentMaximums.TopCurrUsage
	FROM (SELECT
				ContinentCode,
				MAX(CurrencyUsage) AS TopCurrUsage
			FROM CTE_Sample
			GROUP BY ContinentCode) AS ContinentMaximums
	INNER JOIN CTE_Sample AS CodeTaker
	ON	CodeTaker.ContinentCode = ContinentMaximums.ContinentCode
		AND CodeTaker.CurrencyUsage = ContinentMaximums.TopCurrUsage
ORDER BY ContinentMaximums.ContinentCode
