# Count ------------------------------------------------

# Contar la cantidad de rows en la table
select count(*)
from northwind.orderdetail;

# Cuenta para el productId especifico
select count(*)
from northwind.orderdetail
where productId = 10;

# SUM AVG MAX MIN  ------------------------------------------------

select SUM(quantity)
from northwind.orderdetail
where productId = 10;

select avg(quantity)
from northwind.orderdetail
where productId = 10;

select max(quantity)
from northwind.orderdetail
where productId = 10;

select min(quantity)
from northwind.orderdetail
where productId = 10;

# Basic math en el select
select max(unitPrice) - MIN(unitPrice)
from northwind.orderdetail
where productId = 10;

select avg(unitPrice * quantity)
from northwind.orderdetail
where productId = 10;

