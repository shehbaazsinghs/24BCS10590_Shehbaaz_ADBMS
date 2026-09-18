
CREATE TABLE employeess (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC(10,2)
);
INSERT INTO employeess (emp_id, emp_name, salary)
VALUES
(201, 'Rahul', 30000),
(202, 'Aman', 40000),
(203, 'Priya', 35000);

SELECT * FROM employeess;
CREATE OR REPLACE PROCEDURE update_salary_proc2(
    IN p_empid INT,
    OUT status VARCHAR(20),
    INOUT p_salary NUMERIC
)
AS $$
DECLARE
    current_sal NUMERIC(10,2);
BEGIN
    SELECT salary
    INTO current_sal
    FROM employees
    WHERE emp_id = p_empid;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Employee Not Found';
    END IF;

    p_salary := current_sal + p_salary;

    UPDATE employeess
    SET salary = p_salary
    WHERE emp_id = p_empid;
	
    status := 'Success';
END;
$$ LANGUAGE plpgsql;

CALL update_salary_proc2(201,NULL,5200);