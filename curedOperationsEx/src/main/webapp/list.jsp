<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Users</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="jumbotron text-center">
            <h1>List of Users</h1>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String sql = "SELECT * FROM users";
                            try (Statement stmt = conn.createStatement();
                                 ResultSet rs = stmt.executeQuery(sql)) {
                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    String name = rs.getString("name");
                                    String email = rs.getString("email");
                        %>
                            <tr>
                                <td><%= id %></td>
                                <td><%= name %></td>
                                <td><%= email %></td>
                                <td>
                                    <a href="edit.jsp?id=<%= id %>" class="btn btn-primary btn-sm">Edit</a>
                                    <a href="delete.jsp?id=<%= id %>" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        <%
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
                <a href="index.jsp" class="btn btn-secondary btn-block">Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>