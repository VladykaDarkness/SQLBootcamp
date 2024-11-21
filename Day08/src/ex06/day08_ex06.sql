-- session 1
BEGIN;
-- session 2
BEGIN;
-- session 1
SELECT SUM(rating) FROM pizzeria;
-- session 2
INSERT INTO pizzeria(id, name, rating)
VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
-- session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
-- session 2
SELECT SUM(rating) FROM pizzeria;