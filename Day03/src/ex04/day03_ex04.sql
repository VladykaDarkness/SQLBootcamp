((SELECT DISTINCT pi.name AS pizzeria_name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
WHERE p.gender = 'male')
EXCEPT
(SELECT DISTINCT pi.name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
WHERE p.gender = 'female'))
UNION
((SELECT DISTINCT pi.name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
WHERE p.gender = 'female')
EXCEPT
(SELECT DISTINCT pi.name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
WHERE p.gender = 'male'))
ORDER BY 1;