-- CREATE TABLE cities (
-- 	id bigint primary key,
-- 	point1 varchar not null,
-- 	point2 varchar not null,
-- 	cost integer not null
-- );

-- insert into cities values(1, 'a', 'b', 10);
-- insert into cities values(2, 'a', 'd', 20);
-- insert into cities values(3, 'a', 'c', 15);
-- insert into cities values(4, 'b', 'a', 10);
-- insert into cities values(5, 'b', 'd', 25);
-- insert into cities values(6, 'b', 'c', 35);
-- insert into cities values(7, 'c', 'a', 15);
-- insert into cities values(8, 'c', 'b', 35);
-- insert into cities values(9, 'c', 'd', 30);
-- insert into cities values(10, 'd', 'a', 20);
-- insert into cities values(11, 'd', 'b', 25);
-- insert into cities values(12, 'd', 'c', 30);

-- SELECT * FROM cities;

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
),
	min_cost AS (
	SELECT * FROM all_cities
	WHERE (SELECT MIN(total_cost) FROM all_cities) = total_cost
	)
	
SELECT * FROM min_cost;
