<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션값 설정 : session.setAttribute("키값", "데이터값");
	//세션값 꺼내기 : Object Obj = session.getAttribute("키값");
	//세션갑 삭제 : session.removeAttribute("키값");
	session.invalidate(); //모든 세션값을 삭제한다.
%>
<script type="text/javascript">
	alert("정상적으로 로그아웃 되었습니다.");
	location.href ="<%=request.getContextPath()%>/main/top.jsp";
</script>