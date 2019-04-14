<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>MyHome</title>
	<script src="../jquery.js"></script>
   <script>$(function() {
      var dchecked = false;
      $('#details').hide();
      $('#detailchecked').click(function() {
         if (this.checked) {
        	 dchecked = false;
            $('#details').show();
         }
         else {
        	 dchecked = true;
            $('#details').hide();
         }
      });
   });</script>
</head>
<script type="text/javascript">
function openWinS(){
		window.open("<%=request.getContextPath()%>/member/member.jsp", "", "width=400 height=500");
		
	}


	</script>
	
	
<%
	String mbId = (String)session.getAttribute("id");
	String mbName = (String)session.getAttribute("name");
	boolean isLogin = false;
	boolean rootLogin = false;
	if(mbId==null || mbName ==null){
		isLogin=false;
	}else{
		isLogin=true;
		if(mbId.equals("root"))
			rootLogin = true;
	}
	
	
%>


<body>
	<div align ="center">
	<table border="1" width="1000" height="500">
	<tr height="10%">
		<td colspan="2" align="center">
		 <!--  <a href="<%=request.getContextPath()%>/main/main.jsp">홈</a> | 
		 -->
		<%if(!isLogin){ %>
					<a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a> | 
					<%}else { %>
					<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a> |
					<%} %>
		<a href="javascript:openWinS()">회원가입</a> 
		<%if(rootLogin){ %>
					| <a href="<%=request.getContextPath()%>/member/memberList.jsp">회원관리</a> |
					<a href="<%=request.getContextPath()%>/member/bookList.jsp">도서관리</a>		|
					<a href="<%=request.getContextPath()%>/member/buyList.jsp">구매내역</a>
					<%}%><br><br>
		
		<div id = "right">
		<div id = "logo" style = "float: left; margin-left: 20px;">
              <img src="../img/k.jpg " width="100" height="100" border="0" 
   align=center ALT="e" onClick="location.href='<%=request.getContextPath()%>/main/main.jsp';">

   </div>
			<form name="search" action="../search/search.jsp" method="post">
   			 <div id = "search">
   					<input type="text" name = "searchtext" width="300">
    				<input type="submit" value = "검색">
    				<input type="checkbox" id = "detailchecked" name = "check" value = "detailchecked">  상세검색
    		 </div>
    		 <div id = "details">
   				 검색대상
   					<input type="radio" name="detailgroup" class="rg" checked="checked" value="title"> 도서명/상품명   
                 <input type="radio" name="detailgroup" class="rg" value="writer"> 저자/아티스트
                 <input type="radio" name="detailgroup" class="rg" value="publisher"> 출판사/제작사
        	</div>
        </form>
    </div> 
    </td>

   </tr>
   <tr>
      <td width="15%" valign="top">
   
       <form name="insert1" action="../search/sortESearch.jsp" method="post">
      <input type = "hidden" name = "e" value = "공학">
      <a href = "javascript:document.insert1.submit();"><img src = "../img/e.gif" width="130" height="50" border = "0"></a>
	</form>
	<form name="insert2" action="../search/sortFSearch.jsp" method="post">
      <input type = "hidden" name = "f" value = "소설">
      <a href = "javascript:document.insert2.submit();"><img src = "../img/f.gif" width="130" height="50" border = "0"></a>
		</form>
	<form name="insert3" action="../search/sortSSearch.jsp" method="post">
      <input type = "hidden" name = "s" value = "스포츠">
      <a href = "javascript:document.insert3.submit();"><img src = "../img/s.gif" width="130" height="50" border = "0"></a>
      </form>
	<form name="insert4" action="../search/sortHSearch.jsp" method="post">
      <input type = "hidden" name = "h" value = "인문">
      <a href = "javascript:document.insert4.submit();"><img src = "../img/h.gif" width="130" height="50" border = "0"></a>
      </form>
	<form name="insert5" action="../search/sortRSearch.jsp" method="post">
      <input type = "hidden" name = "r" value = "종교">
      <a href = "javascript:document.insert5.submit();"><img src = "../img/r.gif" width="130" height="50" border = "0"></a>
      </form>
   
      </td>
      <td width="85%">
	