CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INTEGER, money_amount NUMERIC(4))
AS
$$	DECLARE
		current_balance_before_deposit NUMERIC;
		current_balance_after_deposit NUMERIC;
	BEGIN
		current_balance_before_deposit := (SELECT balance FROM accounts WHERE id = account_id);
		UPDATE 
			accounts 
		SET	
			balance = balance +  money_amount
		WHERE
			accounts.id = account_id;
		current_balance_after_deposit := (SELECT balance FROM accounts WHERE id = account_id);

		IF current_balance_after_deposit <> money_amount + current_balance_before_deposit THEN
			ROLLBACK;
		END IF;
	END;
$$
LANGUAGE plpgsql;