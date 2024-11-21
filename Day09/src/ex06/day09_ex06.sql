CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson VARCHAR DEFAULT 'Dmitriy', 
    IN pprice NUMERIC DEFAULT 500, IN pdate DATE DEFAULT '2022-01-08')
RETURNS table(pizzeria_name VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pz.name --INTO pizzeria_name
    FROM pizzeria pz
    JOIN (SELECT * FROM person_visits WHERE visit_date = pdate) pv ON pv.pizzeria_id = pz.id
    JOIN person p ON p.id = pv.person_id AND p.name = pperson
    JOIN menu m ON m.pizzeria_id = pz.id AND m.price < pprice;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

-- DROP FUNCTION fnc_person_visits_and_eats_on_date;