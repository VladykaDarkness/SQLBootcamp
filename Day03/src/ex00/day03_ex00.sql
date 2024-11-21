SELECT m.pizza_name, m.price, pi.name AS pizzeria_name, pv.visit_date
FROM person_visits pv
JOIN pizzeria pi ON pi.id = pv.pizzeria_id
JOIN menu m ON m.pizzeria_id = pi.id AND price BETWEEN 800 AND 1000
WHERE pv.person_id =
    (SELECT id FROM person WHERE name = 'Kate') 
ORDER BY 1, 2, 3;