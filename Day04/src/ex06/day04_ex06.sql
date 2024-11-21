CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    SELECT name AS pizzeria_name
    FROM pizzeria
    WHERE id IN
        (SELECT pizzeria_id
        FROM person_visits
        WHERE visit_date = '2022-01-08'
            AND person_id = (SELECT id FROM person WHERE name = 'Dmitriy')
            AND pizzeria_id IN (SELECT pizzeria_id FROM menu WHERE price < 800));