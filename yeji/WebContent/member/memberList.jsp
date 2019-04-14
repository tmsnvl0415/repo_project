<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ include file="../main/top.jsp" %>
<html>
<head>
	<title>목록보기</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>회 원 목 록 보 기</h2>
	<li><a href="../main/top.jsp">홈페이지</a></li>
		<hr color="green" width="300">
		<table border="1" width="1000">
			<tr>
				<th width="7%">이름</th>
				<th width="10%">아이디</th>
				<th width="10%">비밀번호</th>
				<th width="15%">주민번호</th>
				<th width="15%">휴대폰번호</th>
				<th width="15%">이메일</th>
				<th width="15%">주소</th>
				<th width="8%">마일리지</th>
				<th width="5%">회원삭제</th>
			</tr>
<%
	Class.forName("org.gjt.mm.mysql.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/project";
	String user = "root";
	String pass = "yeji1123";
	Connection con = DriverManager.getConnection(url,user,pass);
	String sql = "select * from 회원";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String name = rs.getString(1);
		String id = rs.getString(2);
		String pw = rs.getString(3);
		String ssn = rs.getString(4);
		String phone = rs.getString(5);
		String mail = rs.getString(6);
		String addr = rs.getString(7);
		int bonus = rs.getInt(8);%>
		<form name="search" action="memberDelete.jsp" method="post">
		<tr>
			<td align="center"><%=name%></td>
			<td align="center"><%=id%></td>
			<td align="center"><%=pw%></td>
			<td align="center"><%=ssn%></td>
			<td align="center"><%=phone%></td>
			<td align="center"><%=mail%></td>
			<td align="center"><%=addr%></td>
			<td align="center"><%=bonus%></td>
			<td align="center"><input type="submit" value = "삭제"> <input type="hidden" name="id" value = "<%=id%>"></td>
		</tr>
		</form>
		<% 
	}
	rs.close();
	ps.close();
	con.close();
%>
			
		</table>
	</div>
</body>
</html>