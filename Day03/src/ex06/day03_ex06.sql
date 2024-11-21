SELECT m1.pizza_name,
    (SELECT pi.name AS pizzeria_name_1 FROM pizzeria pi WHERE pi.id = m1.pizzeria_id),
    (SELECT pi.name AS pizzeria_name_2 FROM pizzeria pi WHERE pi.id = m2.pizzeria_id),
    m1.price
FROM menu m1 
JOIN menu m2 ON m2.pizza_name = m1.pizza_name AND m2.price = m1.price AND m2.pizzeria_id < m1.pizzeria_id
ORDER BY 1;