# WHERE clause

# Busqueda basica de la mina llamada Leslie
select * 
from parks_and_recreation.employee_salary
where first_name = "Leslie";

# Ecuaciones. Los que tienen <= 50 000, bai bai
select * 
from parks_and_recreation.employee_salary
where salary > 50000;

select * 
from parks_and_recreation.employee_demographics
where gender != "Female";

# Date datatype
select * 
from parks_and_recreation.employee_demographics
where birth_date > "1985-01-01";

# Operadores logicos (AND OR NOT)
select * 
from parks_and_recreation.employee_demographics
where birth_date > "1985-01-01" or not gender = "Male";

select * 
from parks_and_recreation.employee_demographics
where (first_name = "Leslie" and age = 44) or age > 55;


# LIKE statement. Patrones especificos: % y __

select * 
from parks_and_recreation.employee_demographics
where first_name like "Jer%"; # El primer nombre comienza con "Jer"

select * 
from parks_and_recreation.employee_demographics
where first_name like "%er%"; # Hay un "er" en alguna parte de algun nombre

select * 
from parks_and_recreation.employee_demographics
where first_name like "a__"; # Tiene que tener un a en el comienzo y luego tiene solo 2 caracteres despues

select * 
from parks_and_recreation.employee_demographics
where first_name like "a___"; # Tiene que tener un a en el comienzo y luego tiene solo 3 caracteres despues

select * 
from parks_and_recreation.employee_demographics
where first_name like "a___%"; # Empieza con a, tiene 3 caracteres, y despues puede tener lo que sea (o nada como el caso de Andy)

select * 
from parks_and_recreation.employee_demographics
where birth_date like "1989%"; # Mira solo el año, y despues no me importa lo que sigue.