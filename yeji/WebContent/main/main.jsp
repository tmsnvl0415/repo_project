<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="top.jsp">
function openWinB(){
		window.open("<%=request.getContextPath()%>/buy/buy.jsp", "", "width=500 height=600");
	}
function openWinS(){
	window.open("<%=request.getContextPath()%>/member/member.jsp", "", "width=320 height=400");
}
	</script>
<%
	mbId = (String)session.getAttribute("id");
	mbName = (String)session.getAttribute("name");
	isLogin = false;
	if(mbId==null || mbName ==null){
		isLogin=false;
	}else{
		isLogin=true;
	}
	
%>
<%if(isLogin) {%>
	<h3>[<%=mbName %>]광운서점에 오신것을 환영합니다.</h3>
<%} else{ %>
	<h3></h3>
<%} %>
<uf>
<br><br><br><br><br><br><br><br><br><br><br>
</uf>
	</td>

