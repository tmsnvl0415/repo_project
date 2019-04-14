<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!--  
	1. 넘어온 데이터를 받아오기 
	2. 받아온 데이터의 유효성 체크하기
	3. DB의 드라이버 검색
	4. DB와 연결하기
	5. 쿼리를 전송하기(동적쿼리로 한다)
	6. 전송된 결과 받아오기
	7. 받아온 결과 알려주기
	8. DB와 연결된 객체 닫아주기
-->
<% 
	String bName = new String(request.getParameter("bName").getBytes("8859_1"),"UTF-8");
	String author = new String(request.getParameter("author").getBytes("8859_1"),"UTF-8");
	String company = new String(request.getParameter("company").getBytes("8859_1"),"UTF-8");
	String price = request.getParameter("price");
	String date = new String(request.getParameter("date").getBytes("8859_1"),"UTF-8");
	String sort = new String(request.getParameter("sort").getBytes("8859_1"),"UTF-8");
	
	String msg = null;
	String uri = null;
	
	if(bName==null || author==null || company ==null || price==null || date==null || sort ==null ||
			bName.trim().equals("") || author.trim().equals("") || company.trim().equals("") || 
			price.trim().equals("") || date.trim().equals("") || sort.trim().equals("")){%>
		<script type ="text/javascript">
			alert("모든 데이타를 입력하셔야 합니다.");
			history.back();
		</script>
<%		return;
	}
	Class.forName("org.gjt.mm.mysql.Driver");
	String url ="jdbc:mysql://127.0.0.1:3306/project";
	String user = "root";
	String pass = "yeji1123";
	Connection con = DriverManager.getConnection(url,user,pass);
	String sql ="insert into 책 values(?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, bName);
	ps.setString(2, author);
	ps.setString(3, company);
	ps.setString(4, price);
	ps.setString(5, date);
	ps.setString(6, sort);
	try{
	int n = ps.executeUpdate();
	
	if(n>0){
		msg="도서추가 성공!!";
		uri ="bookList.jsp";
	}else{
		msg="도서추가 실패!! ";
		uri = "bookList.jsp";
	}
	}catch(SQLException e){
		msg="도서추가 실패!! ";
		uri = "bookList.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=uri%>";
	window.close();
</script>
<%
	ps.close();
	con.close();
%>