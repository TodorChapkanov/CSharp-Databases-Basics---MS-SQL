SELECT s.Username, 
   AVG(f.Size) AS Size 
  FROM Users AS s
INNER JOIN Commits AS c
        ON s.Id = c.ContributorId
INNER JOIN Files AS f
        ON c.Id = f.CommitId
  GROUP BY s.Username
  ORDER BY Size DESC, s.Username