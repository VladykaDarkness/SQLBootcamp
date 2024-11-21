INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
    ROW_NUMBER() OVER(ORDER BY po.person_id) AS id,
    po.person_id,
    pz.id,
    CASE COUNT(pizzeria_id)
        WHEN 1 THEN 10.5
        WHEN 2 THEN 22
        ELSE 30
    END 
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY po.person_id, pz.id;