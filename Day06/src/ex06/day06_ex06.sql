CREATE SEQUENCE IF NOT EXISTS seq_person_discounts
AS BIGINT
START WITH 1
INCREMENT BY 1;

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');

SELECT SETVAL('seq_person_discounts', (SELECT COUNT(*) + 1 FROM person_discounts));

-- МОИ ЗАМЕТКИ
-- INSERT INTO person_discounts (person_id, pizzeria_id, discount)
-- VALUES (2, 4, 10.5);

-- DROP SEQUENCE seq_person_discounts;

-- DELETE FROM person_discounts
-- WHERE id between 16 and 22;

-- SELECT last_value FROM seq_person_discounts;
-- SELECT NEXTVAL('seq_person_discounts');

-- select *
-- from pg_sequences
-- where sequencename = 'seq_person_discounts';

-- DO $$
-- DECLARE 
--     row_number INT;
-- BEGIN
--     SELECT COUNT(*) INTO row_number FROM person_discounts;
--     PERFORM SETVAL('seq_person_discounts', row_number);
-- END $$;