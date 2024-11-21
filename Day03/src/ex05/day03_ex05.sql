SELECT pi.name AS pizzeria_name
FROM person_visits pv
LEFT OUTER JOIN person_order po ON po.person_id = pv.person_id 
    AND po.order_date = pv.visit_date
INNER JOIN pizzeria pi ON pi.id = pv.pizzeria_id
WHERE pv.person_id =
    (SELECT p.id FROM person p WHERE p.name = 'Andrey')
GROUP BY pizzeria_name, po.order_date
HAVING po.order_date IS NULL
ORDER BY 1;