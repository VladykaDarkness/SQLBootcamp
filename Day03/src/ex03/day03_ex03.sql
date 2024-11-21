WITH what_gender AS (
    SELECT pi.name AS pizzeria_name,
    CASE
        WHEN p.gender = 'male' THEN 1
        ELSE -1
    END AS result
    FROM person_visits pv
    JOIN pizzeria pi ON pi.id = pv.pizzeria_id
    JOIN person p ON p.id = pv.person_id
)
SELECT pizzeria_name
FROM what_gender
GROUP BY pizzeria_name
HAVING SUM(result) != 0
ORDER BY pizzeria_name;