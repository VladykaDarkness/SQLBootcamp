INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
SELECT MAX(id) + 1,
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT pizzeria_id
    FROM menu
    WHERE price < 800 AND id != (SELECT id FROM pizzeria WHERE name = 'Papa Johns')
    LIMIT 1),
    DATE '2022-01-08'
FROM person_visits;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;