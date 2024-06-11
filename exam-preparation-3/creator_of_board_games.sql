CREATE OR REPLACE FUNCTION fn_creator_with_board_games(creator_name VARCHAR(30))
RETURNS INTEGER
AS
$$	DECLARE 
		result INTEGER;
	BEGIN
		SELECT
			COUNT(*) INTO result
		FROM
			creators_board_games
		WHERE
			creator_id = (SELECT id FROM creators WHERE first_name = creator_name);
		RETURN result;
	END;
$$
LANGUAGE plpgsql;