SELECT
  title
  , pages
WHERE
  pages = (SELECT MIN(pages) FROM books);

SELECT
  title
  , pages
FROM
  books
ORDER BY
  pages LIMIT 1;


SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;
