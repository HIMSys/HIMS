CREATE TABLE [dbo].[Subtask]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[UserTaskId] INT NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(MAX), --optional
	[StartDate] Date NULL DEFAULT NULL,            --optional
	[EndDate] Date NULL DEFAULT NULL,              --optional
	[OriginalEstimate] INT NULL DEFAULT NULL,      --optional, if the task cannot be divided in parts
	[SpendedTime] INT NULL DEFAULT NULL,
	[isActive] BIT NULL DEFAULT 0,
	[isDone] BIT NULL DEFAULT 0,
	[TimeStamp] TIMESTAMP NOT NULL,

	CONSTRAINT PK_Subtask PRIMARY KEY ([Id]),
	CONSTRAINT FK_Subtask_UserTask FOREIGN KEY ([UserTaskId]) REFERENCES [UserTask]([Id]) ON DELETE NO ACTION--CASCADE ON UPDATE CASCADE
)
