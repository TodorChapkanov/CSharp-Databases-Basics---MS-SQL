ALTER TABLE Users
DROP CONSTRAINT [PK__Users__3214EC07765DB51C]

ALTER TABLE Users
ADD CONSTRAINT PK_Users
PRIMARY KEY  (Id, Username)
