SELECT name
FROM person
WHERE id IN
    (SELECT person_id
    FROM person_order
    WHERE menu_id IN
        (SELECT id FROM menu
        WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'cheese pizza')
    GROUP BY person_id
    HAVING COUNT(menu_id) = 2)
ORDER BY name;