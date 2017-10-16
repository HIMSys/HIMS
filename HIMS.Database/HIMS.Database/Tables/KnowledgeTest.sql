CREATE TABLE [dbo].[KnowledgeTest]
(
	[Id] INT IDENTITY(1,1) NOT NULL, 
	[UserId] INT NOT NULL,
    [TestTypeId] INT NULL, 
    [Result] FLOAT NULL, 
    [TestDate] DATE NULL
	
	CONSTRAINT [PK_KnowledgeTest] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_KnowledgeTest_To_UserProfile] FOREIGN KEY ([UserId]) REFERENCES [UserProfile]([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_KnowledgeTest_To_TestType] FOREIGN KEY ([TestTypeId]) REFERENCES [TestType]([Id]) ON DELETE SET NULL,
)
