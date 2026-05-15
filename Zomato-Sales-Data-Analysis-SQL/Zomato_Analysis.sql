---Top rated restaurants

SELECT restaurant_id,
name,
rating
FROM Restaurants
WHERE rating >=4;

---Average rating per Restaurant

SELECT restaurant_id, AVG(rating) AS average_rating
FROM Reviews GROUP BY restaurant_id;

---Revenue Per Restaurant

SELECT restaurant_id,SUM(total_price) AS total_revenue
FROM Orders
GROUP BY restaurant_id;

---Highest Price of Dish

SELECT
restaurant_id,
MAX(price) AS highest_price
FROM Dishes
GROUP BY restaurant_id;

---Average Cuisine Rating

SELECT
    r.restaurant_id,
    r.name,
    r.rating
FROM Restaurants r
WHERE r.rating >
(
    SELECT AVG(r2.rating)
    FROM Restaurants r2
    WHERE r2.cuisines = r.cuisines
      AND r2.restaurant_id <> r.restaurant_id
);

---Restaurants revenue Greater than 10000

SELECT restaurant_id,
SUM(total_price) AS total_revenue
FROM Orders
GROUP BY restaurant_id
HAVING total_revenue >10000;

---Users with or without Review Top 10

SELECT name,
rating,
comment
FROM Users
LEFT JOIN Reviews
ON Reviews.user_id = Users.user_id
LIMIT 10;

---Price More Than Avg 

SELECT
    o.order_id,
    o.user_id,
    o.total_price
FROM Orders o
WHERE o.total_price >
(
    SELECT AVG(o2.total_price)
    FROM Orders o2
    WHERE o2.user_id = o.user_id
);


