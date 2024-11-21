CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INT DEFAULT 10)
RETURNS TABLE(fib_num INT) AS $$
DECLARE fib_num INT := 1; 
        fib_num_prev INT := 0;
        fib_num_tmp INT;
BEGIN
    RETURN QUERY SELECT fib_num_prev;
    WHILE fib_num < pstop LOOP
        RETURN QUERY SELECT fib_num;
        fib_num_tmp := fib_num;
        fib_num := fib_num + fib_num_prev;
        fib_num_prev := fib_num_tmp;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();