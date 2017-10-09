CREATE TABLE [dbo].[Progress]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[UserTaskId] INT NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL,
	[Note] NVARCHAR(MAX) NOT NULL,
	[Duration] INT NOT NULL, --int type as number of minutes
	[TimeStamp] TIMESTAMP NOT NULL

	CONSTRAINT PK_Progress PRIMARY KEY ([Id]),
	CONSTRAINT FK_Progress_To_UserTask FOREIGN KEY (UserTaskId) REFERENCES UserTask(Id) ON DELETE CASCADE ON UPDATE CASCADE
)
