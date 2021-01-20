<%-- 
    Document   : index
    Created on : 20/01/2021, 8:51:51 a. m.
    Author     : Fabián Machuca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file = "conexion.jsp" %> <%-- incluye un archivo --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Platos</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
    </head>
    <body>

        <div class ="container">
            <h1>Listado de Platos</h1>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col" colspan="7">
                            <a href="formPlato.html" title="Agregar plato" class="btn btn-primary"> Agregar Plato <i class="fa fa-user-plus"></i></a>
                        </th>
                    <tr>
                        <th scope="col">Código</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Disponibilidad</th>
                        <th scope="col" colspan="2">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        /*
                        Recordar agregar la librería por Projects - Libraries
                        clic derecho en Libraries y agregar librería de MySql JDBC Driver
                         */
                        request.setCharacterEncoding("UTF-8");//acentos desde mysql
                        try {
                            //Conexión a la base de datos de MySql
                            //Connection cnx = null;
                            Statement st = null;
                            ResultSet rs = null;
                            st = cnx.createStatement();
                            rs = st.executeQuery("Select * From plato");
                            while (rs.next()) {
                                String disp = "Activo";
                                if(rs.getString("disponibilidad").equals("0")){
                                    disp = "Inactivo";
                                }
                    %>
                    <tr>
                        <th scope="row"><%= rs.getString(1)%></th>
                        <td><%= rs.getString("nombre")%></td>
                        <td><%= "$"+rs.getString(3)%></td>
                        <td><%= disp%></td>
                        <td><a href="editarPlato.jsp?codPlato=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&precio=<%= rs.getString(3)%>&disponibilidad=<%= rs.getString("disponibilidad")%>"><i class="fa fa-pencil"></i></a></td>
                        <td><a href="borrarPlato.jsp?codPlato=<%= rs.getString(1)%>" onClick = "return confirm ('¿Está seguro de que desea eliminar este plato?');"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    <%
                            }

                        } catch (Exception e) {
                            out.print("Error: "+e);
                        }
                    %>    

                </tbody>
            </table>
        </div>
                        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>
</html>
