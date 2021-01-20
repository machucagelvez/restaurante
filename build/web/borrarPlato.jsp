<%-- 
    Document   : borrarPlato
    Created on : 20/01/2021, 10:42:32 a. m.
    Author     : Fabián Machuca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file = "conexion.jsp" %> <%-- incluye un archivo --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminación</title>
    </head>
    <body>
        <%            
            Statement st = null;
            //ResultSet rs = null;
            String codPlato = request.getParameter("codPlato");
            //if (confirm("Está seguro de eliminar este usuario?")) {
    
            
            try {
                st = cnx.createStatement();
                st.executeUpdate("delete from plato where codPlato = '" + codPlato + "';");
                //redireccionarl al archivo index.html
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.print("Error: " + e);
            }
            //    }
        %>
    </body>
</html>
