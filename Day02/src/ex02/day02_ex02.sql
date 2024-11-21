SELECT 
COALESCE(p.name, '-') AS person_name, 
pv.visit_date, 
COALESCE(pi.name, '-') AS pizzeria_name
FROM person p
FULL JOIN 
(SELECT * FROM person_visits 
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
ON p.id = pv.person_id
FULL JOIN pizzeria pi ON pi.id = pv.pizzeria_id
ORDER BY 1, 2, 3;