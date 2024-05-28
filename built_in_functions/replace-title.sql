UPDATE
	books
SET 
	title = REPLACE(title, 'The', '***')
WHERE 
	LEFT(title, 3) = 'The'
RETURNING title;