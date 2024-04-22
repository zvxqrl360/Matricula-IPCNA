<%-- 
    Document   : Matricula
    Created on : 21 abr. 2024, 20:48:00
    Author     : FRANC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Resultados de matrícula</title>
    <style>
        body {
            background-color: #13293d; /* Azul oscuro */
            color: white; /* Color de texto blanco */
            font-family: Arial, sans-serif; /* Fuente */
            text-align: center; /* Centrar el contenido */
        }

        table {
            border-collapse: collapse; /* Colapsar bordes de la tabla */
            width: 50%; /* Ancho de la tabla */
            margin: 50px auto; /* Centrar la tabla horizontalmente */
            background-color: #13293d; /* Azul oscuro */
        }

        table, th, td {
            border: 2px solid #ff3d00; /* Borde de la tabla y celdas (rojo) */
        }

        th, td {
            padding: 10px; /* Espaciado interno de las celdas */
            text-align: left; /* Alineación del texto a la izquierda */
        }

        a {
            color: white; /* Color de texto blanco para enlaces */
            text-decoration: none; /* Sin subrayado para enlaces */
        }

        a:hover {
            color: #ff5722; /* Cambio de color al pasar por encima (naranja) */
        }
    </style>
</head>
<body>
    <h1>RESUMEN DE MATRICULA</h1>
<% 
    int sede;
    String sedes = "";
    double precio = 0;
    double descuento = 0;
    double total = 0;

    sede = Integer.parseInt(request.getParameter("combo2"));
    switch (sede) {
        case 1:
            sedes="Lima Norte";
            precio = 160;
            break;
        case 2:
            sedes="San Miguel";
            precio = 160;
            break;
        case 3:
            sedes="Satélite";
            precio = 160;
            break;
    }
    String horarioSeleccionado = request.getParameter("combo1");
    String nivel = request.getParameter("rbtnivel");
    if (nivel.equalsIgnoreCase("Basico")) {
        precio = 160;
    } else if (nivel.equalsIgnoreCase("Intermedio")) {
        precio = 180;
    } else if (nivel.equalsIgnoreCase("Avanzado")) {
        precio = 220;
    }

    if (request.getParameter("chkalum") != null) {
        descuento += precio / 2; // Aplicar descuento de alumno nuevo
    }else{
    descuento=0;
    }

    total = precio - descuento;
%>

<center>
    <table border="1">
        <tr>
            <td>Nivel elegido</td>
            <td><%=nivel %></td>
        </tr>
        <tr>
            <td>Sede elegida</td>
            <td><%=sedes %></td>
        </tr>
        <tr>
            <td>Descuento por ser alumno nuevo</td>
            <td><%=descuento %></td>
        </tr>
        <tr>
            <td>Horario elegido</td>
            <td><%=horarioSeleccionado %></td>
        </tr>
        <tr>
            <td>Total</td>
            <td><%=total %></td>
        </tr>
    </table>
    <a href="index.html">Regresar</a>
</center>
</body>
</html>