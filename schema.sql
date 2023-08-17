DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publish_date DATE,
    archived BOOLEAN,
    multiplayers BOOLEAN,
    lastplayed_date DATE,
    author_id INTEGER REFERENCES authors(id) ON DELETE CASCADE
);
