<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.login.*"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Locale" %>
<jsp:useBean id="check" class="my.login.LoginCheck" scope="session"/>
<jsp:setProperty property="*" name="check"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="check" value="<%=pool%>"/>
<jsp:useBean id="loginOk" class="my.login.LoginOkBean" scope="session"/>
<jsp:setProperty property="pool" name="loginOk" value="<%=pool%>"/>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String bank = request.getParameter("bankselect");
	bank = new String(bank.getBytes("ISO-8859-1"), "UTF-8");
	String conuser = request.getParameter("user");
	conuser = new String(conuser.getBytes("ISO-8859-1"), "UTF-8");
	String money = request.getParameter("money");
	String checked = request.getParameter("OK");
	String loginID = loginOk.getId();
	String useMileage = request.getParameter("usemileage");
	String bookName2 = request.getParameter("bookName");
	bookName2 = new String(bookName2.getBytes("ISO-8859-1"), "UTF-8");
	int n2 = 0;
	if(bank==null || conuser==null || money ==null ||
			bank.trim().equals("") || conuser.trim().equals("") || money.trim().equals(""))
	{%>
		<script type ="text/javascript">
			alert("모든 데이터를 입력하셔야 합니다.");
			history.back();
		</script>
<% 		return;
	}
	if(checked == null)
	{%>
		<script type ="text/javascript">
			alert("동의합니다에 체크해주시기 바랍니다.");
			history.back();
		</script>
		
<%		return;
	}
	
	Class.forName("org.gjt.mm.mysql.Driver");
	String url ="jdbc:mysql://127.0.0.1:3306/project";
	String user = "root";
	String pass = "yeji1123";
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	Date date = new Date();
	int mDate = Integer.parseInt(mSimpleDateFormat.format(date));

	Connection con = DriverManager.getConnection(url,user,pass);
	String sql ="insert into 구입내역 values(?,?,?,?,?,?)";
	double mon = Double.parseDouble(money);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, bank);
	ps.setString(2, conuser);
	ps.setDouble(3, mon);
	ps.setInt(4, mDate);
	ps.setString(5, loginID);
	ps.setString(6, bookName2);
	int n = ps.executeUpdate();
	String sql4 = "delete from 책 where 책이름=?";
	PreparedStatement ps4 = con.prepareStatement(sql4);
	ps4.setString(1, bookName2);
	int n4 = ps4.executeUpdate();
	if(loginOk.getName() != null)
	{
	String sql2 = "update 회원 set 마일리지=마일리지+? where 회원ID=?;";
	PreparedStatement ps2 = con.prepareStatement(sql2);
	ps2 = con.prepareStatement(sql2);
	ps2.setDouble(1, mon*0.05);
	ps2.setString(2, loginID);
	n2 = ps2.executeUpdate();
	double usemil = Double.parseDouble(useMileage);
	String sql3 = "update 회원 set 마일리지=마일리지-? where 회원ID=?";
	PreparedStatement ps3 = con.prepareStatement(sql3);
	ps3.setDouble(1, usemil);
	ps3.setString(2, loginID);
	int n3 = ps3.executeUpdate();
	}
	String msg = null;
	String uri = "../main/top.jsp";
	if(n>0 && n2>0){
		msg="결제 성공!! 회원 마일리지 5% 적립되었습니다.";
	}
	
	else if(n>0 && n2<=0){
		msg="결제 성공!!";
	}
	else
	{
		msg = "결제 실패!!";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=uri%>";
</script>
<%
	ps.close();
	con.close();
%>