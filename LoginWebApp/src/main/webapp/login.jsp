<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ Updated driver

        String url = "jdbc:mysql://mysqldb-service:3306/devopsclass?useSSL=false&serverTimezone=UTC";
        String dbUser = "devops";
        String dbPass = "Sunday@2025";

        con = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "SELECT * FROM USER WHERE username = ? AND password = ?";
        pst = con.prepareStatement(sql);
        pst.setString(1, userName);
        pst.setString(2, password);
        rs = pst.executeQuery();

        if (rs.next()) {
            session.setAttribute("userid", userName);
            response.sendRedirect("success.jsp");
        } else {
            out.println("Invalid credentials. <a href='index.jsp'>Try again</a>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (pst != null) pst.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
