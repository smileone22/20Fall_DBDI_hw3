CREATE TABLE temp (
    incident_key INTEGER, 
    occur_date TEXT,
    occur_time TEXT ,
    boro TEXT,
    precinct INTEGER,
    juri_code INTEGER,
    location_desc TEXT,
    murder_flag INTEGER,
    perp_age_group TEXT,
    perp_sex TEXT,
    perp_race TEXT,
    vic_age_group TEXT,
    vic_sex TEXT,
    vic_race TEXT,
    x_coo INTEGER,
    y_coo INTEGER,
    latitude real,
    longitude real,
    lon_lat TEXT
);

CREATE TABLE s_incident (
	incident_key INTEGER Primary Key, 
    occur_date TEXT,
    occur_time TEXT,
    boro TEXT,
    precinct INTEGER,
    juri_code INTEGER,
    location_desc TEXT,
    murder_flag INTEGER,
    perp_sex TEXT,
    perp_race TEXT,
    vic_sex TEXT,
    vic_race TEXT,
    latitude real,
    longitude real
);



