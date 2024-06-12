UPDATE
	coaches	
SET
	salary = salary * coach_level
WHERE
	SUBSTRING(first_name,1 ,1) = 'C'
		AND 
	(SELECT COUNT(coach_id) FROM players_coaches WHERE coach_id = coaches.id) >= 1