SELECT 
    (SELECT name
    FROM person 
    WHERE id = person_id) AS NAME,
    (SELECT
    CASE 
        WHEN name = 'Denis' THEN true
        ELSE false
    END AS check_name
    FROM person 
    WHERE id = person_id)
FROM person_order
WHERE menu_id in ('13', '14', '18') AND order_date = '2022-01-07';

/*if (person_name == 'Denis') then return true
    else return false*/
