<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
		String userid = request.getParameter("userid");
		String id = request.getParameter("id");
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC","root","yuan2312162");
		ps = conn.prepareStatement("delete from records where id = ?");
		ps.setString(1,id);
		ps.executeUpdate();
		%>
		<script type="text/javascript">
			alert("信息已删除!!!");
			window.location.href="http://localhost:8080/CourseRegistration/index.jsp?userid="+userid;
		</script>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除信息</title>
</head>
<body>
	<div align="center">
		<h3>信息已删除，请返回主页！！！</h3>
		<h3><a href="index.jsp?userid=<%=userid%>">主页</a></h3>
	</div>
	</body>
</html>