CREATE TABLE IF NOT EXISTS countries (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS customers (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender CHAR(1),
	age INTEGER NOT NULL,
	phone_number CHAR(10) NOT NULL,
	country_id INTEGER NOT NULL,

	CONSTRAINT fk_customers_countries
		FOREIGN KEY (country_id)
		REFERENCES countries(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,

	CONSTRAINT ck_gender_f_or_m
		CHECK(gender IN ('F', 'M')),

	CONSTRAINT age_greater_than_zero
		CHECK(age > 0)
);

CREATE TABLE IF NOT EXISTS products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL,
	description VARCHAR(250),
	recipe TEXT,
	price NUMERIC(10,2) NOT NULL,

	CONSTRAINT ck_price_greater_than_zero
		CHECK(price > 0)
);

CREATE TABLE IF NOT EXISTS feedbacks(
	id SERIAL PRIMARY KEY,
	description VARCHAR(255),
	rate NUMERIC(4,2),
	product_id INTEGER NOT NULL, 
	customer_id INTEGER NOT NULL, 

	CONSTRAINT fk_feedbacks_customers
		FOREIGN KEY (customer_id)
		REFERENCES customers(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT fk_feedbacks_products
		FOREIGN KEY (product_id)
		REFERENCES products(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,

	CONSTRAINT ck_rate_between_zero_ten
		CHECK (rate BETWEEN 0 AND 10)
);

CREATE TABLE IF NOT EXISTS distributors(
	id SERIAL PRIMARY KEY,
	name VARCHAR(25) UNIQUE NOT NULL,
	address VARCHAR(30) NOT NULL,
	summary VARCHAR(200) NOT NULL,
	country_id INTEGER NOT NULL,

	CONSTRAINT fk_distributors_countries
		FOREIGN KEY (country_id)
		REFERENCES countries(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ingredients(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	description VARCHAR(200),
	country_id INTEGER NOT NULL,
	distributor_id INTEGER NOT NULL,

	CONSTRAINT fk_ingredients_countries
		FOREIGN KEY (country_id)
		REFERENCES countries(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT fk_ingredients_distributors
		FOREIGN KEY (distributor_id)
		REFERENCES distributors(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS products_ingredients(
	product_id INTEGER,
	ingredient_id INTEGER,

	CONSTRAINT fk_products_ingredients_products
		FOREIGN KEY (product_id)
		REFERENCES products(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT fk_products_ingredients_ingredients
		FOREIGN KEY (ingredient_id)
		REFERENCES ingredients(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
); 