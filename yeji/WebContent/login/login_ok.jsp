<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.login.*" %>
   
<jsp:useBean id="check" class="my.login.LoginCheck" scope="session"/>
<jsp:setProperty property="*" name="check"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="check" value="<%=pool%>"/>
<jsp:useBean id="loginOk" class="my.login.LoginOkBean" scope="session"/>
<jsp:setProperty property="pool" name="loginOk" value="<%=pool%>"/>
<%
		int result = check.memberCheck();
		String msg = null;
		String uri = null;
		if (result == LoginCheck.OK){
			loginOk.setId(check.getId());
			loginOk.infoSetting();
			session.setAttribute("id",loginOk.getId());
			session.setAttribute("name", loginOk.getName());
			msg = loginOk.getName()+"님 로그인 되었습니다.";
			uri = request.getContextPath()+"/main/top.jsp";
		}else if (result == LoginCheck.NOT_ID){
			msg = "아이디가 없습니다. 다시 확인해 보세요!!";
			uri = request.getContextPath()+"/login/login.jsp";
		}else if (result == LoginCheck.NOT_PWD){
			msg = "비밀번호가 틀렸습니다. 다시 확인해 보세요!!";
			uri = request.getContextPath()+"/login/login.jsp";
		}else if (result == LoginCheck.ERROR){
			msg = "죄송합니다. 서버 오류입니다. 다시 입력해 주세요!!";
			uri = request.getContextPath()+"/login/login.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=uri%>";
</script>
