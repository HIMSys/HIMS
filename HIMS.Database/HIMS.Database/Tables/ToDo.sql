﻿CREATE TABLE [dbo].[Todo]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Description] NVARCHAR(255) NULL,
	[EstimatedStartDate] DATETIME NOT NULL,
	[EstimatedEndDate] DATETIME NOT NULL,
	[TimeStamp] TIMESTAMP NOT NULL,
	[SubtaskId] INT NOT NULL

	CONSTRAINT [PK_Todo] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_Todo_To_Subtask] FOREIGN KEY ([SubtaskId]) REFERENCES [Subtask]([Id]),
)