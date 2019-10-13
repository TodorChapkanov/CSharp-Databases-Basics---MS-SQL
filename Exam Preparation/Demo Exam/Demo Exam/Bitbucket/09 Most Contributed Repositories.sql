SELECT TOP (5)
            r.Id,
			r.[Name],
	  COUNT(c.ContributorId) AS Commits 
	   FROM Repositories AS r
 INNER JOIN RepositoriesContributors AS rc
         ON r.Id = rc.RepositoryId
 INNER JOIN Commits AS c
         ON c.RepositoryId = rc.RepositoryId
   GROUP BY r.Id, r.Name
   ORDER BY Commits DESC, r.Id, r.[Name]