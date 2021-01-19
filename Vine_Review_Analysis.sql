-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- total votes over 20
SELECT * INTO total_votes_over20
FROM vine_table
WHERE total_votes >= 20;

-- helpful votes
SELECT * INTO helpful_votes_over50
FROM total_votes_over20
WHERE CAST(helpful_votes AS float)/CAST(total_votes AS float) >=0.5;

-- paid reviews
SELECT * INTO paid_reviews
FROM helpful_votes_over50
WHERE vine = 'Y';

-- unpaid reviews
SELECT * INTO unpaid_reviews
FROM helpful_votes_over50
WHERE vine = 'N';

-- total number of paid reviews
SELECT count(total_votes) AS total_paid FROM paid_reviews;

-- paid reviews with 5 stars
SELECT count (star_rating) AS five_stars
FROM paid_reviews
WHERE star_rating = 5;

-- total number of unpaid reviews
SELECT count(total_votes) AS total_unpaid FROM unpaid_reviews;

-- paid reviews with 5 stars
SELECT count (star_rating) AS five_stars
FROM unpaid_reviews
WHERE star_rating = 5;