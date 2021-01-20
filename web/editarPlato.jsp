<%-- 
    Document   : editarPlato
    Created on : 20/01/2021, 9:31:18 a. m.
    Author     : Fabián Machuca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file = "conexion.jsp" %> <%-- incluye un archivo --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <title>Edición</title>
    </head>
    <body>
        <%            
            String codPlato = request.getParameter("codPlato");
            String nombre = request.getParameter("nombre");
            String precio = request.getParameter("precio");
            String disponibilidad = request.getParameter("disponibilidad");
        %>
        <div class = "container">
            <h3>Edición de Plato</h3>
            <form action="editarPlato.jsp" method="post">
                <div class="mb-3">
                    <label for="codPlato" class="form-label">Código</label>
                    <input type="number" class="form-control" value="<%= codPlato%>" id="codPlato" name="codPlato" placeholder="Código del plato" readonly>

                </div>
                <div class="mb-3">
                    <label for="nombre" class="form-label">Usuario</label>
                    <input type="text" class="form-control" value="<%= nombre%>" id="nombre" name="nombre" placeholder="Nombre del plato" required>

                </div>
                <div class="mb-3">
                    <label for="precio" class="form-label">Correo Electrónico</label>
                    <input type="number" class="form-control" value="<%= precio%>" id="precio" name="precio" placeholder="Precio del plato" required>

                </div>
                <label class="form-label">Disponibilidad</label>
                <%
                    if (disponibilidad.equals("1")) {
                %>
                <div class="form-check">
                    <input type="radio"  class="form-check-input" id="activo" name="disponibilidad" value="1" checked>
                    <label class="form-check-label" for="activo">
                        Activo
                    </label>
                </div>
                <div class="form-check">
                    <input type="radio"  class="form-check-input" id="inactivo" name="disponibilidad" value="0">
                    <label class="form-check-label" for="inactivo">
                        Inactivo
                    </label>
                </div>
                <%} else {%>
                <div class="form-check">
                    <input type="radio"  class="form-check-input" id="activo" name="disponibilidad" value="1">
                    <label class="form-check-label" for="activo">
                        Activo
                    </label>
                </div>
                <div class="form-check">
                    <input type="radio"  class="form-check-input" id="inactivo" name="disponibilidad" value="0" checked>
                    <label class="form-check-label" for="inactivo">
                        Inactivo
                    </label>
                </div>
                <%
                    }
                %>
                <br>
                <button type="submit" name="btnguardar" class="btn btn-success" title="Guardar cambios">Guardar <i class="fa fa-save"></i></button>               
                <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban"></i></a>
                
            </form>
        </div>  
        <%
            if (request.getParameter("btnguardar") != null) {
                try {
                    //Conexión a la base de datos de MySql
                    //Connection cnx = null;
                    Statement st = null;
                    //ResultSet rs = null;
                    st = cnx.createStatement();
                    st.executeUpdate("update plato set nombre = '" + nombre + "', precio = '" + precio + "', disponibilidad = '" + disponibilidad + "'"
                            + " where codPlato = '" + codPlato + "';");
                    //redireccionarl al archivo index.html
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print("Error: "+e);
                }
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>
</html>
