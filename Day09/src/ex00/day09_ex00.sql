CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_DATE NOT NULL,
    type_ivent CHAR(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR, 
    age INT,
    gender VARCHAR,
    address VARCHAR,
    CONSTRAINT ch_type_event CHECK (type_ivent IN ('I', 'D', 'U'))
);


CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit(created, type_ivent, row_id, name, age, gender, address) 
    VALUES (NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();


INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');


-- SELECT * FROM person_audit;
-- SELECT * FROM person;
-- DROP TABLE IF EXISTS person_audit;
-- DROP TRIGGER trg_person_insert_audit ON person;
-- DELETE FROM person WHERE id = 10;