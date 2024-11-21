CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS SETOF person AS $$
    SELECT id, name, age, gender, address FROM person WHERE gender = 'female';
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS SETOF person AS $$
    SELECT id, name, age, gender, address FROM person WHERE gender = 'male';
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons_female();
SELECT * FROM fnc_persons_male();

-- SELECT fnc_persons_female();
-- SELECT fnc_persons_male();
-- SELECT (fnc_persons_female()).name;
-- SELECT name(fnc_persons_female());