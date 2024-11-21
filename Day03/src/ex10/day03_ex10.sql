INSERT INTO person_order(id, person_id, menu_id, order_date)
    SELECT MAX(id) + 1,
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        DATE '2022-02-24'
    FROM person_order
    UNION ALL
    SELECT MAX(id) + 2,
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        DATE '2022-02-24'
    FROM person_order
RETURNING *;