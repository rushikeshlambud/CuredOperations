<%@page import="java.sql.PreparedStatement"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="jumbotron text-center">
            <h1>Delete User</h1>
        </div>
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <%
                    int id = Integer.parseInt(request.getParameter("id"));

                    String deleteSQL = "DELETE FROM users WHERE id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(deleteSQL)) {
                        stmt.setInt(1, id);
                        stmt.executeUpdate();
                        out.println("<div class='alert alert-success'>User deleted successfully!</div>");
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<div class='alert alert-danger'>Error deleting user!</div>");
                    }
                %>
                <a href="index.jsp" class="btn btn-secondary btn-block">Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>