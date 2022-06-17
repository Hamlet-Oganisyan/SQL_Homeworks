--
CREATE TABLE IF NOT EXISTS Genre (
genre_id SERIAL PRIMARY KEY,
genre_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singers (
singer_id SERIAL PRIMARY KEY,
singer_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
album_id SERIAL PRIMARY KEY,
album_name VARCHAR(40) UNIQUE NOT null,
year_release date
);

CREATE TABLE IF NOT EXISTS Trecks (
treck_id SERIAL PRIMARY KEY,
treck_name VARCHAR(40) NOT null,
treck_duration float  NOT null
);

CREATE TABLE IF NOT EXISTS Collections (
collection_id SERIAL PRIMARY KEY,
collection_name VARCHAR(40) UNIQUE NOT null,
year_release date
);

CREATE TABLE IF NOT EXISTS Genre_Singers (
	genre_id INTEGER REFERENCES Genre(genre_id),
	singer_id INTEGER REFERENCES Singers(singer_id),
	CONSTRAINT gs PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Singers_Albums (
	singer_id INTEGER REFERENCES Singers(singer_id),
	album_id INTEGER REFERENCES Albums(album_id),
	CONSTRAINT sa PRIMARY KEY (singer_id, album_id )
);

CREATE TABLE IF NOT EXISTS Trecks_Collections (
	treck_id INTEGER REFERENCES Trecks(treck_id),
	collection_id INTEGER REFERENCES Collections(collection_id),
	CONSTRAINT tc PRIMARY KEY (treck_id, collection_id)
);



