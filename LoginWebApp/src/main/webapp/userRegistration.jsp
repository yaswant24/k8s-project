<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");

    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ correct driver

        String url = "jdbc:mysql://mysqldb-service:3306/devopsclass?useSSL=false&serverTimezone=UTC";
        String dbUser = "devops";
        String dbPass = "Sunday@2025";

        con = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "INSERT INTO USER (first_name, last_name, email, username, password, regdate) VALUES (?, ?, ?, ?, ?, CURDATE())";
        pst = con.prepareStatement(sql);

        pst.setString(1, firstName);
        pst.setString(2, lastName);
        pst.setString(3, email);
        pst.setString(4, userName);
        pst.setString(5, password);

        int i = pst.executeUpdate();

        if (i > 0) {
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (pst != null) pst.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
