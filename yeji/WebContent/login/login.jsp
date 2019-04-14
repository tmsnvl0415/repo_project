<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/top.jsp"%>
<script type="text/javascript">
	function openWinS(){
		window.open("<%=request.getContextPath()%>/member/member.jsp", "", "width=320 height=400");
	}
	function closeWin(){
		window.close();
	}
	function loginCheck(){
		if(f.id.value==""){
			alert("아이디를 입력하세요!!");
		f.id.focus();
		return;
		}
		if(f.pwd.value==""){
			alert("비밀번호를 입력하세요");
			f.pwd.focus();
			return;
		}
		document.f.submit();
	}
</script>
<!-- login.jsp-->
<link rel="stylesheet" type="text/css" href="../style.css">
<br>
<img src="../img/bottom.gif" width=570 height="40" border="0" alt="">
<br>
<p>
<img src="../img/tm_login.gif" width=100 height="13" border="0" 
	align=center ALT="회원 로그인">
<form name="f" action="login_ok.jsp" method="post">
	<table width="60%" align="center" border="0" height="120">
		<tr>
			<td align="right" width="30%">
				<img src="../img/id01.gif" 
				width="28" height="11" border="0" alt="아이디">&nbsp;&nbsp;
			</td>
			<td width="40%">
				<input type="text" name="id">
			</td>
			<td rowspan="2" width="30%" valign="middle">
				<a href="javascript:loginCheck()">
				<img src="../img/bt_login.gif" border="0" alt="로그인"></a>
				&nbsp;&nbsp;<br>

			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="../img/pwd.gif" 
							width="37" height="11" border="0" alt="비밀번호">
			</td>
			<td>
				<input type="password" name="pwd"  id="myinput">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<a href="javascript:openWinS()">
					<img src="../img/bt_join.gif"
						 width="60" height="25" border="0" alt="회원가입">
				</a>		
						 
			</td>
		</tr>
	</table>
</form> 