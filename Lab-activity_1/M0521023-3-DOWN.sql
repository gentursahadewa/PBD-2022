--M0521023_Gentur Sahadewa

--mengembalikan keadaan sebelum dijalankannnya V 3 down

ALTER TABLE BOOK
	DROP CONSTRAINT FK_BOOK_PUBLISHERID;

ALTER TABLE PUBLISHER
	DROP CONSTRAINT PK_PUBLISHERID;

ALTER TABLE BOOK
	DROP COLUMN [PublisherId];

ALTER TABLE PUBLISHER
	DROP COLUMN [PublisherId];

ALTER TABLE BOOK
	ADD [PublisherName] NVARCHAR(64) NOT NULL;

ALTER TABLE PUBLISHER 
	ADD CONSTRAINT PK_PUBLISHER PRIMARY KEY ([Name]);

ALTER TABLE BOOK
	ADD CONSTRAINT FK_BOOK FOREIGN KEY ([PublisherName]) REFERENCES PUBLISHER([Name]); 
