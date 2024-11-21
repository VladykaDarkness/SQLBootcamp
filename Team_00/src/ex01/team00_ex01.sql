WITH RECURSIVE rec_query AS(
  SELECT point1, point2, cost, point2 AS last_point, 1 AS count, point1 AS path
  FROM cities
  WHERE point1 = 'a'

  UNION ALL

  SELECT r.point1, r.point2, r.cost + c2.cost, c2.point2, r.count + 1, CONCAT(r.path, ',', c2.point1)
  FROM rec_query r
  JOIN cities c2 ON c2.point1 = r.last_point
  WHERE count < 5 AND path NOT LIKE CONCAT('%', c2.point1, '%')
)

SELECT cost AS total_cost, CONCAT('{', path, ',', last_point, '}') AS tour 
FROM rec_query
WHERE last_point = 'a' AND count = 4 AND (cost = (SELECT MIN(cost) FROM rec_query WHERE count = 4 AND last_point = 'a') OR
    cost = (SELECT MAX(cost) FROM rec_query WHERE count = 4 AND last_point = 'a'))
ORDER BY total_cost, tour;