WITH volume_cte AS (
    SELECT COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type,
    SUM(b.money) AS volume,
    COALESCE(c.name, 'not defined') AS currency_name,
    COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd
    FROM "user" u
    RIGHT JOIN balance b ON b.user_id = u.id
    LEFT JOIN (SELECT *
        FROM
                (SELECT *, ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) AS last
                FROM currency)
        WHERE last = 1) AS c ON c.id = b.currency_id
    GROUP BY u.name, lastname, b.type, c.name, c.rate_to_usd
)

SELECT *, 
    volume * last_rate_to_usd AS total_volum_in_usd
FROM volume_cte
ORDER BY 1 DESC, 2, 3;    