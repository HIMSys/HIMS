CREATE FUNCTION [dbo].[GetCurrentUserProfileId]
(
	@Id int
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT U.Id Id FROM UserProfile U WHERE U.Id = @Id)
END
