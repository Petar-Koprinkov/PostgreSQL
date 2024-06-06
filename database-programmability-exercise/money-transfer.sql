CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id INTEGER, receiver_id INTEGER, amount NUMERIC(4))
AS
$$
	DECLARE
		current_balance NUMERIC;
		current_reciever_balance NUMERIC;
	BEGIN
		current_reciever_balance := (SELECT balance FROM accounts WHERE id = receiver_id);
		CALL sp_withdraw_money(sender_id, amount);
		CALL sp_deposit_money(receiver_id, amount);

	current_balance := (SELECT balance FROM accounts WHERE id = sender_id);
	IF current_balance < 0 THEN
		ROLLBACK;
	END IF;
	current_balance := (SELECT balance FROM accounts WHERE id = receiver_id);
	IF current_balance <> current_reciever_balance + amount THEN
		ROLLBACK;
	END IF;
	END;
$$
LANGUAGE plpgsql;
