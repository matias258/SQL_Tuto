# Select basico que selecciona toda la columna
select * 
from parks_and_recreation.employee_demographics;

# Selecciona cosas especificas
select first_name, last_name, birth_date, age
from parks_and_recreation.employee_demographics;

# Creamos nueva columna con la edad + 10.
# PEMDAS rule . Orden en el que corren las ecuaciones
select first_name, 
last_name, 
birth_date, 
age,
age + 10,
(age + 10) * 10
from parks_and_recreation.employee_demographics;


# Veamos DISTINCT

select gender
from parks_and_recreation.employee_demographics;
# Nos devuelve un monton de Male y Female

# Distinct sirve para printear los uniques nomas
select distinct gender
from parks_and_recreation.employee_demographics;

# Ahora bien, si ponemos first_name antes, los generos se convertiran en unique
# Y obtendremos la lista entera de gender
select distinct first_name,gender 
from parks_and_recreation.employee_demographics;

