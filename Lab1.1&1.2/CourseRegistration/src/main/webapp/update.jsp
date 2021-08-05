<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%	
	String uid = request.getParameter("userid");
	if(request.getParameter("submit")!=null){
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String course = request.getParameter("course");
		String fee = request.getParameter("fee");
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC","root","yuan2312162");
		ps = conn.prepareStatement("update records set name = ? , course = ? ,fee = ? where id = ?");
		ps.setString(1,name);
		ps.setString(2,course);
		ps.setString(3,fee);
		ps.setString(4,id);
		ps.executeUpdate();
		%>
		<script type="text/javascript">
			alert("数据已更新，请返回主页!!!");
			window.location.href="index.jsp?userid="+uid;
		</script>
		
		
	<% 
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新信息</title>
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
	<%
		String userid = request.getParameter("userid");
	%>
	&nbsp;
	<h3><a href="index.jsp?userid=<%=userid%>">主页</a></h3>
	<h2>管理员 : <%=userid%></h2>
	&nbsp;
	<h2>更新信息</h2>
	<div class="row">
		<div class = "col-sm-4">
			<form class = "card" method="post" action="#">
				<%
					Connection conn;
					PreparedStatement ps;
					ResultSet rs;
					
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC","root","yuan2312162");
					String id = request.getParameter("id");
					ps = conn.prepareStatement("select * from records where id = ?");
					ps.setString(1, id);
					rs = ps.executeQuery();
					while(rs.next()){
						
					
					
				%>
				<div class="card-body">
					<div align="left">
						<label class="form-label">姓名</label>
						<input type="text" class="form-control" placeholder="请输入姓名" 
							value="<%=rs.getString("name") %>" name="name" id="name" required>
					</div>
					<div align="left">
						<label class="form-label">课程</label>
						<input type="text" class="form-control" placeholder="请输入课程名称" 
						value="<%=rs.getString("course")%>" name="course" id="course" required>
					</div>
					<div align="left">
						<label class="form-label">报名费用</label>
						<input type="text" class="form-control" placeholder="请输入报名费用" 
						value="<%=rs.getString("fee")%>" name="fee" id="fee" required>
					</div>
					<%
					}
					%>
					
					</br>
					<div align="center">
						<input type="submit" id="submit" value="更新" name="submit" class="btn btn-success">
						<input type="reset" id="reset" value="重置" name="reset" class="btn btn-warning">
					</div>
				</div>
			</form>
		</div>

</body>
</html>