SELECT name
FROM person
WHERE id IN 
    (SELECT person_id
    FROM person_order
    WHERE menu_id IN
        (SELECT id FROM menu WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza'))) 
        AND gender = 'male' AND address IN ('Moscow', 'Samara')
ORDER BY name DESC;