﻿CREATE TABLE [dbo].[KnowledgeTest]
(
	[Id] INT NOT NULL, 
    [TestTypeId] INT NOT NULL, 
    [Result] FLOAT NOT NULL, 
    [TestDate] DATE NOT NULL
	
	CONSTRAINT [PK_KnowledgeTest] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_KnowledgeTest_To_TestType] FOREIGN KEY ([TestTypeId]) REFERENCES [TestType]([Id]) ON DELETE SET NULL,
	
	
)