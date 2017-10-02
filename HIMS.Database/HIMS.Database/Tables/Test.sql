CREATE TABLE [dbo].[Test]
(
	[Id] INT NOT NULL, 
    [TestTypeId] INT NOT NULL, 
    [Result] FLOAT NOT NULL, 
    [TestDate] DATE NOT NULL
	
	CONSTRAINT [PK_Test] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Test_To_TestType] FOREIGN KEY ([TestTypeId]) REFERENCES [TestType]([Id]) ON DELETE SET NULL,
	
	
)
