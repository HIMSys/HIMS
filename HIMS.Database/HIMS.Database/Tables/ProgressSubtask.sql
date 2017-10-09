CREATE TABLE [dbo].[ProgressSubtask]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[ProgressId] INT NOT NULL,
	[SubtaskId] INT NOT NULL,

	CONSTRAINT [PK_ProgressSubtask] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_ProgressSubtask_To_Progress] FOREIGN KEY ([ProgressId]) REFERENCES [Progress]([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT [FK_ProgressSubtask_To_Subtask] FOREIGN KEY ([SubtaskId]) REFERENCES [Subtask]([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
)