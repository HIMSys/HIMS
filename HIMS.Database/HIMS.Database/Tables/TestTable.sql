CREATE TABLE [dbo].[TestTable]
(
	[TestTableId] INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(25) NOT NULL,
	[Description] NVARCHAR(255) NULL

	CONSTRAINT [PK_TestTable] PRIMARY KEY ([TestTableId])
)