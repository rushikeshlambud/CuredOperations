<%@page import="java.sql.PreparedStatement"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="jumbotron text-center">
            <h1>Create User</h1>
        </div>
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <form action="create.jsp" method="post">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Create</button>
                </form><br>
                <a href="index.jsp" class="btn btn-secondary btn-block">Back to Home</a>
            </div>
        </div>

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");

                String sql = "INSERT INTO users (name, email) VALUES (?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.executeUpdate();
                    out.println("<div class='alert alert-success'>User created successfully!</div>");
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger'>Error creating user!</div>");
                }
            }
        %>
    </div>
</body>
</html>