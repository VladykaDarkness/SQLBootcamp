COMMENT ON TABLE person_discounts IS 'This table contains discounts for each visitors in different pizzerias. It helps to track discounts for the customers.';
COMMENT ON COLUMN person_discounts.id IS 'This column contains a unique ID for each record.';
COMMENT ON COLUMN person_discounts.person_id IS 'This column contains the IDs of persons who visits pizzerias.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'This column contains the IDs of pizzerias which was visited by persons.';
COMMENT ON COLUMN person_discounts.discount IS 'This column contains discounts for ea5ch visitor in certain pizzeria.';