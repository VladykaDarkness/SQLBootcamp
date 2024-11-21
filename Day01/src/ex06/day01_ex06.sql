SELECT action_date,
(SELECT name FROM person
WHERE person.id = table_3.person_id) AS person_name
FROM
(SELECT order_date AS action_date, person_id
FROM person_order
INTERSECT
SELECT visit_date, person_id
FROM person_visits) AS table_3
ORDER BY action_date, person_name DESC;