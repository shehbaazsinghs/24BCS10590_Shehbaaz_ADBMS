CREATE TABLE salary_hike (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10, 2)
);

INSERT INTO salary_hike (name, salary)
VALUES
    ('Aman', 40000),
    ('Rahul', 50000),
    ('Simran', 60000);

CREATE OR REPLACE FUNCTION check_salary_hike()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.salary > OLD.salary * 1.15 THEN
        RAISE EXCEPTION
            'Salary increase cannot exceed 15%% of the old salary.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER salary_hike_trigger
BEFORE UPDATE OF salary ON salary_hike
FOR EACH ROW
EXECUTE FUNCTION check_salary_hike();

UPDATE salary_hike
SET salary = 44000
WHERE id = 1;

UPDATE salary_hike
SET salary = 60000
WHERE id = 2;

SELECT * FROM salary_hike;