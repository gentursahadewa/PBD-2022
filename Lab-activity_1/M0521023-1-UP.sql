--M0521023_Gentur Sahadewa

CREATE TABLE perpustakaan.dbo.BOOK (
	[BookId]		INTEGER NOT NULL,
	[Title]			NVARCHAR(64),
	[PublisherName]	NVARCHAR(64) NOT NULL
);

ALTER TABLE perpustakaan.dbo.BOOK
	ADD CONSTRAINT PK_BOOK PRIMARY KEY ([BookId]);

CREATE TABLE perpustakaan.dbo.PUBLISHER (
	[Name]			NVARCHAR(64) NOT NULL,
	[Address]		NVARCHAR(64),
	[Phone]			NVARCHAR(64)
);

ALTER TABLE perpustakaan.dbo.PUBLISHER 
	ADD CONSTRAINT PK_PUBLISHER PRIMARY KEY ([Name]);

CREATE TABLE perpustakaan.dbo.BOOK_AUTHORS (
	[BookId]		INTEGER NOT NULL,
	[AuthorName]	NVARCHAR(64) NOT NULL,
);
ALTER TABLE perpustakaan.dbo.BOOK
	ADD CONSTRAINT FK_BOOK FOREIGN KEY ([PublisherName]) REFERENCES PUBLISHER([Name]);
ALTER TABLE perpustakaan.dbo.BOOK_AUTHORS
	ADD CONSTRAINT PK_AUTHORS PRIMARY KEY ([BookId], [AuthorName]);




