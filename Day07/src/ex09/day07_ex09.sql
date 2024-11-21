WITH calculations AS (
    SELECT address, 
        ROUND((MAX(age) - MIN(age) / CAST(MAX(age) AS DECIMAL(4, 2))), 2) AS formula,
        ROUND(AVG(age), 2) AS average
    FROM person
    GROUP BY address
)

SELECT address, formula, average,
    CASE 
        WHEN formula > average THEN TRUE
        ELSE FALSE
    END AS comparison
FROM calculations
ORDER BY 1;