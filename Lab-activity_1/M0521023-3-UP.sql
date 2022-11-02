--M0521023_Gentur Sahadewa

/* Menggunakan Alter Table untuk
- menambahkan column 
- menghapus column
- menghapus constraint
- menambah constraint
*/
ALTER TABLE PUBLISHER
	ADD [PublisherId] INTEGER NOT NULL;

ALTER TABLE BOOK
	DROP CONSTRAINT FK_BOOK; --Drop constraint FK terlebih dahulu 

ALTER TABLE PUBLISHER
	DROP CONSTRAINT PK_PUBLISHER;

ALTER TABLE BOOK
	DROP COLUMN [PublisherName];

ALTER TABLE BOOK
	ADD [PublisherId] INTEGER NOT NULL;

ALTER TABLE PUBLISHER
	ADD CONSTRAINT PK_PUBLISHERID PRIMARY KEY ([PublisherId]);

ALTER TABLE BOOK
	ADD CONSTRAINT FK_BOOK_PUBLISHERID FOREIGN KEY ([PublisherId]) REFERENCES PUBLISHER([PublisherId]);

