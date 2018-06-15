
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
            int contador = 1;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");//Se inicialice el driver
                conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuario_jsp?user=root&password=jorge");
                
                sta = conexion.createStatement();
                result = sta.executeQuery("SELECT * FROM usuarios");
                
            } catch (Exception e) {
                out.print(e);            
            }
        %>
        
        <br />
        
        <div class="container">
            <a href="./controllers/crear.jsp" class="btn btn-outline-primary" style="margin-bottom: 25px;">Crear usuario</a>                    
            <div class="table-responsive">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th>Id</th>
                            <th>Nombre Usuario</th>
                            <th>Email</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (result.next()) {                                
                        %>
                        
                        <tr>
                            <td><%=contador%></td>
                            <td><%=result.getString("nombre_usuario")%></td>
                            <td><%=result.getString("email")%></td>
                            <td>
                                <div class="btn-group">
                                    <a href="./controllers/editar.jsp?id=<%=result.getString("id")%>" class="btn btn-outline-primary"><i class="fas fa-edit"></i></a>
                                    <a href="./controllers/eliminar.jsp?id=<%=result.getString("id")%>" class="btn btn-outline-danger"><i class="far fa-trash-alt"></i></a>          
                                </div>
                        </td>    
                        </tr>                
                        
                        <% contador++; }
                          sta.close();
                          result.close();
                          conexion.close();
                        %>
                    </tbody>
                </table>           
            </div>
        </div>        
        <script src="./vendors/jquery-3.3.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
