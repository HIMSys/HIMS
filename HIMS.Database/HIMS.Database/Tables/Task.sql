CREATE TABLE [dbo].[Task]
(
	[Id] INT IDENTITY (1,1) NOT NULL, 
    [Name] NVARCHAR(25) NOT NULL, 
    [Description] NVARCHAR(255) NOT NULL, 
    [TimeStamp] TIMESTAMP NOT NULL, 
    [Deadline] DATETIME NULL DEFAULT NULL, 
	--DEFAULT NULL seems "no deadline"
    [StartDate] DATETIME NOT NULL,

	CONSTRAINT [PK_Task] PRIMARY KEY ([Id])
)

