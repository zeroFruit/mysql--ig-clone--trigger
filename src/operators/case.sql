SELECT title, stock_quantity,
CASE
  WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
  WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
  ELSE '***'
END AS Stock
FROM books;

SELECT title, stock_quantity,
  CASE
    WHEN stock_quantity <= 50 THEN '*'
    WHEN stock_quantity <= 100 THEN '**'
    ELSE '***'
  END AS stock
FROM books;
