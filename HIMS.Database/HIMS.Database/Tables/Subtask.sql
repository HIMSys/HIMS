CREATE TABLE [dbo].[Subtask]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(MAX), --optional
	[StartDate] Date,            --optional
	[EndDate] Date,              --optional
	[OriginalEstimate] INT,      --optional, if the task cannot be divided in parts

	CONSTRAINT PK_Subtask PRIMARY KEY ([Id])
)
