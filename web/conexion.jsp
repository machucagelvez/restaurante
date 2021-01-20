<%-- 
    Document   : conexion
    Created on : 20/01/2021, 8:52:44 a. m.
    Author     : Fabián Machuca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String URL_SERVIDOR_BD = "jdbc:mysql://localhost:3306/bdrestaurante";
    final String USUARIO_BD = "root";
    final String PASSWORD_BD = "";
    Class.forName("com.mysql.jdbc.Driver");
    Connection cnx = DriverManager.getConnection(URL_SERVIDOR_BD, USUARIO_BD, PASSWORD_BD);
%>
