SELECT F1.Id,
       f1.Name,
CONCAT(f1.Size, 'KB') AS Size
  FROM Files AS f1
LEFT OUTER JOIN Files AS f2
             ON f1.Id = f2.ParentId
          WHERE f2.Id IS NULL
       ORDER BY f1.Id, f1.[Name], f1.Size DESC