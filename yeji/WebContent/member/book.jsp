<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>학생관리</title>
</head>
<body>
	<link rel="stylesheet" type="text/css" href="../style.css">
	<br>
	<p>
	<img src="../img/join5.jpg"  width="300" height="70" border="0" 
	align=center ALT="도서 추가">
	<div align="left">
	<form name="insert" action="bookInsert.jsp" method="post">
		<table border="1">
			<tr>
				<td width="300" align="right">
					책 이 름  : <input type="text" name="bName" ><br>
					저     자  : <input type="text" name="author"><br>
					출 판 사  : <input type="text" name="company"><br>
					가     격  : <input type="text" name="price"><br>
					출 판 일: <input type="text" name="date"><br>
					분     류   : <input type="text" name="sort"><br>
					
					<input type = "submit" value="입력">
					<input type ="reset" value="취소" onclick="window.close()">
					
				</td>
			</tr>	
		</table>
	</form>
	</div>
</body>
</html>