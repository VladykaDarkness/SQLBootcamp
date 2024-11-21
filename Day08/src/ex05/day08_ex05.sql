-- session 1
BEGIN;
-- session 2
BEGIN;
-- session 1
SELECT SUM(rating) FROM pizzeria;
-- session 2
INSERT INTO pizzeria(id, name, rating)
VALUES (10, 'Kazan Pizza', 5);
COMMIT;
-- session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
-- session 2
SELECT SUM(rating) FROM pizzeria;

SELECT DISTINCT pz.name
FROM pizzeria pz
JOIN menu m ON m.pizzeria_id = pz.id
WHERE EXISTS(
    SELECT 10
    FROM person_order po 
    WHERE po.menu_id = m.id
);

SELECT DISTINCT pz.name, m.pizza_name
FROM pizzeria pz
JOIN menu m ON m.pizzeria_id = pz.id
WHERE NOT EXISTS(
    SELECT 1
    FROM person_order po 
    WHERE po.menu_id = m.id
);