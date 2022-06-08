--
CREATE TABLE IF NOT EXISTS Genre (
genre_id SERIAL PRIMARY KEY,
genre_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singers (
singer_id SERIAL PRIMARY KEY,
genre_id int references Genre(genre_id),
singer_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
album_id SERIAL PRIMARY KEY,
album_name VARCHAR(40) UNIQUE NOT null,
singer_id int references Singers(singer_id),
year_release date
);

CREATE TABLE IF NOT EXISTS Trecks (
treck_id SERIAL PRIMARY KEY,
album_id int references Albums(album_id)
treck_name VARCHAR(40) NOT null,
treck_duration interval  NOT null
);

CREATE TABLE IF NOT EXISTS Collections (
collection_id SERIAL PRIMARY KEY,
collection_name VARCHAR(40) UNIQUE NOT null,
treck_id int references Trecks(treck_id)
year_release date,
);