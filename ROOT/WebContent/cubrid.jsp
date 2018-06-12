<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>

<%@ page import="java.sql.*" %>

<%@ page import="javax.sql.*" %>

<%@ page import="javax.naming.*" %>

<%

    Connection conn = null;

    PreparedStatement pstmt = null;

    ResultSet rs = null;
    
    String tmp = null;

    try {

 

        Context initContext = new InitialContext();               

        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/CUBRIDDS");     

              conn = ds.getConnection();                   

              String sql = "select ID from user_info";                                                                                                                                                                                    

              pstmt = conn.prepareStatement(sql);

              rs = pstmt.executeQuery();

              while(rs.next()) {

                  //out.println("ID ==> " + rs.getString(1));
					tmp = rs.getString(1);
                 // out.println("<br>");

              }

      } catch ( SQLException e ) {

              e.printStackTrace();

      } catch ( Exception e ) {

              e.printStackTrace();

      } finally {

          try{

                if ( rs != null ) rs.close();

              }catch( Exception e ) {}

          try{

                if ( pstmt != null ) pstmt.close();

              }catch( Exception e ) {}

          try{

                if ( conn != null ) conn.close();

              }catch( Exception e ) {}

      }

%>

<html>
<head></head>
<body>

<%=tmp %>


</body>
</html>

