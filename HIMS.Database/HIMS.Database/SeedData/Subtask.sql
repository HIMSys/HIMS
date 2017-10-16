INSERT INTO [dbo].[Subtask]
([UserTaskId], [Name], [Description], [StartDate], [EndDate], [OriginalEstimate], [SpendedTime], [isActive], [isDone])
VALUES
(1, 'Name of subtask # 1', 'Description of subtask # 1', '2017-10-08', '2017-10-18', 10, 8, 0, 1),
(1, 'Name of subtask # 2', 'Description of subtask # 2', '2017-10-18', '2017-10-21', 4, 4, 1, 0),
(1, 'Name of subtask # 3', 'Description of subtask # 3', '2017-10-22', '2017-11-01', 9, 9, 0, 0),
(2, 'Name of subtask # 1', 'Description of subtask # 1', '2017-10-08', '2017-10-18', 10, 8, 0, 1),
(2, 'Name of subtask # 2', 'Description of subtask # 2', '2017-10-18', '2017-10-21', 4, 4, 1, 0),
(2, 'Name of subtask # 2', 'Description of subtask # 2', '2017-10-22', '2017-11-01', 9, 9, 0, 0),
(3, 'Name of subtask # 1', 'Description of subtask # 1', '2017-10-08', '2017-10-18', 10, 8, 0, 1),
(3, 'Name of subtask # 2', 'Description of subtask # 2', '2017-10-18', '2017-10-21', 4, 4, 1, 0),
(3, 'Name of subtask # 2', 'Description of subtask # 2', '2017-10-22', '2017-11-01', 9, 9, 0, 0);