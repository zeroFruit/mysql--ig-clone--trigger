SELECT
  first_name
  , last_name
  , rating
FROM reviewers
JOIN reviews
  ON reviewers.id = reviews.reviewer_id;
