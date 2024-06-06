CREATE TABLE IF NOT EXISTS notification_emails(
	id SERIAL PRIMARY KEY,
	recipient_id INTEGER,
	subject VARCHAR,
	body TEXT
);

CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER
AS
$$
	BEGIN
		INSERT INTO 
			notification_emails (recipient_id, subject, body)
		VALUES	
			(
				NEW.account_id,
				CONCAT_WS(' ', 'Balance change for account:', NEW.account_id),
				CONCAT_WS(' ', 'On', DATE(NOW()), 'your balance was changed from', NEW.old_sum, NEW.new_sum)
				);
		RETURN NEW;
	END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_send_email_on_balance_change
AFTER UPDATE ON logs
FOR EACH ROW
EXECUTE FUNCTION trigger_fn_send_email_on_balance_change()