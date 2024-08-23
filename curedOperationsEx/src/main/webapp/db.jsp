<%@ page import="java.sql.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/projects";
    String dbUser = "root";
    String dbPass = "rush1902";

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
