-- Tulis SQL query untuk menjawab nomor 1
	SELECT [Title], [Address] 
	FROM [BOOK], [PUBLISHER] 
	ORDER BY [Title] ASC;

-- Tulis SQL query untuk menjawab nomor 2
	SELECT [Title], COUNT([AuthorName]) AS [JumlahPenulis]
	FROM [BOOK], [BOOK_AUTHORS]
	WHERE [BOOK_AUTHORS].[BookId] = [BOOK].[BookId]
	GROUP BY [Title]
	ORDER BY [Title] ASC;

 --Tulis SQL query untuk menjawab nomor 3
	SELECT TOP 5 [BORROWER].[Name], COUNT([BOOK_LOANS].[CardNo]) AS [JumlahPinjaman]
	FROM [BORROWER], [BOOK_LOANS]
	WHERE [BOOK_LOANS].CardNo = [BORROWER].[CardNo]
	GROUP BY [Name]
	ORDER BY [JumlahPinjaman] DESC;

 --Tulis SQL query untuk menjawab nomor 4
	SELECT [LIBRARY_BRANCH].[BranchName], [BOOK].[Title], [BOOK_COPIES].[No_Of_Copies]-[TOTAL].[Total] [Ketersediaan]
	FROM [BOOK_COPIES] JOIN
		(
			SELECT [BOOK_COPIES].[BranchId], [BOOK_COPIES].[BookId], COUNT([BOOK_LOANS].[BookId]) [Total]
			FROM [BOOK_COPIES] LEFT JOIN [BOOK_LOANS] --LEFT JOIN [LIBRARY_BRANCH] LEFT JOIN [BOOK]
			ON [BOOK_COPIES].[BookId] = [BOOK_LOANS].[BookId] 
			AND [BOOK_COPIES].[BranchId] = [BOOK_LOANS].[BranchId] 
			GROUP BY [BOOK_COPIES].[BookId], [BOOK_COPIES].[BranchId]
		)	AS [TOTAL]
	ON [BOOK_COPIES].[BookId] = [TOTAL].[BookId] AND [BOOK_COPIES].[BranchId] = [TOTAL].[BranchId]
	JOIN [BOOK] ON [BOOK].[BookId] = [BOOK_COPIES].BookId JOIN [LIBRARY_BRANCH] ON [LIBRARY_BRANCH].[BranchId] = [BOOK_COPIES].BranchId
	ORDER BY [BranchName], [Title] ASC;

-- Tulis SQL query untuk menjawab nomor 5

	SELECT TOP 5 [BORROWER].[Name], [BORROWER].[CardNo], SUM(DATEDIFF(DAY, [BOOK_LOANS].[DueDate], '2022-10-26')*5000) [Denda]
	FROM [BOOK_LOANS] JOIN [BORROWER] ON [BOOK_LOANS].[CardNo] = [BORROWER].[CardNo]
	WHERE [BOOK_LOANS].[DueDate] < '2022-10-26'
	GROUP BY [BORROWER].[Name], [BORROWER].[CardNo]
	ORDER BY [Denda] DESC;
