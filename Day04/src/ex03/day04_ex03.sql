SELECT v.generated_date AS missing_date
FROM v_generated_dates v
LEFT JOIN person_visits pv ON pv.visit_date = v.generated_date
GROUP BY v.generated_date, pv.visit_date
HAVING pv.visit_date IS NULL
ORDER BY missing_date;