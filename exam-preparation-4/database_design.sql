CREATE TABLE IF NOT EXISTS towns(
	id SERIAL PRIMARY KEY,
	name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS stadiums(
	id SERIAL PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	capacity INTEGER NOT NULL,
	town_id INTEGER NOT NULL,

	CONSTRAINT fk_stadiums_towns
		FOREIGN KEY (town_id)	
		REFERENCES towns(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT ck_capacity_greater_than_zero
		CHECK(capacity > 0)
);

CREATE TABLE IF NOT EXISTS teams(
	id SERIAL PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	established DATE NOT NULL,
	fan_base INTEGER DEFAULT 0 NOT NULL,
	stadium_id INTEGER NOT NULL,

	CONSTRAINT fk_teams_stadiums
		FOREIGN KEY (stadium_id)
		REFERENCES stadiums(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,

	CONSTRAINT ck_fan_base_greater_or_equal_than_zero
		CHECK(fan_base >= 0)
);

CREATE TABLE IF NOT EXISTS coaches(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(10) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	salary NUMERIC(10,2) DEFAULT 0 NOT NULL, 
	coach_level INTEGER DEFAULT 0 NOT NULL, 
	
	CONSTRAINT ck_salary_greater_or_equal_than_zero
		CHECK (salary >= 0),

	CONSTRAINT ck_coach_level_greater_or_equal_than_zero
		CHECK (coach_level >= 0)
);

CREATE TABLE IF NOT EXISTS skills_data(
	id SERIAL PRIMARY KEY,
	dribbling INTEGER DEFAULT 0, 
	pace INTEGER DEFAULT 0, 
	passing INTEGER DEFAULT 0, 
	shooting INTEGER DEFAULT 0, 
	speed INTEGER DEFAULT 0, 
	strength INTEGER DEFAULT 0, 

	CONSTRAINT ck_dribbling_is_greater_or_equal_than_zero
		CHECK(dribbling >= 0),
	
	CONSTRAINT ck_pace_is_greater_or_equal_than_zero
		CHECK(pace >= 0),

	CONSTRAINT ck_passing_is_greater_or_equal_than_zero
		CHECK(passing>= 0),

	CONSTRAINT ck_shooting_is_greater_or_equal_than_zero
		CHECK(shooting >= 0),

	CONSTRAINT ck_speed_is_greater_or_equal_than_zero
		CHECK(speed >= 0),

	CONSTRAINT ck_strength_is_greater_or_equal_than_zero
		CHECK(strength >= 0)
);

CREATE TABLE IF NOT EXISTS players(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(10) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	age INTEGER DEFAULT 0 NOT NULL,
	position CHAR(1) NOT NULL,
	salary NUMERIC(10,2) DEFAULT 0 NOT NULL, 
	hire_date TIMESTAMP,
	skills_data_id INTEGER NOT NULL,
	team_id INTEGER,

	CONSTRAINT fk_players_teams
		FOREIGN KEY (team_id)
		REFERENCES teams(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,

	CONSTRAINT fk_players_skills_data
		FOREIGN KEY (skills_data_id)
		REFERENCES skills_data(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT ck_salary_is_greater_or_equal_than_zero
		CHECK(salary >= 0),
	
	CONSTRAINT ck_age_is_greater_or_equal_than_zero
		CHECK(age >= 0)
);

CREATE TABLE IF NOT EXISTS players_coaches(
	player_id INTEGER,
	coach_id INTEGER,

	CONSTRAINT fk_players_coaches_players
		FOREIGN KEY (player_id)
		REFERENCES players(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT fk_players_coaches_coaches
		FOREIGN KEY (coach_id)
		REFERENCES coaches(id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,

	CONSTRAINT pk_player_id_coach_id
		PRIMARY KEY (player_id, coach_id)
);