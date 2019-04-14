<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ include file="../main/top.jsp" %>
<html>
<head>
	<title>목록보기</title>
</head>
<script type="text/javascript">
function openWinAB(){
	document.search.action=window.open("<%=request.getContextPath()%>/member/book.jsp", "", "width=320 height=400");
}
</script>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>도 서 목 록 보 기</h2>
	<li><a href="../main/top.jsp">홈페이지</a></li>
		<hr color="green" width="300">
		<form name="search" action="../search/rootSearch.jsp" method="post">
			<input type="text" name = "searchtext" width="300">
    		<input type="submit" value = "검색">
			<input type="button" value = "도서 추가" onClick="javascript:openWinAB()">
		</form>
		<table border="1" width="1000">
			<tr>
				<th width="20%">책이름</th>
				<th width="15%">저자</th>
				<th width="15%">출판사</th>
				<th width="15%">가격</th>
				<th width="15%">출판일</th>
				<th width="10%">분류</th>
				<th width="10%">도서삭제</th>
			</tr>
<%
	Class.forName("org.gjt.mm.mysql.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/project";
	String user = "root";
	String pass = "yeji1123";
	Connection con = DriverManager.getConnection(url,user,pass);
	String sql = "select * from 책";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String bName = rs.getString(1);
		String author = rs.getString(2);
		String company = rs.getString(3);
		String price = rs.getString(4);
		String date = rs.getString(5);
		String sort = rs.getString(6);
		%>
		<form name="search" action="../member/bookDelete.jsp" method="post">
		<tr>
			<td align="center"><%=bName%></td>
			<td align="center"><%=author%></td>
			<td align="center"><%=company%></td>
			<td align="center"><%=price%></td>
			<td align="center"><%=date%></td>
			<td align="center"><%=sort%></td>
			<td align="center"><input type="submit" value = "삭제"><input type="hidden" name="bName" value = "<%=bName%>"> </td>
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