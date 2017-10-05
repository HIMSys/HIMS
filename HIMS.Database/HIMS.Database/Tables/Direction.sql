CREATE TABLE [dbo].[Direction]
(
	[Id] INT IDENTITY (1,1) NOT NULL, 
    [Name] NVARCHAR(25) NOT NULL, 
    [Description] NVARCHAR(255) NULL,

	CONSTRAINT [PK_Direction] PRIMARY KEY ([Id]),
	
)
