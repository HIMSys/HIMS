CREATE TABLE [dbo].[Subtask]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(MAX),
	[StartDate] NVARCHAR(50),
	[EndDate] NVARCHAR(50),
	[OriginalEstimate] INT,

	CONSTRAINT PK_Subtask PRIMARY KEY ([Id])
)
