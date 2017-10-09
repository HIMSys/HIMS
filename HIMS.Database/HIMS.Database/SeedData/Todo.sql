INSERT INTO [dbo].[Todo]
	([UserTaskId], [Description], [EstimatedStartDate], [EstimatedEndDate])
	VALUES
	(1, 'Add creation scripts for tables Direction, Contact', '2017-10-05 00:00:00', '2017-10-07 00:00:00'), -- Task(Id=1) Разработать таблицы для HIMS.Database (Женя)
	(1, 'Add creation scripts for table TodoSubtask', '2017-10-07 00:00:00', '2017-10-08 00:00:00'), -- Task(Id=1) Разработать таблицы для HIMS.Database (Женя)
	(1, 'Add creation scripts for tables ProgressSubtask, Todo', '2017-10-08 00:00:00', '2017-10-09 00:00:00'), -- Task(Id=1) Разработать таблицы для HIMS.Database (Женя)
	(2, 'Add creation scripts for tables UserTask, Task', '2017-10-05 00:00:00', '2017-10-07 00:00:00'), -- Task(Id=2) Разработать таблицы для HIMS.Database (Макс)
	(2, 'Add creation scripts for tables Subtask, TestType, Phone', '2017-10-07 00:00:00', '2017-10-09 00:00:00'), -- Task(Id=2) Разработать таблицы для HIMS.Database (Макс)
	(3, 'Add creation scripts for tables UserProfile, Test', '2017-10-05 00:00:00', '2017-10-07 00:00:00'), -- Task(Id=2) Разработать таблицы для HIMS.Database (Артем)
	(3, 'Add creation scripts for tables Address, Progress', '2017-10-08 00:00:00', '2017-10-09 00:00:00'); -- Task(Id=2) Разработать таблицы для HIMS.Database (Артем)