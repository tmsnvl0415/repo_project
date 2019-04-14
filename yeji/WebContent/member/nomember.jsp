<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>학생관리</title>
</head>
<body>
<%
String bname = request.getParameter("bname2");
String pricesend = request.getParameter("pricesend2");
bname= new String(bname.getBytes("ISO-8859-1"), "UTF-8");
%>
	<link rel="stylesheet" type="text/css" href="../style.css">
	<br>
	<p>
	<img src="<%=request.getContextPath()%>/img/join4.jpg"  width="300" height="70" border="0" 
	align=center ALT="비회원">
	<div align="left">
	<form name="nomember_buy" action="../buy/buy.jsp" method="post">
		<table border="1">
			<tr>
				<td width="300" align="right">
					이     름  : <input type="text" name="name" ><br>
					주민번호  : <input type="text" name="ssn"><br>
					휴대폰번호: <input type="text" name="phone"><br>
					이 메 일   : <input type="text" name="mail"><br>
					주     소  : <input type="text" name="addr"><br>
					<input type = "hidden" name="nonmembergo" value = "go">
					<input type = "hidden" name="bname" value="<%=bname%>">
					<input type = "hidden" name="pricesend" value = "<%=pricesend%>">
					<input type = "submit" value="입력">
					<input type ="reset" value="취소" onclick="window.close()">
					
				</td>
			</tr>	
		</table>
	</form>
	</div>
</body>
</html>