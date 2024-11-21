SELECT p.name, COUNT(*) AS count_of_visits
FROM person p
JOIN person_visits pv ON pv.person_id = p.id
GROUP BY p.name
HAVING COUNT(*) > 3;