SELECT m.pizza_name, m.price, pi.name AS pizzeria_name
FROM menu m
LEFT JOIN person_order po ON po.menu_id = m.id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
WHERE order_date IS NULL
ORDER BY 1, 2;