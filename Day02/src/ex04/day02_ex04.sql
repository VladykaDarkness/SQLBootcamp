SELECT m.pizza_name,
    (SELECT pi.name
    FROM pizzeria pi
    WHERE pi.id = m.pizzeria_id),
    m.price
FROM menu m
WHERE m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza'
ORDER BY 1, 2;