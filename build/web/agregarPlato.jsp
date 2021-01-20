<%-- 
    Document   : agregarPlato
    Created on : 20/01/2021, 9:20:28 a. m.
    Author     : Fabián Machuca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file = "conexion.jsp" %> <%-- incluye un archivo --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso</title>
    </head>
    <body>
        <%
            //out.print(request.getParameter("disponibilidad"));
            try {
                //Conexión a la base de datos de MySql
                //Connection cnx = null;
                //String codigo = request.getParameter("codPlato");
                String nombre = request.getParameter("nombre");
                String precio = request.getParameter("precio");
                String disponibilidad = request.getParameter("disponibilidad");
                Statement st = null;
                //ResultSet rs = null;
                st = cnx.createStatement();
                st.executeUpdate("insert into plato (nombre, precio, disponibilidad)"
                        + "values ('"+nombre+"','"+precio+"','"+disponibilidad+"');");
                //redireccionar al archivo index.html
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>