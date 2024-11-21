WITH dates AS (
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day') AS visits
)
SELECT visits::date AS missing_date
FROM dates
LEFT JOIN
(SELECT *
FROM person_visits
WHERE person_id = '1' OR person_id = '2' 
AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') ON visit_date = visits
WHERE person_id IS NULL
ORDER BY missing_date;