CREATE TABLE [dbo].[Progress]
(
	[Id] INT NOT NULL,
	[Date] NVARCHAR(50) NOT NULL,
	[Note] NVARCHAR(MAX) NOT NULL,
	[TimeStamp] TIMESTAMP NOT NULL, 
	[SubtaskId] INT, 

	CONSTRAINT PK_Progress PRIMARY KEY ([Id]),
	CONSTRAINT FK_Progress_To_ProgressSubtask FOREIGN KEY (SubtaskId) REFERENCES ProgressSubtask(Id)
)
