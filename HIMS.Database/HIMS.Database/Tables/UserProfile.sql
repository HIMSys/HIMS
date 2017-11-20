CREATE TABLE [dbo].[UserProfile]
(
	[Id] INT IDENTITY(1,1) NOT NULL,
	[ContactId] INT NULL,
	[DirectionId] INT NULL,
	[Name] NVARCHAR(25) NOT NULL,
	[LastName] NVARCHAR(25) NOT NULL,
	[Sex] CHAR(1) NOT NULL,
	[Education] NVARCHAR(100) NOT NULL,
	[Birthday] DATE NOT NULL,
	[AverageScore] FLOAT NULL,
	[MathScore] FLOAT NULL

	CONSTRAINT [PK_UserProfile] PRIMARY KEY ([Id]),
	CONSTRAINT [Unique_ContactId] UNIQUE ([ContactId]),
	CONSTRAINT [FK_UserProfile_To_Contact] FOREIGN KEY ([ContactId]) REFERENCES [Contact]([Id]) ON DELETE SET NULL,
	CONSTRAINT [FK_UserProfile_To_Direction] FOREIGN KEY ([DirectionId]) REFERENCES [Direction]([Id]) ON DELETE SET NULL
)

GO

--CREATE TRIGGER [dbo].[CrossDB_FK_Trigger]
--    ON [dbo].[UserProfile]
--    FOR INSERT, UPDATE
--    AS
--    BEGIN
--        SET NoCount ON

--		IF EXISTS (
--        SELECT * FROM INSERTED AS I
--        WHERE NOT EXISTS (
--            SELECT *
--            FROM [HIMSIntityDB].[dbo].[AspNetUsers] AS A
--            WHERE I.Id = A.Id
--			)
--		)
--		BEGIN
--			RAISERROR('Lookup Value Not Found, Insert Failed',16,1);
--			ROLLBACK;
--		END
--    END