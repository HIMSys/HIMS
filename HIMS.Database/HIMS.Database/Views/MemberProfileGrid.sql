--Name, LastName, Email, Phone, Address, Skype, Age, Education, Tests

CREATE VIEW [dbo].[MemberProfileGrid]
	AS SELECT U.[Name] AS [Name], U.LastName AS [Last Name], P.MobilePhone AS Phone,
	P.Skype AS Skype, (A.ZipCode + ' '+ A.City + ' ' + A.Street + 
	' ' + CAST(A.HouseNo AS NVARCHAR(10)) + ' ' + CAST(A.FlatNo AS NVARCHAR(10))) AS [Address], U.Education AS Education,
		(CONVERT(int,CONVERT(char(8),GETDATE(),112))-CONVERT(char(8),U.Birthday,112))/10000 AS Age

	FROM UserProfile U, Contact C, Phone P, [Address] A
	WHERE U.Id = C.Id AND C.PhoneId = P.Id AND C.AddressId = A.Id
 
