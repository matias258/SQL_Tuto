# Window Function: Perform calculations based on data in different groups of rows

#
/* Formato de un windows function:
window_function (expression)
Over(
[Partition by partition_clause]
[Order by order_clause]				# Estas 2 son opcionales
)
 -------------------------------------------------------------------------*/
 
# Generemos por ejemplo un dataset:
Create Table orders(
order_id INT,
order_date DATE,
order_total INT
);

insert into orders( order_id, order_date, order_total) VALUES
(1, "2020-04-03", 100),
(2, "2020-04-03", 250),
(3, "2020-04-04", 80),
(4, "2020-04-05", 10);

# Corremos un select para guardar la data en la table
select 
order_id,
order_date,
order_total,
sum(order_total) over (		# Agregamos la suma de los order totals por order_id ascendiente
order by order_id asc
) as running_total			# Lo ponemos en la nueva columna running_total
from orders
order by order_id asc;		# Ordenamos por order_id asc, sino va a estar re desordenado


# Insertemos mas data (no correr mas veces)
Insert into orders(order_id, order_date, order_total) values
(5, "2020-04-03", 120),
(6, "2020-04-04", 90),
(7, "2020-04-04", 50),
(8, "2020-04-04", 15);

# Ahora queremos que el running_total se resetee cada dia
select 
order_id,
order_date,
order_total,
sum(order_total) over (		# Agregamos la suma de los order totals por order_id ascendiente
partition by order_date 	# Particionamos por cada dia distinto
order by order_id asc
) as running_total			# Lo ponemos en la nueva columna running_total
from orders
order by order_date asc;		# Ordenamos por order_date asc, sino no podremos ver cuando se resetea running_total

# Tmb se puede usar count, avg, max, min, rank, etc..

