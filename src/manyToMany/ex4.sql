SELECT
  title AS unreviewed_series
FROM series
WHERE id NOT IN (
  SELECT
    DISTINCT series_id
  FROM reviews
);

SELECT
  title AS unreviewed_series
FROM series
LEFT JOIN reviews
  ON series.id = reviews.series_id
WHERE reviews.id IS NULL;
