<%@page import="control.FrontController"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int size = 10*1024*1024;
	String uploadPath = "C:/Program Files/Apache Software Foundation/Tomcat 7.0/webapps/ROOT/WebContent/PlitImage/";
	JSONObject jobj = null;
	String result = "-12";
	

	
	System.out.println("test Strat");

try{

	  // ���� ���ε�. ������ ������ ���ڰ��� ��� ����request ��ü ����, ���ε� ���, ���� �ִ� ũ��, �ѱ�ó��, ���� �ߺ�ó��

	  MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr", new DefaultFileRenamePolicy());
	 

	  // ���� �������� form���� �Է��� ������ ���� �����´�.
		
	  String json = multi.getParameter("json");
	  System.out.println(json);
	  //jobj = new JSONObject(json);
	 

	// ���ε��� ���ϵ��� Enumeration Ÿ������ ��ȯ

	// Enumeration���� �����͸� �̾ƿö� ������ �������̽���.  Enumeration��ü�� java.util ��Ű���� ���� �Ǿ������Ƿ�

//	     java.util.Enumeration�� import ���Ѿ� ��.

		
	 JSONArray jrr = new JSONArray();

	// ���ε��� ���ϵ��� �̸��� ����

	   for (Enumeration  e = multi.getFileNames(); e.hasMoreElements() ;) 
	   {
         String strName = (String) e.nextElement();
         String fileName= multi.getFilesystemName(strName);
         if (fileName != null) 
         {
        	 jrr.put(new JSONObject().put("photo", fileName));
         }
 	   }
	
	  //String result = new FrontController().control(jobj,jrr).toString();
	  
	 // out.print(result + "  "+json);
	 
	 jobj = new JSONObject(json);
	 
	 jobj.put("name", jrr.getJSONObject(0).getString("photo"));
	 
	 
	 
	 result = new FrontController().control(jobj).toString();
	 
	 System.out.println("test ENd");
	 System.out.println("  "+jrr.toString());//jobj.toString()+

	 }catch(Exception e){

	  // ����ó��

	  e.printStackTrace();
	  
	  out.println(result);

	 }
%>
