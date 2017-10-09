﻿CREATE TABLE [dbo].[TodoSubtask]
(
	[Id] INT IDENTITY (1,1) NOT NULL, 
    [SubtaskId] INT NOT NULL, 
    [TodoId] INT NOT NULL

	CONSTRAINT [PK_TodoSubtask] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_TodoSubtask_To_Subtask] FOREIGN KEY ([SubtaskId]) REFERENCES [Subtask]([Id]) ON DELETE CASCADE ON UPDATE CASCADE, 
    CONSTRAINT [FK_TodoSubtask_To_Todo] FOREIGN KEY ([TodoId]) REFERENCES [Todo]([Id]) ON DELETE CASCADE ON UPDATE CASCADE, 
)
