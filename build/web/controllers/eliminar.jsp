<%@page import="java.sql.*"%>
<%
    Connection conexion = null;
    Statement sta = null;
    ResultSet result = null;
    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.jdbc.Driver");//Se inicialice el driver
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuario_jsp?user=root&password=jorge");

        sta = conexion.createStatement();
        sta.executeUpdate("DELETE FROM usuarios WHERE id = '"+id+"' ");
        response.sendRedirect("../");

    } catch (Exception e) {
        out.print(e + "");
    }
%>

