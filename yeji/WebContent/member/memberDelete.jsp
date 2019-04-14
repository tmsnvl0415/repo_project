<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<%
		String id = new String(request.getParameter("id").getBytes("8859_1"),"UTF-8");
		if (id==null || id.trim().equals("")){
			response.sendRedirect("memberList.jsp");
			return;
		}
		int n = stdao.deleteMember(id);
		String msg = null;
		String uri = null; 
		if (n>0){
			msg = "회원삭제성공!! 회원보기페이지로 이동합니다.";
			uri = "memberList.jsp";
		}else {
			msg = "학생삭제실패!! 회원보기페이지로 이동합니다.";
			uri = "memberList.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=uri%>";
</script>
