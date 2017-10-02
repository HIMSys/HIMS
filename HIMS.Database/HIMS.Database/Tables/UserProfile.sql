CREATE TABLE [dbo].[UserProfile]
(
	[Id] INT NOT NULL,
	[LastName] NVARCHAR(25) NOT NULL,
	[ContactId] INT NOT NULL,
	[Sex] CHAR(1) NOT NULL,
	[Education] NVARCHAR(100) NOT NULL,
	[Birthday] DATE NOT NULL,
	[KnowledgeAssessmentId] INT NOT NULL

	CONSTRAINT [FK_UserSecurity_To_UserProfile] FOREIGN KEY ([Id]) REFERENCES [OtherDataBse].[UserSecurity]([Id]),
	CONSTRAINT [PK_UserProfile] PRIMARY KEY ([Id]),
	CONSTRAINT [FK_UserProfile_To_KnowledgeAssessment] FOREIGN KEY ([KnowledgeAssessmentId]) REFERENCES [KnowledgeAssessment]([Id]),
)
