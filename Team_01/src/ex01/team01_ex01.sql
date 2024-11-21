insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');


CREATE OR REPLACE FUNCTION fnc_rate_to_usd(IN fid BIGINT, IN fupdated timestamp without time zone)
RETURNS NUMERIC AS $$
DECLARE 
    frate_to_usd NUMERIC;
BEGIN
    SELECT 
        CASE 
            WHEN (SELECT MAX(updated) FROM currency c WHERE updated < fupdated AND c.id = fid) IS NOT NULL
                THEN (SELECT rate_to_usd 
                      FROM currency c
                      WHERE c.id = fid AND updated = 
                        (SELECT MAX(updated) FROM currency c WHERE updated <= fupdated AND c.id = fid))
                        
            ELSE  (SELECT rate_to_usd 
                   FROM currency c
                   WHERE c.id = fid AND updated = 
                        (SELECT MIN(updated) FROM currency c WHERE updated > fupdated AND c.id = fid))
        END
        INTO frate_to_usd;
    RETURN frate_to_usd;
END;
$$ LANGUAGE plpgsql;


WITH balance_cte AS (
    SELECT u.*, b.*
    FROM "user" u
    RIGHT JOIN balance b ON b.user_id = u.id
)

SELECT DISTINCT COALESCE(cte.name, 'not defined') AS name,
    COALESCE(cte.lastname, 'not defined') AS lastname,
    c.name AS currency_name, cte.money * c.rate_to_usd AS currency_in_usd
FROM balance_cte cte
JOIN (SELECT id, name, rate_to_usd FROM currency) c ON c.id = cte.currency_id 
    AND rate_to_usd = fnc_rate_to_usd(cte.currency_id, cte.updated)
ORDER BY 1 DESC, 2, 3;

-- THE SECOND VARIANT OF FUNCTION

-- CREATE OR REPLACE FUNCTION fnc_rate_to_usd(IN fid BIGINT, IN fupdated timestamp without time zone)
-- RETURNS NUMERIC AS $$
-- DECLARE
--     frate_to_usd NUMERIC;
-- BEGIN
--     SELECT c.rate_to_usd INTO frate_to_usd
--     FROM (SELECT *, ABS(fupdated::date - updated::date) AS diff,
--             MIN(ABS(fupdated::date - updated::date)) 
--             OVER (PARTITION BY id) AS min_diff
--         FROM currency) c
--     WHERE diff = min_diff AND c.id = fid;
--     RETURN frate_to_usd;
-- END;
-- $$ LANGUAGE plpgsql;