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
            if (request.getParameter("enviar") != null) {
                    
                
                Connection conexion = null;
                Statement sta = null;
                ResultSet result = null;
                String usuario = request.getParameter("nombre");
                String email = request.getParameter("email");

                try {
                    Class.forName("com.mysql.jdbc.Driver");//Se inicialice el driver
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuario_jsp?user=root&password=jorge");

                    sta = conexion.createStatement();
                    sta.executeUpdate("INSERT INTO usuarios (nombre_usuario, email)VALUES ('"+usuario+"','"+email+"')");
                    response.sendRedirect("../");
                    
                } catch (Exception e) {
                    out.print(e + "");
                }
            }
        %>
        <br />
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <form method="POST">
                        <div class="form-group">
                            <label for="nombre">Nombre Usuario: </label>
                            <input class="form-control" id="nombre" name="nombre" type="text" placeholder="ingrese el nombre de usuario">
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail: </label>
                            <input class="form-control" id="email" name="email" type="email" placeholder="example@example.com">
                        </div>
                        <br/>    
                        <div class="form-group">
                            <input type="submit" id="enviar" class="btn btn-outline-secondary btn-block" name="enviar" value="Crear">
                        </div>
                    </form>
                </div>
            </div>
        </div>                
        
        
        
        <script src="../vendors/jquery-3.3.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
