CREATE TABLE [dbo].[UserProfile]
(
	[Id] INT NOT NULL,
	[LastName] NVARCHAR(25) NOT NULL,
	[ContactId] INT NOT NULL,
	[Sex] CHAR(1) NOT NULL,
	[Education] NVARCHAR(100) NOT NULL,
	[Birthday] DATE NOT NULL,
	[KnowledgeAssessmentId] INT NOT NULL

	CONSTRAINT [PK_UserProfile] PRIMARY KEY ([Id]),
	CONSTRAINT [FK_UserProfile_To_KnowledgeAssessment] FOREIGN KEY ([KnowledgeAssessmentId]) REFERENCES [KnowledgeAssessment]([Id]),
)

GO

CREATE TRIGGER [dbo].[CrossDB_FK_Trigger]
    ON [dbo].[UserProfile]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON

		IF EXISTS (
        SELECT * FROM INSERTED AS I
        WHERE NOT EXISTS (
            SELECT *
            FROM [OtherDatabase].[dbo].[UserSecurity] AS A
            WHERE I.Id = A.Id
			)
		)
		BEGIN
			RAISERROR('Lookup Value Not Found, Insert Failed',16,1);
			ROLLBACK;
		END
    END