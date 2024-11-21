WITH all_cities AS(
  SELECT c1.cost + c2.cost + c3.cost + c4.cost AS total_cost,
  '{' || c1.point1 || ', ' || c2.point1 || ', ' || c3.point1 || ', ' || c4.point1 || ', ' || c4.point2 || '}' AS tour
  FROM cities c1
  JOIN cities c2 ON c1.point2 = c2.point1
  JOIN cities c3 ON c2.point2 = c3.point1
  JOIN cities c4 ON c3.point2 = c4.point1
  WHERE c1.point1 = 'a'
    AND c1.point1 <> c2.point2 AND c2.point1 <> c3.point2 
    AND c3.point1 <> c4.point2 AND c4.point2 = c1.point1
  ORDER BY total_cost, tour
)

SELECT * FROM all_cities
WHERE total_cost =
(SELECT MIN(total_cost) FROM all_cities) OR
total_cost =
(SELECT MAX(total_cost) FROM all_cities);
