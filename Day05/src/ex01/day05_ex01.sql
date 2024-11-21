SET enable_seqscan = off;
-- отключает последовательное чтение или sequential scanning — 
-- последовательное сканирование данных,
-- что вынуждает PostgreSQL использовать индекс, если он доступен
EXPLAIN ANALYZE
SELECT m.pizza_name, pi.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria pi ON pi.id = m.pizzeria_id;

-- SET enable_seqscan = on;