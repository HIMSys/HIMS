CREATE TABLE [dbo].[Contact]
(
	[Id] INT NOT NULL,
	[AddressId] INT NOT NULL,
	[PhoneId] INT NOT NULL,

	CONSTRAINT PK_Contact PRIMARY KEY ([Id]),
	CONSTRAINT QC_Contact_To_Phone UNIQUE (PhoneId),
	CONSTRAINT FK_Contact_To_Address FOREIGN KEY (AddressId) REFERENCES [dbo].[Address](Id),
	CONSTRAINT FK_Contact_To_Phone FOREIGN KEY (PhoneId) REFERENCES [dbo].[Phone](Id)
)
