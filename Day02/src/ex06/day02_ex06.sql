SELECT m.pizza_name,
    (SELECT pi.name
    FROM pizzeria pi
    WHERE pi.id = m.pizzeria_id) AS pizzeria_name
FROM menu m
WHERE m.id IN 
(SELECT menu_id FROM person_order po WHERE po.person_id IN
(SELECT p.id FROM person p WHERE p.name IN ('Anna', 'Denis')))
ORDER BY m.pizza_name, pizzeria_name;