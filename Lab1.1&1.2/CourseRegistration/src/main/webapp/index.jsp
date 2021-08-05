<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	if(request.getParameter("submit")!=null){
		String name = request.getParameter("name");
		String course = request.getParameter("course");
		String fee = request.getParameter("fee");
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC","root","yuan2312162");
		ps = conn.prepareStatement("insert into records(name,course,fee) values(?,?,?)");
		ps.setString(1,name);
		ps.setString(2,course);
		ps.setString(3,fee);
		ps.executeUpdate();
		%>
		<script>
			alert("数据已记录!!!");
		</script>
		
		
	<% 
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" 
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<nav class = "navbar navbar-expand-md navbar-dark"
		style = "background-color:blue">
		<div class="navbar-brand">
			<h1>课程报名系统</h1>
		</div>
	</nav>
	<h2 align="right">
		<a href="login.jsp" onClick="alert('登出成功!!!')">
		登出
		</a>
	</h2>
	<%
		String userid = request.getParameter("userid");
	%>
	<h2>
		管理员 : <%=userid%>
	</h2>
	&nbsp;
	<p>查看课程选择列表 : 
		<select name="Events">
			<option value="0" selected>请选择课程</option>
			<option value="Java">Java</option>
			<option value="C++">C++</option>
			<option value="C">C</option>
			<option value="Python">Python</option>
			<option value="Html">Html</option>
			<option value="PHP">PHP</option>
		</select>
	</p>
	
	&nbsp;&nbsp;&nbsp;&nbsp;
	<h2>填写报名资料</h2>
	<div class="row">
		<div class = "col-sm-4">
			<form class = "card" method="post" action="#">
				<div class="card-body">
					<div align="left">
						<label class="form-label">姓名</label>
						<input type="text" class="form-control" placeholder="请输入姓名" name="name" id="name" required>
					</div>
					<div align="left">
						<label class="form-label">课程</label>
						<input type="text" class="form-control" placeholder="请输入课程名称" name="course" id="course" required>
					</div>
					<div align="left">
						<label class="form-label">报名费用</label>
						<i class="fa fa-rmb"></i>
						<input type="text" class="form-control" placeholder="请输入报名费用" name="fee" id="fee" required>
					</div>
					</br>
					<div align="center">
						<input type="submit" id="submit" value="报名" name="submit" class="btn btn-success">
						<input type="reset" id="reset" value="重置" name="reset" class="btn btn-warning">
					</div>
				</div>
			</form>
		</div>
		
		<div class = "col-sm-7">
			<h2>查看报名信息</h2>
			<div class="panel-body">
				<table id="table-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>姓名</th>
							<th>课程</th>
							<th>报名费用<i class="fa fa-rmb"></i></th>
							<th>操作</th>
						</tr>
					</thead>
						<%
						Connection conn;
						PreparedStatement ps;
						ResultSet rs;
						
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC","root","yuan2312162");
						
						String query = "select * from records";
						Statement st = conn.createStatement();
						rs = st.executeQuery(query);
						while(rs.next()){
							String id = rs.getString("id");
							
							
						
						
						%>
						
					<tbody>
						<tr>
							<td><%=rs.getString("name") %></td>
							<td><%=rs.getString("course") %></td>
							<td><%=rs.getString("fee") %></td>
							<td>
							<a href="update.jsp?id=<%=id%>&userid=<%=userid%>">修改</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="delete.jsp?id=<%=id%>&userid=<%=userid%>">删除</a>
							</td>
						</tr>
					</tbody>
						<%
							}
						%>
				
				</table>
			</div>
			
		</div>
	</div>
</body>
</html>