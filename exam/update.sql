UPDATE
	addresses
SET 
	country = 
	CASE
		WHEN SUBSTRING(country, 1, 1) = 'B' THEN 'Blocked'
		WHEN SUBSTRING(country, 1, 1) = 'T' THEN 'Test'
		WHEN SUBSTRING(country, 1, 1) = 'P' THEN 'In Progress'
		ELSE country
	END;


