-- A.	Escriba la consulta en SQL que devuelva el nombre del proyecto y sus productos correspondientes del proyecto premia cuyo código es 1

SELECT B.DESCRIPCION AS 'NOMBRE_PROYECTO',
C.DESCRIPCION AS 'NOMBRE_PRODUCTO'
FROM PRODUCTO_PROYECTO A
INNER JOIN PROYECTO B ON A.PROYECTO = B.PROYECTO
INNER JOIN PRODUCTO C ON A.PRODUCTO = C.PRODUCTO
WHERE A.PROYECTO = '1'

-- B.	Escriba una consulta SQL que devuelva los distintos mensajes que hay, indicando a qué proyecto y producto pertenecen.

SELECT 
D.NOMBRE, 
D.REMITENTE,
D.ASUNTO, 
E.NOMBRE,
B.NOMBRE AS 'PROYECTO', 
C.DESCRIPCION AS 'PRODUCTO' 
FROM MENSAJE A
INNER JOIN PROYECTO B ON A.PROYECTO = B.PROYECTO
INNER JOIN PRODUCTO C ON A.PRODUCTO = C.PRODUCTO
INNER JOIN FORMATO_MENSAJE D ON A.COD_FORMATO = D.COD_FORMATO
INNER JOIN TIPO E ON D.COD_TIPO = E.COD_TIPO

-- C.	Escriba una consulta SQL que devuelva los distintos mensajes que hay, indicando a qué proyecto y producto pertenecen. 
--Pero si el mensaje está en todos los productos de un proyecto, en lugar de mostrar cada producto, debe mostrar el nombre del proyecto y un solo producto que diga “TODOS”.

SELECT
D.NOMBRE AS 'PROYECTO',
CASE
    WHEN COUNT(DISTINCT C.PRODUCTO) = COUNT(DISTINCT A.PRODUCTO) THEN 'TODOS'
    ELSE C.DESCRIPCION END AS 'PRODUCTO',
E.NOMBRE AS 'MENSAJE'
FROM MENSAJE A
INNER JOIN FORMATO_MENSAJE B ON B.COD_FORMATO = A.COD_FORMATO
INNER JOIN PRODUCTO C ON C.PRODUCTO = A.PRODUCTO
INNER JOIN PROYECTO D ON B.PROYECTO = A.PROYECTO
INNER JOIN TIPO E ON E.COD_TIPO = B.COD_TPO
GROUP BY D.NOMBRE, E.NOMBRE 