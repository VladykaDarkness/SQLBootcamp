SELECT DISTINCT p.name
FROM person_order po
JOIN person p ON p.id = po.person_id
ORDER BY 1;

--  SELECT DISTINCT p.name
--  FROM person_order po
--  JOIN menu m ON m.id = po.menu_id
--  JOIN person_visits pv ON pv.visit_date = po.order_date 
     -- AND pv.person_id = po.person_id 
     -- AND pv.pizzeria_id = m.pizzeria_id
--  JOIN person p ON p.id = po.person_id
--  ORDER BY 1;