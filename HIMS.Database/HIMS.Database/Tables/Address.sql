CREATE TABLE [dbo].[Address]
(
	[Id] INT IDENTITY(1,1) NOT NULL, 
    [City] NVARCHAR(20) NOT NULL, 
    [Street] NVARCHAR(30) NOT NULL, 
    [HouseNo] INT NULL, 
    [FlatNo] INT NULL , -- some houses have only one flat
    [ZipCode] NVARCHAR(10) NULL 

	CONSTRAINT [PK_Address] PRIMARY KEY ([Id]), 	
)
