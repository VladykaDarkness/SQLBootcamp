INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
    (SELECT MAX(id) + 1,
        (SELECT id FROM person WHERE name = 'Denis'), 
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        DATE '2022-02-24'
    FROM person_visits)
    UNION ALL
    (SELECT MAX(id) + 2,
        (SELECT id FROM person WHERE name = 'Irina'), 
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        DATE '2022-02-24'
    FROM person_visits)
RETURNING *;