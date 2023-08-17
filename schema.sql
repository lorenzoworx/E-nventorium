-- Create the 'labels' table
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

-- Create the 'books' table
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  label_id INT NOT NULL,
  FOREIGN KEY (label_id) REFERENCES labels(id)
);
