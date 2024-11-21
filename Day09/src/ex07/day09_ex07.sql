CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
    SELECT MIN(arr[i]) 
    FROM generate_subscripts(arr, 1) g(i); -- набор индексов для arr, g(i) — это псевдоним для результата generate_subscripts
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
SELECT func_minimum(1, 2, 5.5, -5,5, -6, 3);