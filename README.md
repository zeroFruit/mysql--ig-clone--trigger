# SQL ig-clone & trigger

## About
* instagram clone, simple version table schema. and with several senarios
* trigger


### ig-clone

```
DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users(
  id INT AUTO_INCREMENT PRIMARY KEY
  , username VARCHAR(255) UNIQUE NOT NULL
  , created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
  id INT AUTO_INCREMENT PRIMARY KEY
  , image_url VARCHAR(255) NOT NULL
  , user_id INT NOT NULL
  , created_at TIMESTAMP DEFAULT NOW()
  , FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments(
  id INT AUTO_INCREMENT PRIMARY KEY
  , comment_text VARCHAR(255) NOT NULL
  , user_id INT NOT NULL
  , photo_id INT NOT NULL
  , create_at TIMESTAMP DEFAULT NOW()
  , FOREIGN KEY(user_id) REFERENCES users(id)
  , FOREIGN KEY(photo_id) REFERENCES photos(id)
);

CREATE TABLE likes(
  user_id INT NOT NULL
  , photo_id INT NOT NULL
  , create_at TIMESTAMP DEFAULT NOW()
  , FOREIGN KEY(user_id) REFERENCES users(id)
  , FOREIGN KEY(photo_id) REFERENCES photos(id)
  , PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows(
  follower_id INT NOT NULL
  , followee_id INT NOT NULL
  , created_at TIMESTAMP DEFAULT NOW()
  , FOREIGN KEY(follower_id) REFERENCES users(id)
  , FOREIGN KEY(followee_id) REFERENCES users(id)
  , PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags(
  id INT AUTO_INCREMENT PRIMARY KEY
  , tag_name VARCHAR(255) UNIQUE
  , created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
  photo_id INT NOT NULL
  , tag_id INT NOT NULL
  , FOREIGN KEY(photo_id) REFERENCES photos(id)
  , FOREIGN KEY(tag_id) REFERENCES tags(id)
  , PRIMARY KEY(photo_id, tag_id)
);

-- We want to reward our users who have been
-- around the longest
-- Find the 5 oldest users.
SELECT
  id
  , username
  , created_at
FROM users
ORDER BY created_at
LIMIT 5;

-- What day of the week do
-- most users register on?
-- We need to figure out when
-- to schedule an ad campgain
SELECT
  WEEKDAY(created_at) AS day
  , COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

SELECT
  DAYNAME(created_at) AS day
  , COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

-- We want to target our inactive
-- users with an email campaign.
-- Find the users who have never posted a photo.
SELECT
  users.id
  , username
FROM users
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE photos.user_id IS NULL;

-- We're running a new contest
-- to see who can get the most
-- likes on a single photo
SELECT
  users.username
  , photos.image_url
  , COUNT(*) as total
FROM likes
INNER JOIN users
  ON photos.user_id = users.id
INNER JOIN photos
  ON photos.id = likes.photo_id
GROUP BY likes.photo_id
ORDER BY total DESC
LIMIT 10;

SELECT
  users.username
  , photos.image_url
  , COUNT(*) as total
FROM photos
INNER JOIN likes
  ON likes.photo_id = photos.id
INNER JOIN users
  ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 10;


-- Our Investors want to know
-- How many times does the average user post?
SELECT
  (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)
  AS AVG;

-- A brand wants to know which hastags to use in a post
-- What are the top 5 most commonly used hastags
SELECT
  tags.id
  , tags.tag_name
  , COUNT(*) AS total
FROM tags
INNER JOIN photo_tags
  ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- We have a small problem with bots on our site
-- Find users who have liked every single photo on the site
SELECT
  COUNT(*)
FROM users
LEFT JOIN likes
  ON users.id = likes.user_id
WHERE likes.user_id IS NOT NULL;

SELECT
  username
  , COUNT(*) AS num_likes
FROM users
INNER JOIN likes
  ON users.id = likes.user_id
GROUP BY users.id
HAVING num_likes = (SELECT COUNT(*) FROM photos);

```
