CREATE TABLE [dbo].[KnowledgeAssessment]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[TestId] INT,
	[AverageScore] FLOAT,
	[MathScore] FLOAT,

	CONSTRAINT PK_KnowledgeAssessment PRIMARY KEY ([Id]),
	CONSTRAINT FK_KnowledgeAssessment_To_Test FOREIGN KEY (TestId) REFERENCES Test(Id) ON DELETE CASCADE
)
