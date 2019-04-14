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
	String name = new String(request.getParameter("name").getBytes("8859_1"),"UTF-8");
	String id = new String(request.getParameter("id").getBytes("8859_1"),"UTF-8");
	String pw = new String(request.getParameter("pw").getBytes("8859_1"),"UTF-8");
	String ssn = new String(request.getParameter("ssn").getBytes("8859_1"),"UTF-8");
	String phone = new String(request.getParameter("phone").getBytes("8859_1"),"UTF-8");
	String mail = new String(request.getParameter("mail").getBytes("8859_1"),"UTF-8");
	String addr = new String(request.getParameter("addr").getBytes("8859_1"),"UTF-8");
	String msg = null;
	String uri = null;
	
	if(name==null || id==null || pw ==null || ssn==null || phone==null || mail ==null || addr == null ||
			name.trim().equals("") || id.trim().equals("") || pw.trim().equals("") || 
			ssn.trim().equals("") || phone.trim().equals("") || mail.trim().equals("") || addr.trim().equals("")){%>
		<script type ="text/javascript">
			alert("모든 데이터를 입력하셔야 합니다.");
			history.back();
		</script>
<%		return;
	}
	Class.forName("org.gjt.mm.mysql.Driver");
	String url ="jdbc:mysql://127.0.0.1:3306/project";
	String user = "root";
	String pass = "yeji1123";
	Connection con = DriverManager.getConnection(url,user,pass);
	String sql ="insert into 회원 values(?,?,?,?,?,?,?,0)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, id);
	ps.setString(3, pw);
	ps.setString(4, ssn);
	ps.setString(5, phone);
	ps.setString(6, mail);
	ps.setString(7, addr);
	try{
	int n = ps.executeUpdate();
	
	if(n>0){
		msg="회원가입 성공!!";
		uri ="request.getContextPath()/main/main.jsp";
	}else{
		msg="회원가입 실패!! ";
		uri = "request.getContextPath()/student1/student.jsp";
	}
	}catch(SQLException e){
		msg="회원가입 실패!! ";
		uri = "request.getContextPath()/student1/student.jsp";
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