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
            FROM [HIMSIntityDB].[dbo].[AspNetUsers] AS A
            WHERE I.Id = A.Id
			)
		)
		BEGIN
			RAISERROR('Lookup Value Not Found, Insert Failed',16,1);
			ROLLBACK;
		END
    END
