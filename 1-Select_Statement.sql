-- SELECT -------------------------------------------------------------------------------------------------

select * from example_table;
-- returns the entire table

select first_column, second_column
from example_table;
-- returns specific columns

select *
from example_table
limit 3;
-- returns top three rows

select distinct first_column
from example_table;
-- selects unique values

select first_column, second_column
from example_table
where first_column > 65;
-- or
select first_column, second_column
from example_table
where first_column > 65 and second_column = "John";
-- or
select first_column, birth_date
from example_table
where birth_date between '2000-10-23' and '2010-10-23';
-- returns values that meet condition
-- all operators:
and between or not

select name, height
from example_table
order by name, height;
-- lists in ascending/descending order based on a column

select name, max(height)
from example_table
group by name;
-- groups rows into summary rows by column
-- instead of max, we can use:
min() sum() count()

having count(height) > 1
-- argument added to limit responses by criteria


-- ORDER OF EVALUATION ------------------------------------------------------------------------------------
-- Different commands will be processed in this syntax order:

select sum(height), name, id
from example_table
where id < 5
group by name
having sum(height) > 3
limit 10;


-- CASE WHEN ----------------------------------------------------------------------------------------------

select name, gender
	case gender
		when '0' then 'Male'
		when '1' then 'Female'
	end as gender_new
from example_table;
-- returns new column with "Male" and "Female"

select name, height
	case height
		when height > 180 then 'Tall'
		when height <= 180 and height >= 160 then 'Average'
		when height < 160 then 'Short'
		else 'No Data'
	end as height_new
from example_table;
-- returns new column with "Tall", "Average", and "Short"


-- MATH OPERATIONS ----------------------------------------------------------------------------------------

select height
height/100 as height_meters
from example_table

-- or

select (weight/(power(height/100,2))) as bmi
from example_table;
-- returns calculated column "bmi"

