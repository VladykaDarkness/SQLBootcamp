SELECT name
FROM pizzeria
WHERE id NOT IN
(SELECT pizzeria_id
FROM person_visits);

SELECT name
FROM pizzeria pi
WHERE
    NOT EXISTS (
        SELECT 1
        FROM person_visits pv
        WHERE pv.pizzeria_id = pi.id
    );