SELECT DISTINCT pv.visit_date AS missing_date
FROM person p
CROSS JOIN person_visits pv
LEFT JOIN person_visits pv2 ON pv2.visit_date = pv.visit_date AND pv2.person_id = p.id
WHERE p.id = '1' OR p.id = '2'
GROUP BY missing_date
HAVING COUNT(pv2.person_id) = 0
ORDER BY missing_date;

/*SELECT dates::date AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates
LEFT JOIN
(SELECT *
FROM person_visits
WHERE person_id = '1' OR person_id = '2' 
AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') ON visit_date = dates
WHERE person_id IS NULL
ORDER BY missing_date;*/

/*WITH dates AS (
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day') AS visit_date
),
target_visitors AS (
    SELECT 1 AS person_id
    UNION ALL
    SELECT 2
)
SELECT 
    d.visit_date::date AS missing_date
FROM dates d
CROSS JOIN target_visitors tv
LEFT JOIN person_visits pv ON d.visit_date = pv.visit_date AND tv.person_id = pv.person_id
GROUP BY d.visit_date
HAVING COUNT(pv.person_id) = 0
ORDER BY missing_date;*/