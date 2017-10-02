CREATE TABLE [dbo].[Phone]
(
	[Id] INT NOT NULL, 
    [MobilePhone] NVARCHAR(15) NOT NULL, 
    [Skype] NCHAR(30) NULL  -- if have no Skype account yet

	CONSTRAINT [PK_Phone] PRIMARY KEY ([Id])
)
