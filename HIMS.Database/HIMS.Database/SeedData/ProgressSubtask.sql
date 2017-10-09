INSERT INTO [dbo].[ProgressSubtask]
	([ProgressId], [SubtaskId])
	VALUES
	(1, 1), -- для сабтаска 1 прогресс на 1 день 
	(2, 1), -- для сабтаска 1 прогресс на 2 день 
	(3, 2); -- для сабтаска 2 прогресс на 1 день (ProgressId = 3)