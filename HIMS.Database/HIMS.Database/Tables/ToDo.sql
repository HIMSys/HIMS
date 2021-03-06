﻿CREATE TABLE [dbo].[Todo]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[UserTaskId] INT NOT NULL,
	[Description] NVARCHAR(MAX) NULL,
	[EstimatedStartDate] DATETIME NOT NULL,
	[EstimatedEndDate] DATETIME NOT NULL,
	[TimeStamp] TIMESTAMP NOT NULL,
	

	CONSTRAINT [PK_Todo] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_Todo_To_UserTask] FOREIGN KEY ([UserTaskId]) REFERENCES [UserTask]([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
)
