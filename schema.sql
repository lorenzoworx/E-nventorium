CREATE TABLE items (
  id INT PRIMARY KEY NOT NULL,
  genre_id INTEGER REFERENCES genres(id),
  publish_date DATE,
  archived BOOLEAN,
);

