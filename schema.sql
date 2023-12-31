
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
-- Create the 'authors' table
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Create the 'labels' table
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

-- Create the 'genres' table
CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

-- Create the 'books' table
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  label_id INT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Create the 'games' table
CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN
  multiplayer BOOLEAN,
  played_at_date DATE,
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  label_id INT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Create the 'music_albums' table
CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN
  on_spotify BOOLEAN NOT NULL,
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  label_id INT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);
