<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
        <title>Conexión a Mysql</title>
    </head>
    <body>
        <%
                    
                
                Connection conexion = null;
                Statement sta = null;
                ResultSet result = null;
                int id = Integer.parseInt(request.getParameter("id"));                

                try {
                    Class.forName("com.mysql.jdbc.Driver");//Se inicialice el driver
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuario_jsp?user=root&password=jorge");

                    sta = conexion.createStatement();
                    result = sta.executeQuery("SELECT nombre_usuario, email FROM usuarios WHERE id = '"+id+"' ");
                    
                    
                } catch (Exception e) {
                    out.print(e + "");
                }
        %>
        <br />
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <form method="POST">
                        <% while (result.next()) {                                
                        %>
                        <div class="form-group">
                            <label for="nombre">Nombre Usuario: </label>
                            <input class="form-control" id="nombre" name="nombre" type="text" value="<%=result.getString("nombre_usuario")%>">
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail: </label>
                            <input class="form-control" id="email" name="email" type="email" value="<%=result.getString("email")%>">
                        </div>
                        <br/>
                        <% } %>
                        <div class="form-group">
                            <input type="submit" id="editar" class="btn btn-outline-secondary btn-block" name="editar" value="Editar">
                        </div>
                    </form>
                </div>
            </div>
        </div>                
        
        <%
                        
                if (request.getParameter("editar") != null) {
                    
                    String usuario = request.getParameter("nombre");
                    String email = request.getParameter("email");

                    try {
                      
                        sta.executeUpdate("UPDATE usuarios SET nombre_usuario = '"+usuario+"', email='"+email+"' WHERE id ='"+id+"'");
                        response.sendRedirect("../");

                    } catch (Exception e) {
                        out.print(e + "");
                    }
               
                }
        %>
        
        <script src="../vendors/jquery-3.3.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
