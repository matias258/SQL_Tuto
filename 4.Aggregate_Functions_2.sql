select *
from northwind.customer;

# Group By y Order by
select country, count(*)
from northwind.customer
group by country
order by count(*) desc; 	# Ordena descendiendo por cantidad de count


# Agregamos city
SELECT 
    country, city, COUNT(*)
FROM
    northwind.customer
GROUP BY country , city
ORDER BY COUNT(*) DESC; 	# Ordena descendiendo por cantidad de count

# Otra manera del group by es por 1, 2
SELECT 
    country, city, COUNT(*)
FROM
    northwind.customer
GROUP BY 1, 2
ORDER BY COUNT(*) DESC; 	# Ordena descendiendo por cantidad de count


# Apliquemos filters
SELECT 
    country, COUNT(*)
FROM
    northwind.customer
GROUP BY 1 , 2
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC; 	# Ordena descendiendo por cantidad de count


