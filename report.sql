-- =====================================
-- REPORTE SQL - CHALLENGER SISTEMA VENTAS
-- =====================================

-- Querys desde la 1 hasta la 6 hechas por Sabrina Jeria
--1-Mostrar todos los clientes registrados

select * from clientes;

--2-Mostrar todos los productos disponibles

select * from productos;

--3-mostra todas las ventas realizadas

select * from ventas;

--4-mostrar solo nombre y email de cliente

select nombre, email 
from clientes;

--5-mostra solo nombre y precio del producto

select nombre, precio 
from productos;

--6-productos con precio mayor a 50000

select * from productos
where precio >50000;

-- Querys desde la 7 hasta la 11 hechas por
-- 7. Ventas realizadas el 2026-04-02

SELECT * 
FROM productos 
WHERE fecha = '2026-04-02';

-- 8. Productos ordenados de mayor a menor precio

SELECT * 
FROM productos 
ORDER BY precio DESC;

-- 9. Clientes ordenados por nombre

SELECT * 
FROM clientes 
ORDER BY nombre ASC;

-- 10. Detalles de venta con cantidad >= 2

SELECT *
FROM detalle_venta
WHERE cantidad >= 2;

-- 11. Total de clientes

SELECT COUNT(*) AS total_clientes
FROM clientes;

-- 12. Total de productos


-- 13. Total de ventas


-- 14. Precio promedio de productos


-- 15. Suma total de precios de productos


-- 16. Mostrar venta + nombre del cliente + fecha


-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad


-- 18. Mostrar nombre del cliente + id de venta + fecha


-- 19. Mostrar nombre del producto + cantidad vendida + id de venta


-- 20. Mostrar cuántas ventas ha realizado cada cliente


-- 21. Mostrar solo los clientes con más de una venta


-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta

SELECT p.nombre, COUNT(dv.id_producto) AS veces_vendido
FROM productos p
JOIN detalle_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.nombre; 

-- 23. Mostrar solo los productos que aparecen más de una vez

SELECT p.nombre, COUNT(dv.id_producto) AS veces_vendido
FROM productos p
JOIN detalle_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.nombre
HAVING COUNT(dv.id_producto) > 1; 


-- 24. Mostrar las ventas que tienen más de un producto asociado

SELECT id_venta, COUNT(id_producto) AS total_productos
FROM detalle_venta
GROUP BY id_venta
HAVING COUNT(id_producto) > 1; 

-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2

SELECT c.nombre, SUM(dv.cantidad) AS total_unidades
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY c.nombre
HAVING SUM(dv.cantidad) > 2; 


-- 26. Consulta trampa que no devuelva resultados
-- Explicar por qué el resultado vacío es correcto

SELECT * FROM productos
WHERE precio > 10000000;

-- Explicación:
-- No existen productos con precio mayor a 10.000.000 en la base de datos,
-- por lo tanto, el resultado vacío es correcto. 

