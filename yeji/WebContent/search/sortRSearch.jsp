<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../main/top.jsp" %>
<%
	String Id = (String)session.getAttribute("id");
	String Name2 = (String)session.getAttribute("name");
	boolean isLogin2 = false;
	if(Id==null || Name2 ==null){
		isLogin2=false;
	}else{
		isLogin2=true;
	}
%>

<% 
	String r = new String(request.getParameter("r").getBytes("8859_1"),"UTF-8");
	
	String msg = null;
	String uri = null;
	String sql = null;
	
	String bName2 = null;
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

		sql ="select * from 책 where 분류=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = null;
	
	ps.setString(1, r);
	rs = ps.executeQuery();
		%>
		<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>검 색 결 과 보 기</h2>
	<li><a href="../main/top.jsp">홈페이지</a></li>
		<hr color="green" width="300">

		<div align ="center">
			<table border="1" width="800" >
		<tr>
			<td width="20%">책이름</td>
			<td width="15%">저자</td>
			<td width="20%">출판사</td>
			<td width="10%">가격</td>
			<td width="10%">출판일</td>
			<td width="10%">분류</td>
			<td width="5%" colspan="2">구매결정</td>
		</tr>
		<%
	
	while(rs.next()){
		bName2 = rs.getString(1);
		author2 = rs.getString(2);
		company2= rs.getString(3);
		price2= rs.getInt(4);
		date2= rs.getString(5);
		sort2= rs.getString(6);
		
		%>
		<tr>
			<form name="search" action = "../buy/buy.jsp" method="post">
			<td width="20%"><%=bName2 %><input name="bname" type="hidden" value="<%=bName2%>"></td>
			<td width="15%"><%=author2%></td>
			<td width="20%"><%=company2%></td>
			<td width="10%"><%=price2 %><input name="pricesend" type="hidden" value="<%=price2%>"></td>
			<td width="15%"><%=date2 %></td>
			<td width="20%"><%=sort2 %></td>
			<td><input name="mbuy" type="submit" value="회원구매"></td>
			</form>
			<form name="nonmembersearch" action = "../member/nomember.jsp" method="post">
			<input name="bname2" type="hidden" value="<%=bName2%>">
			<input name="pricesend2" type="hidden" value="<%=price2%>">
			<td><input name="nmbuy" type="submit" value="비회원구매" ></td>
			</form>
		</tr>
		
	<%
	}
	rs.close();
	ps.close();
	con.close();
%>