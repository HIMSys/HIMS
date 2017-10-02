CREATE TABLE [dbo].[ProgressSubtask]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[ProgrssId] INT NOT NULL,
	[SubtaskId] INT NOT NULL,
	[Duration] INT --int type as number of minutes

	CONSTRAINT [PK_ProgressSubtask] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_ProgressSubtask_To_Progress] FOREIGN KEY ([ProgrssId]) REFERENCES [Progress]([Id]),
	CONSTRAINT [FK_ProgressSubtask_To_Subtask] FOREIGN KEY ([SubtaskId]) REFERENCES [Subtask]([Id]),
)