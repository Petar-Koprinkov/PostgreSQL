CREATE TABLE IF NOT EXISTS addresses(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS categories(
	id SERIAL PRIMARY KEY,
	name VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS clients(
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS drivers(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	age INTEGER NOT NULL, 
	rating NUMERIC(2) DEFAULT 5.5,

	CONSTRAINT age_positive_number
	CHECK (age > 0)
);

CREATE TABLE IF NOT EXISTS cars(
	id SERIAL PRIMARY KEY,
	make VARCHAR(20) NOT NULL,
	model VARCHAR(20),
	year INTEGER NOT NULL DEFAULT 0,
	mileage INTEGER DEFAULT 0,
	condition CHAR(1) NOT NULL,
	category_id INTEGER NOT NULL,

	CONSTRAINT fk_cars_categories
	FOREIGN key (category_id)
	REFERENCES categories(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT ck_year_greater_than_zero
	CHECK (year > 0),
	
	CONSTRAINT ck_mileage_greater_than_zero
	CHECK (mileage > 0)
);

CREATE TABLE IF NOT EXISTS courses(
	id SERIAL PRIMARY KEY,
	from_address_id INTEGER NOT NULL,
	start TIMESTAMP NOT NULL,
	bill NUMERIC(10,2) DEFAULT 10, 
	car_id INTEGER NOT NULL, 
	client_id INTEGER NOT NULL, 

	CONSTRAINT fk_courses_clients_id
	FOREIGN KEY (client_id)
	REFERENCES clients(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT fk_courses_cars_id
	FOREIGN KEY (car_id)
	REFERENCES cars(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT fk_courses_addresses_id
	FOREIGN KEY (from_address_id)
	REFERENCES addresses(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT ck_bill_greater_than_ten
	CHECK (bill > 0)
);

CREATE TABLE IF NOT EXISTS cars_drivers(
	car_id INTEGER NOT NULL,
	driver_id INTEGER NOT NULL,

	CONSTRAINT fk_cars_drivers_cars
	FOREIGN KEY (car_id)
	REFERENCES cars(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT fk_cars_drivers_drivers
	FOREIGN KEY (driver_id)
	REFERENCES drivers(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);



