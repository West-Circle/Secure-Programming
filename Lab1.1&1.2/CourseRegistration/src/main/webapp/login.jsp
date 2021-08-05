<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	if(request.getParameter("submit")!=null){
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC","root","yuan2312162");
		ps = conn.prepareStatement("select * from login where userid = ? and password = ?");
		ps.setString(1, userid);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if(rs.next()){
			%>
			<script type="text/javascript">
				alert("登录成功!!!");
				window.location.href="http://localhost:8080/CourseRegistration/index.jsp?userid=<%=userid%>";
			</script>
		<% 
		}else{
			%>
			<script type="text/javascript">
				alert("用户名或密码输入错误，请重新输入!!!");
				window.location.href="http://localhost:8080/CourseRegistration/login.jsp";
			</script>
		<% 
		}
		%>
		
	<% 
	}
	
%>
<%	
		if(request.getParameter("submit1")!=null){
			String userid1 = request.getParameter("userid1");
			String password1 = request.getParameter("password1");
			Connection conn;
			PreparedStatement ps;
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC","root","yuan2312162");
			ps = conn.prepareStatement("insert into login values (?, ?)");
			ps.setString(1, userid1);
			ps.setString(2, password1);
			int i = ps.executeUpdate();
			if(i > 0 && userid1 != "" && password1 != ""){
				%>
				<script type="text/javascript">
					alert("注册成功!!!");
					window.location.href="http://localhost:8080/CourseRegistration/login.jsp";
				</script>
			<% 
			}else{
				%>
				<script type="text/javascript">
					alert("注册失败，请重新输入!!!");
					window.location.href="http://localhost:8080/CourseRegistration/login.jsp";
				</script>
			<% 
			}
			%>
			
		<% 
		}

%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" 
	crossorigin="anonymous">
</head>
<body>
	<nav class = "navbar navbar-expand-md navbar-dark"
		style = "background-color:blue">
		<div class="navbar-brand">
			<h1>课程报名系统</h1>
		</div>
	</nav>
	<div align="center">
		<h1>管理员登录</h1>
		<form action="#" method="post">
			<table>
				<tr>
					<td>用户名 :</td>
					<td><input type="text" placeholder="请输入用户名" name="userid" id="userid"/></td>
				</tr>
				<tr>
					<td>密码   :</td>
					<td><input type="password" placeholder="请输入密码" name="password" id="password" /></td>
				</tr>
			</table>
			<input class="btn" type="submit" value="登录" id="submit" name="submit" />
		</form>
	</div>
	<br><br><br><br>
	<div align="center">
		<h1>管理员注册</h1>
		<form action="#" method="post">
			<table>
				<tr>
					<td>用户名 :</td>
					<td><input type="text" placeholder="请输入用户名" name="userid1" id="userid1"/></td>
				</tr>
				<tr>
					<td>密码   :</td>
					<td><input type="password" placeholder="请输入密码" name="password1" id="password1" /></td>
				</tr>
			</table>
			<input class="btn" type="submit" value="注册" id="submit1" name="submit1" />
		</form>
	</div>
</body>
</html>