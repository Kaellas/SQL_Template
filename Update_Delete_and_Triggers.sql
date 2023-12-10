-- DEFAULT VALUES -----------------------------------------------------------------------------------------

INSERT INTO employees (employee_id, first_name, last_name)
VALUES (default, 'John', 'Doe');


-- UPDATE ROW ---------------------------------------------------------------------------------------------

-- Repeat the same value across all rows
UPDATE students
SET last_name = 'Johnson';

-- Replace the value depending on a condition
UPDATE students
SET first_name = 'Emily', last_name = 'Smith'
WHERE student_id = 123;

UPDATE employees
SET salary = salary * 1.10
WHERE department_id <= 101;

-- Take values from another table
UPDATE employees AS e
SET salary = eu.new_salary
FROM employee_updates AS eu
WHERE e.employee_id = eu.employee_id;


-- DELETE -------------------------------------------------------------------------------------------------

DELETE FROM employees
WHERE salary < 30000;


-- TRIGGERS -----------------------------------------------------------------------------------------------

-- Create function to be used in trigger
create or replace function log_department_changes()  
  returns trigger   
  language PLPGSQL  
  as  
$$  
begin  
    if new.department_name <> old.department_name then  
    	 -- Update ineffective date and current indicator on old row
         update bi_four.department_hist    
		 set ineffective_date = now(),
		 	 current_indicator = '0'
         where department_hist_sk = (select max(department_hist_sk) 
		                             from bi_four.department_hist  dh 
                                	 where (dh.department_code_durable = old.department_code));
    	 -- Insert new values in new row
    	 insert into bi_four.department_hist(department_hist_sk, department_code_durable,
         							 department_name, department_location, 
         							 effective_date, ineffective_date, current_indicator)  
         values(default, old.department_code, new.department_name, 
                old.department_location, now(), '3022-10-30 23:19:23', '1');           
    end if;  
return new;  
end;  
$$ 

-- Create trigger
create or replace trigger department_name_changes 
 before update  
 on bi_four.department  
 for each row  
 execute procedure log_department_changes();  

-- Make update to name of a department
update bi_four.department    
set department_name = 'Clinical Medicine',
	last_update = default
where department_code = 4; 

update bi_four.department    
set department_name = 'Law and Justice',
	last_update = default
where department_code = 3;


