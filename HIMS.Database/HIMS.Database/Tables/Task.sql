CREATE TABLE [dbo].[Task]
(
	[Id] INT IDENTITY (1,1) NOT NULL, 
    [Name] NVARCHAR(25) NOT NULL, 
    [Description] NVARCHAR(255) NOT NULL, 
	[StartDate] DATETIME NOT NULL,
	[Deadline] DATETIME NULL DEFAULT NULL, 	--DEFAULT NULL means "no deadline"
    [TimeStamp] TIMESTAMP NOT NULL, 

	CONSTRAINT PK_Task PRIMARY KEY ([Id])
)

