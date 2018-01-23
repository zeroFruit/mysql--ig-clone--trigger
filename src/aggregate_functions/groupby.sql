SELECT
  author_lname
  , COUNT(*)
FROM
  books
GROUP BY
  author_lname;


SELECT
  author_fname
  , author_lname
  , COUNT(*)
FROM
  books
GROUP BY
  author_fname
  , author_lname;
