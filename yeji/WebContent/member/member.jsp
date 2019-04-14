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
	<img src="<%=request.getContextPath()%>/img/join3.JPG"  width="300" height="70" border="0" 
	align=center ALT="회원 가입">
	<div align="left">
	<form name="insert" action="insert.jsp" method="post">
		<table border="1">
			<tr>
				<td width="300" align="right">
					이     름  : <input type="text" name="name" ><br>
					아 이 디  : <input type="text" name="id"><br>
					비밀번호  : <input type="text" name="pw"><br>
					주민번호  : <input type="text" name="ssn"><br>
					휴대폰번호: <input type="text" name="phone"><br>
					이 메 일   : <input type="text" name="mail"><br>
					주     소  : <input type="text" name="addr"><br>
					
					<input type = "submit" value="입력">
					<input type ="reset" value="취소" onclick="window.close()">
					
				</td>
			</tr>	
		</table>
	</form>
	</div>
</body>
</html>