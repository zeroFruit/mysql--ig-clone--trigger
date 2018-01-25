SELECT
  title
  , rating
  , CONCAT(first_name, last_name) AS reviewer
FROM series, reviews, reviewers
WHERE series.id = reviews.series_id AND
      reviewers.id = reviews.reviewer_id
ORDER BY title, rating DESC;


SELECT
  title
  , rating
  , CONCAT(first_name, last_name) AS reviewer
FROM reviewers
  INNER JOIN reviews
    ON reviewers.id = reviews.reviewer_id
  INNER JOIN series
    ON series.id = reviews.series_id
ORDER BY title;
