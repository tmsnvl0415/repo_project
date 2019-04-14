<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
		String name = request.getParameter("name");
		if (name == null || name.trim().equals("")){
			response.sendRedirect("student.jsp");
			return;
		}
		
		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://127.0.0.1:3306/project";
		String user = "root";
		String pass = "yeji1123";
		
		Connection con = DriverManager.getConnection(url, user, pass);
		String sql = "select count(*) from student where name=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);%>
<html>
<head>
	<title>학생찾기</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2><%=name%> 학 생 찾 기</h2>
			<li><a href="student.jsp">학생관리페이지1</a></li>
		<hr color="green" width="300">
		<table border="1" width="400">
			<tr>
				<th width="20%">아이디</th>
				<th width="30%">학생명</th>
				<th width="50%">학급명</th>
			</tr>		
<%	if (count==0){%>
			<tr>
				<td colspan="3" align="center">
					찾으시는 <%=name%>학생은 없습니다.
				</td>
			</tr>		
<%	} else {
			sql = "select * from student where name=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while(rs.next()){
				String id = rs.getString(1);
				//String name = rs.getString(2);
				String cname = rs.getString(3);%>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=cname%></td>
				</tr>
<%		}%>
				<tr>
					<td colspan="3" align="center">
						<%=name%>학생은 총 <%=count%>명 있습니다.
					</td>
				</tr>				
<%	}%>
		</table>
	</div>
</body>
</html>













