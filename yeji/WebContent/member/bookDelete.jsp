<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<%
		String bName = new String(request.getParameter("bName").getBytes("8859_1"),"UTF-8");
		if (bName==null || bName.trim().equals("")){
			response.sendRedirect("bookList.jsp");
			return;
		}
		int n = stdao.deleteBook(bName);
		String msg = null;
		String uri = null; 
		if (n>0){
			msg = "도서삭제성공!! 도서목록보기페이지로 이동합니다.";
			uri = "bookList.jsp";
		}else {
			msg = "도서삭제실패!! 도서목록보기페이지로 이동합니다.";
			uri = "bookList.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=uri%>";
</script>
