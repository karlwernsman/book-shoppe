-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS authors_books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;

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

CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR NOT NULL,
    released INT NOT NULL
);

INSERT INTO
    books (title, released)
VALUES
    ('Lottie, oh Lottie', 1969),
    ('Feminism is for Everybody', 2000),
    ('Emma', 1815),
    ('Annihilation', 2014),
    ('Authority', 2014),
    ('Acceptance', 2014),
    ('Breakfast of Champions', 1973),
    ('Mother Night', 1961),
    ('The Sirens of Titan', 1959);

CREATE TABLE authors_books(
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  author_id BIGINT,
  book_id BIGINT,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (book_id) REFERENCES books(id)  
);

INSERT INTO authors_books (author_id, book_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (4, 5),
    (4, 6),
    (5, 7),
    (5, 8),
    (5, 9);

