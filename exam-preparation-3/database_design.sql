CREATE TABLE IF NOT EXISTS categories (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS addresses (
	id SERIAL PRIMARY KEY,
	street_name VARCHAR(100) NOT NULL,
	street_number INTEGER NOT NULL,
	town VARCHAR(30) NOT NULL,
	country VARCHAR(50) NOT NULL,
	zip_code INTEGER NOT NULL,

	CONSTRAINT ck_street_number_is_positive
	CHECK (street_number > 0),

	CONSTRAINT ck_zip_code_is_positive
	CHECK (zip_code > 0)
);

CREATE TABLE IF NOT EXISTS publishers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	address_id INTEGER NOT NULL, -- FOREIGN KEY
	website VARCHAR(40), 
	phone VARCHAR(20),

	CONSTRAINT fk_publishers_addresses
		FOREIGN KEY (address_id)
		REFERENCES addresses(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS players_ranges(
	id SERIAL PRIMARY KEY,
	min_players INTEGER NOT NULL,
	max_players INTEGER NOT NULL,

	CONSTRAINT ck_min_players_is_positive
	CHECK(min_players > 0),

	CONSTRAINT ck_max_players_is_positive
	CHECK (max_players > 0)
);

CREATE TABLE IF NOT EXISTS creators (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS board_games(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	release_year INTEGER NOT NULL, 
	rating NUMERIC(2) NOT NULL,
	category_id INTEGER NOT NULL, 
	publisher_id INTEGER NOT NULL, 
	players_range_id INTEGER NOT NULL, 

	CONSTRAINT fk_board_games_categories
		FOREIGN KEY (category_id)
		REFERENCES categories(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT fk_board_games_publishers
		FOREIGN KEY (publisher_id)
		REFERENCES publishers(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT fk_board_games_players_ranges
		FOREIGN KEY (players_range_id)
		REFERENCES players_ranges(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT ck_release_year_is_positive
	CHECK (release_year > 0)
);

CREATE TABLE IF NOT EXISTS creators_board_games(
	creator_id INTEGER NOT NULL,
	board_game_id INTEGER NOT NULL,

	CONSTRAINT fk_creators_board_games_creators
		FOREIGN KEY (creator_id)
		REFERENCES creators(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT fk_creators_board_games_board_games
		FOREIGN KEY (board_game_id)
		REFERENCES board_games(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);