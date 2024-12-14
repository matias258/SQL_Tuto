# https://www.youtube.com/watch?v=rIcB4zMYMas&ab_channel=MavenAnalytics
# 1. Veamos la table
select *
from unique_name_counts;

# 2. Ordenemos por popularidad
select *
from unique_name_counts
order by repetitions desc;

# 3. Agregar una columna de popularidad
select sex, first_name, repetitions, 
row_number() over(order by repetitions desc) as popularity 	# Window function
# Row_number mira cada columna y las enumera, over me pide como enumerarlas
from unique_name_counts
;

# 4. Intentar diferentes funciones para enumerar la data
select sex, first_name, repetitions, 
	row_number() over(order by repetitions desc) as popularity, 	
	rank() over(order by repetitions desc) as popularity_r,			# en rank se iguala el ranking y luego se saltea (ej, 3, 4, 4, 6)
	dense_rank() over(order by repetitions desc) as popularity_dr 	# en dense_rank se iguala el ranking y luego no se saltea (ej, 3, 4, 4, 5)
from unique_name_counts
;
# ver más como first_value, nth_value, lead, lag, etc...

# 5. Intentemos diferentes windows. Queremos separar entre hombres y mujeres
select sex, first_name, repetitions, 
row_number() over(partition by sex order by repetitions desc) as popularity 	# Particionamos por sexo
from unique_name_counts
;


# 6. Cual es el top 3 nombres populares para cada sexo?
select * from 
(select sex, first_name, repetitions, 
row_number() over(partition by sex order by repetitions desc) as popularity 	# Particionamos por sexo
from unique_name_counts) as pop

where popularity <= 3
;
