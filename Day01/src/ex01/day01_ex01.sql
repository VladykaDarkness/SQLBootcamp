SELECT words AS object_name
FROM
(SELECT * FROM
    (SELECT name AS words, 1 AS num
    FROM person
    UNION ALL
    SELECT pizza_name AS words, 2
    FROM menu) 
ORDER BY num, words);