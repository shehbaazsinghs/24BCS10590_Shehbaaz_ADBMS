CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    per_hour_salary NUMERIC(10,2),
    working_hours INT,
    payable_amount NUMERIC(10,2)
);

CREATE OR REPLACE FUNCTION calculate_payable()
RETURNS TRIGGER AS $$
BEGIN
    NEW.payable_amount := NEW.per_hour_salary * NEW.working_hours;

    IF NEW.payable_amount > 25000 THEN
        RAISE EXCEPTION 'Payable amount cannot be greater than 25000';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER payroll_trigger
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION calculate_payable();

CREATE OR REPLACE FUNCTION success_message()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Rows Updated Successfully';
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER statement_trigger
AFTER INSERT OR UPDATE ON employee
FOR EACH STATEMENT
EXECUTE FUNCTION success_message();

INSERT INTO employee
VALUES (1, 'Rahul', 500, 40, NULL);

UPDATE employee
SET per_hour_salary = 600
WHERE emp_id = 1;

INSERT INTO employee
VALUES (2, 'Aman', 700, 40, NULL);

SELECT * FROM employee; v