-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR NOT NULL,
  dob DATE,
  pob VARCHAR
);

INSERT INTO
    authors (name, dob, pob)
VALUES
    ('Karl Lottie', '1922-02-22', 'Chicago'),
    ('Bell Hooks', '1952-09-25', 'Hopkinsville'),
    ('Jane Austen', '1775-12-16', 'Steventon'),
    ('Jeff VanderMeer', '1968-07-07', 'Bellefonte'),
    ('Kurt Vonnegut', '1922-11-11', 'New York');