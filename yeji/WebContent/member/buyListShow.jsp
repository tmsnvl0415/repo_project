<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ include file="../main/top.jsp" %>

<%  String selectedMonth = request.getParameter("selectedMonth");
	String selectedDate = request.getParameter("selectedDate");
	String allDate = "201"+ selectedMonth + selectedDate;
	int commitDate = Integer.parseInt(allDate);
	boolean onlyMonth = false;
	if(selectedDate.equals("00"))
		onlyMonth = true;
%>

<html>
<head>
	<title>목록보기</title>
</head>

<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>구 매 내 역 보 기</h2>
	<li><a href="../main/top.jsp">홈페이지</a></li>
		<hr color="green" width="300">
		<form name="comboDate" action="../member/buyListShow.jsp" method="post">
   			 <select name ="selectedMonth">
   			 	<option value="01">1월</option><option value="02">2월</option><option value="03">3월</option><option value="04">4월</option>
   				<option value="05">5월</option><option value="06">6월</option><option value="07">7월</option><option value="08">8월</option>
   			 	<option value="09">9월</option><option value="10">10월</option><option value="11">11월</option><option value="12">12월</option>
   			 </select>
   			 <select name ="selectedDate">
   			 	<option value="00">없음</option><option value="01">1일</option><option value="02">2일</option><option value="03">3일</option><option value="04">4일</option>
   				<option value="05">5일</option><option value="06">6일</option><option value="07">7일</option><option value="08">8일</option>
   			 	<option value="09">9일</option><option value="10">10일</option><option value="11">11일</option><option value="12">12일</option>
   			 	<option value="13">13일</option><option value="14">14일</option><option value="15">15일</option><option value="16">16일</option>
   				<option value="17">17일</option><option value="18">18일</option><option value="19">19일</option><option value="20">20일</option>
   			 	<option value="21">21일</option><option value="22">22일</option><option value="23">23일</option><option value="24">24일</option>
   			 	<option value="25">25일</option><option value="26">26일</option><option value="30">27일</option><option value="28">28일</option>
   				<option value="29">29일</option><option value="30">30일</option><option value="31">31일
   			 </select>
   			 <input type="submit" value = "검색">
        </form>

		<table border="1" width="1000">
			<tr>
				<th width="20%">은행명</th>
				<th width="15%">입금자</th>
				<th width="15%">입금금액</th>
				<th width="15%">입금일자</th>
				<th width="15%">회원ID</th>
				<th width="10%">책이름</th>
			</tr>
<%
	Class.forName("org.gjt.mm.mysql.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/project";
	String user = "root";
	String pass = "yeji1123";
	int Sum = 0; 
		Connection con = DriverManager.getConnection(url,user,pass);
		String sql = "select * from 구입내역 where 입금일자=? ";	
		if(onlyMonth){
			sql = "select * from 구입내역 where 입금일자>=? and 입금일자<=?";
		}
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = null;
		ps.setInt(1, commitDate);
		if(onlyMonth){
			ps.setInt(2,commitDate+31);
		}
		rs = ps.executeQuery();
		while(rs.next()){
			String bank = rs.getString(1);
			String name = rs.getString(2);
			int price = Integer.parseInt(rs.getString(3));
			String date = rs.getString(4);
			String mId = rs.getString(5);
			String bName = rs.getString(6);
			Sum += price;
		%>
		<form name="search" action="../member/bookDelete.jsp" method="post">
		<tr>
			<td align="center"><%=bank%></td>
			<td align="center"><%=name%></td>
			<td align="center"><%=price%></td>
			<td align="center"><%=date%></td>
			<td align="center"><%=mId%></td>
			<td align="center"><%=bName%></td>
		</tr>
		</form>
		<% 
		}
	%>
	 <tr>
			<td align="center" valign="middle"><b>매출액</b></td>
			<td align="center" colspan="5"><%=Sum%>원</td>
		</tr>
	<%
	rs.close();
	ps.close();
	con.close();
%>
			
		</table>
	</div>
</body>
</html>