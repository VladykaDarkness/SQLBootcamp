SELECT name, rating
FROM pizzeria pi
LEFT JOIN person_visits pv ON pv.pizzeria_id = pi.id
WHERE visit_date IS NULL;