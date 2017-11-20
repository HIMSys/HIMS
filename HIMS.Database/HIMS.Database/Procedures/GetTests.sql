CREATE PROCEDURE [dbo].[GetTests]
	@Id int
AS
	SET NOCOUNT ON
	SELECT K.Result, T.[Name]
	FROM KnowledgeTest K INNER JOIN TestType T ON K.TestTypeId = T.Id
	WHERE K.UserId = dbo.GetCurrentUserProfileId(@Id)
GO
