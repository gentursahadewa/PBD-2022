--M0521023_Gentur Sahadewa

--DROP CONSTRAINTS
ALTER TABLE perpustakaan.dbo.BOOK
	DROP CONSTRAINT PK_BOOK;

ALTER TABLE perpustakaan.dbo.BOOK
	DROP CONSTRAINT FK_BOOK;

ALTER TABLE perpustakaan.dbo.PUBLISHER
	DROP CONSTRAINT PK_PUBLISHER;

ALTER TABLE perpustakaan.dbo.BOOK_AUTHORS
	DROP CONSTRAINT PK_AUTHORS;

--DROP TABLE
DROP TABLE BOOK;
DROP TABLE PUBLISHER;
DROP TABLE BOOK_AUTHORS;