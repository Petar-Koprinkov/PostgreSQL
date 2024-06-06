CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(searched_balance NUMERIC)
AS
$$
	DECLARE
		holder_info RECORD;
	BEGIN
		FOR holder_info IN
			(SELECT
				SUM(a.balance) AS sum_balance,
				CONCAT_WS(' ', ac.first_name, ac.last_name) AS full_name
			FROM
				account_holders AS ac
			JOIN
				accounts AS a
			ON	
				ac.id = a.account_holder_id
			GROUP BY
				full_name
			HAVING
				SUM(a.balance) > searched_balance
			ORDER BY
				full_name)
		LOOP
			RAISE NOTICE '% - %', holder_info.sum_balance, holder_info.full_name;
		END LOOP;
	END;
$$
LANGUAGE plpgsql;


