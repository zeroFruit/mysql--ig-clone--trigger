SELECT author_lname FROM books ORDER BY author_lname;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT title FROM bOOKS ORDER BY title;

SELECT
  title
  , author_fname
  , author_lname
FROM
  books
ORDER BY
  2;

SELECT
  author_fname
  , author_lname
FROM
  books
ORDER BY
  author_fname
  , author_lname;

SELECT
  title
  , released_year
FROM
  books
ORDER BY
  released_year DESC
LIMIT
  5;
