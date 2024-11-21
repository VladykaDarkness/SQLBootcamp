SELECT name, SUM(count) AS total_count
FROM
    ((SELECT pz.name AS name, COUNT(*) AS count
    FROM person_order po
    JOIN menu m ON m.id =  po.menu_id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    GROUP BY pz.name)
    UNION ALL
    (SELECT pz.name, COUNT(*)
    FROM person_visits pv
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    GROUP BY pz.name))
GROUP BY name
ORDER BY 2 DESC, 1;