# Inner Joins, Full/Left/Right Outer Joins

# Queremos joinear estas 2 tables juntas
SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

# Hagamoslo dentro de employee_demographics
select * 
from parks_and_recreation.employee_demographics
Inner Join parks_and_recreation.employee_salary		# Inner Join es una interseccion entre las tables
	On employee_demographics.employee_id = employee_salary.employee_id;
# Pero tenemos valores que no aparecen, pues usamos inner Join

# No existe mas Full Outer Join. Como es lo mismo que agarrar la union conjunta, osea que la interseccion se repite 2 veces,
# Agarramos el left de uno y el right del otro, que es equivalente. Y luego unimos con Union
select * 
from parks_and_recreation.employee_demographics 
left join parks_and_recreation.employee_salary
on employee_demographics.employee_id = employee_salary.employee_id
UNION 
select * 
from parks_and_recreation.employee_salary
right join parks_and_recreation.employee_demographics
on employee_demographics.employee_id = employee_salary.employee_id;
# Pero hay cosas sin matchear, asi que hay informacion que se nulifica

# Veamos el Left outer join
select * 
from parks_and_recreation.employee_demographics
left outer Join parks_and_recreation.employee_salary		
	On employee_demographics.employee_id = employee_salary.employee_id;
    
# Sigue habiendo errores de match

# En el right pasara lo mismo
select * 
from parks_and_recreation.employee_demographics
right outer Join parks_and_recreation.employee_salary		
	On employee_demographics.employee_id = employee_salary.employee_id;
    

# Todos nos funcionan para el orto, veamos como solucionarlo
select employee_id, first_name, last_name, occupation, salary
from parks_and_recreation.employee_demographics
left outer Join parks_and_recreation.employee_salary		
	On employee_demographics.employee_id = employee_salary.employee_id;
# Ni corre, pero es porque hay nomrbes que se repiten en las dos tablas, por ejemplo employee id

# Llamemos correctamente a nuestros valores
select parks_and_recreation.employee_demographics.employee_id,
parks_and_recreation.employee_demographics.first_name, 
parks_and_recreation.employee_demographics.last_name
from parks_and_recreation.employee_demographics
Right Outer Join parks_and_recreation.employee_salary	
	On employee_demographics.employee_id = employee_salary.employee_id;
# Sigue como el tuje, vemos que siguen habiendo nulls


# El correcto es:
select parks_and_recreation.employee_demographics.employee_id,
parks_and_recreation.employee_demographics.first_name, 
parks_and_recreation.employee_demographics.last_name,
parks_and_recreation.employee_salary.salary
from parks_and_recreation.employee_demographics
inner Join parks_and_recreation.employee_salary	
	On employee_demographics.employee_id = employee_salary.employee_id;
    

# Calculemos el avg salary de un city planner
select occupation, avg(salary)
from parks_and_recreation.employee_salary 
inner Join parks_and_recreation.employee_demographics
	On employee_salary.employee_id = employee_demographics.employee_id 
where occupation = "city planner"
group by occupation
;
    
 