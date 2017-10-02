CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL, 
    [City] NVARCHAR(20) NOT NULL, 
    [Street] NVARCHAR(30) NOT NULL, 
    [HouseNo] INT NULL, 
    [FlatNo] INT NULL DEFAULT NULL, -- some houses have no flat number 
    [ZipCode] NVARCHAR(10) NULL DEFAULT NULL

	CONSTRAINT [PK_Address] PRIMARY KEY ([Id]), 	
)
