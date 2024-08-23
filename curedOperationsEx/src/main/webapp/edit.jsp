<%@page import="java.sql.PreparedStatement"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="jumbotron text-center">
            <h1>Edit User</h1>
        </div>
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    String name = "";
                    String email = "";

                    String selectSQL = "SELECT * FROM users WHERE id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(selectSQL)) {
                        stmt.setInt(1, id);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next()) {
                            name = rs.getString("name");
                            email = rs.getString("email");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
                <form action="edit.jsp" method="post">
                    <input type="hidden" name="id" value="<%= id %>">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" value="<%= name %>" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= email %>" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Update</button>
                </form><br>
                <a href="index.jsp" class="btn btn-secondary btn-block">Back to Home</a>

                <%
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        id = Integer.parseInt(request.getParameter("id"));
                        name = request.getParameter("name");
                        email = request.getParameter("email");

                        String updateSQL = "UPDATE users SET name = ?, email = ? WHERE id = ?";
                        try (PreparedStatement stmt = conn.prepareStatement(updateSQL)) {
                            stmt.setString(1, name);
                            stmt.setString(2, email);
                            stmt.setInt(3, id);
                            stmt.executeUpdate();
                            out.println("<div class='alert alert-success'>User updated successfully!</div>");
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("<div class='alert alert-danger'>Error updating user!</div>");
                        }
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>