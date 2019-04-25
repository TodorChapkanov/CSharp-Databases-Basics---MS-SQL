SELECT DepositGroup, 
       IsDepositExpired, 
       AVG(DepositInterest) AS [AverageInterest]
  FROM WizzardDeposits
WHERE YEAR(DepositExpirationDate) > 1985
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup DESC, IsDepositExpired ASC