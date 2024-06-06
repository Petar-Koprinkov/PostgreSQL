CREATE OR REPLACE PROCEDURE sp_withdraw_money(account_id INTEGER, money_amount NUMERIC(4))
AS
$$	
	DECLARE 
		balance_info NUMERIC;
	BEGIN
		
		UPDATE
			accounts	
		SET
			balance = balance - money_amount
		WHERE
			id = account_id;

		balance_info := (SELECT balance FROM accounts WHERE id = account_id);
	IF balance_info < 0 THEN
		ROLLBACK;
		RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
	END IF;
	END;
$$
LANGUAGE plpgsql;