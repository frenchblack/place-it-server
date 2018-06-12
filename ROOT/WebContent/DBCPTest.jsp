<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*, javax.naming.*, javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource" %><%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*, javax.naming.*, javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource" %>
<html>
<head>
    <title>DBCP Test</title>
</head>
<body>
<%

	out.write("asdasdasdasd");

    Statement stmt = null;
    ResultSet rs = null;
    Connection conn = null;
    
    try {
        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:/comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/CUBRIDDS");        
        conn = ds.getConnection();
        
        out.write("DBCP Connection..<br><br>");
        
        String sQuery = "select ID from user_info";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sQuery);
        
        while (rs.next())
        {
            out.write("1 + 1 = " + rs.getString(1) + "<br>");
        }
    } catch(Exception ex) {
        ex.printStackTrace();
    } finally {
        if (rs != null) try {rs.close(); } catch (Exception ex2) {}
        if (stmt != null) try {stmt.close(); } catch (Exception ex3) {}
        if (conn != null) try {conn.close(); } catch (Exception ex4) {}
    }
%>
</body>
</html>
