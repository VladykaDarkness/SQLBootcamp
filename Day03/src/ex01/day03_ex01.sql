SELECT m.id AS menu_id
FROM menu m
LEFT JOIN person_order po ON po.menu_id = m.id
WHERE order_date IS NULL
ORDER BY menu_id;