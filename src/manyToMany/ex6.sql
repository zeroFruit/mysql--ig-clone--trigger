SELECT
  first_name
  , last_name
  , COUNT(reviews.id) AS COUNT
  , IFNULL(MIN(rating), 0) AS MIN
  , IFNULL(MAX(rating), 0) AS MAX
  , ROUND(IFNULL(AVG(rating), 0), 2) AS AVG
  , IF(reviews.id IS NOT NULL, 'ACTIVE', 'INACTIVE') AS STATUS
FROM reviewers
  LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;
