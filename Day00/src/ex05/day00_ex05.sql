SELECT 
    (SELECT name
    FROM person p 
    WHERE p.id = o.person_id) AS NAME
FROM person_order o
WHERE menu_id in ('13', '14', '18') AND order_date = '2022-01-07';