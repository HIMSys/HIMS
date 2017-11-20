CREATE TABLE [dbo].[Phone]
(
	[Id] INT IDENTITY(1,1) NOT NULL, 
    [MobilePhone] NVARCHAR(16) NOT NULL, 
    [Skype] NVARCHAR(30) NULL  -- if have no Skype account yet

	CONSTRAINT PK_Phone PRIMARY KEY ([Id]),
	CONSTRAINT UQ_MobilePhone UNIQUE ([MobilePhone]),
	CONSTRAINT UQ_Skype UNIQUE ([Skype])
)
