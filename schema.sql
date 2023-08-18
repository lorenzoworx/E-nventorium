CREATE TABLE genres (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
)

CREATE TABLE items (
  id INT PRIMARY KEY NOT NULL,
  genre_id INTEGER REFERENCES genres(id),
  publish_date DATE,
  archived BOOLEAN,
);

CREATE TABLE music_albums (
  id INT PRIMARY KEY NOT NULL,
  publish_date DATE,
  archived Boolean,
  on_spotify BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
);
 