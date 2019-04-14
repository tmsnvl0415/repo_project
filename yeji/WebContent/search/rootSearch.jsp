<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../main/top.jsp" %>
<script type="text/javascript">
function openWinC(){
	document.search.action=window.open("<%=request.getContextPath()%>/member/book.jsp", "", "width=320 height=400");
}
</script>
<% 
	String searchtext = request.getParameter("searchtext");
	searchtext = new String(searchtext.getBytes("ISO-8859-1"), "UTF-8");

	Boolean ok = false;
	String name = null;
	
	String msg = null;
	String uri = null;
	String sql = null;
	
	String bName = null;
	String author2 = null;
	String company2 = null;
	int price2 = 0;
	String date2 = null;
	String sort2 = null;
	
	Class.forName("org.gjt.mm.mysql.Driver");
	String url ="jdbc:mysql://127.0.0.1:3306/project";
	String user = "root";
	String pass = "yeji1123";
	Connection con = DriverManager.getConnection(url,user,pass);

	sql ="select * from 책 where 책이름=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = null;

	ps.setString(1, searchtext);
	rs = ps.executeQuery();
	ok = false;
		%>
		<html>
<head>
	<title>목록보기</title>
</head>
<script type="text/javascript">
function openWinAB(){
	document.search.action=window.open("book.jsp", "", "width=320 height=400");
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
			<input type="button" value = "도서 추가" onClick="javascript:openWinC()">
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
	
	while(rs.next()){
		bName = rs.getString(1);
		author2 = rs.getString(2);
		company2= rs.getString(3);
		price2= rs.getInt(4);
		date2= rs.getString(5);
		sort2= rs.getString(6);
		
		%>
		<form name="search" action="../member/bookDelete.jsp" method="post">
		<tr>
			<td align="center"><%=bName%></td>
			<td align="center"><%=author2%></td>
			<td align="center"><%=company2%></td>
			<td align="center"><%=price2%></td>
			<td align="center"><%=date2%></td>
			<td align="center"><%=sort2%></td>
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