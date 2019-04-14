<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%  String Id = (String)session.getAttribute("id");
	String Name2 = (String)session.getAttribute("name");
	String nonmembercatch = null;
	
	
	Class.forName("org.gjt.mm.mysql.Driver");
	String url ="jdbc:mysql://127.0.0.1:3306/project";
	String user = "root";
	String pass = "yeji1123";
	Connection con = DriverManager.getConnection(url,user,pass);
	
	
	
	String mileage = null;
	boolean isLogin2 = false;
	if(Id==null || Name2 ==null){
		isLogin2=false;
	}else{
		isLogin2=true;
	} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제창</title>
<script type="text/javascript">
	if(<%=!isLogin2%>&&(<%=nonmembercatch%>==null))
	{
		location.href="../login/login.jsp";
	}
	<%
	if(isLogin2 && (nonmembercatch==null)){
	
	
	String sql = "select 마일리지 from 회원 where 회원ID=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = null;
	ps.setString(1, Id);
	rs = ps.executeQuery();
	rs.next();
	mileage = rs.getString(1);
	
	}
	if(!isLogin2 && (nonmembercatch!=null)){
		String beName = request.getParameter("name");
		beName = new String(beName.getBytes("ISO-8859-1"), "UTF-8");
		String beSsn = request.getParameter("ssn");
		String bePhone = request.getParameter("phone");
		String beMail = request.getParameter("mail");
		beMail = new String(beMail.getBytes("ISO-8859-1"), "UTF-8");
		String beAddr = request.getParameter("addr");
		beAddr = new String(beAddr.getBytes("ISO-8859-1"), "UTF-8");
		nonmembercatch = request.getParameter("nonmembergo");
		String sql2 = "insert into 비회원 values(?,?,?,?,?)";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setString(1, beName);
		ps2.setString(2, beSsn);
		ps2.setString(3, bePhone);
		ps2.setString(4, beMail);
		ps2.setString(5, beAddr);
		int n2 = ps2.executeUpdate();
	}

	String bname = request.getParameter("bname");
	bname = new String(bname.getBytes("ISO-8859-1"), "UTF-8");
	String price = request.getParameter("pricesend");
%>
function isNumberKey(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode;

    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))

        return false;

    return true;

}
function confirmation(){
   alert("데이터 받아오기 성공!!");

}

function setSelectedValue(value){

}
</script>
</head>
<body>
<div align = 'center'>
<form name="insert" action="buyconfirm.jsp" method="post">
<table border = "1" width = "400" height = "500">
<tr height = "30%">
<td>
<p>무통장 입금 안내</p>
<img src = "../img/notice.JPG"></img>
</td>
</tr>
<tr height = "10%">
<td>
<a>은행 선택</a>
<select name = "bankselect" onClick = "setSelectedValue(this.value);">
<option>입금하실 은행을 선택하세요.</option>
<option>기업은행</option>
<option>국민은행</option>
<option>외환은행</option>
<option>농협</option>
<option>우리은행</option>
<option>제일은행</option>
<option>신한은행</option>
<option>우체국</option>
<option>하나은행</option>
</select><p></p>
<a>책이름 : </a>
<label><%=bname%></label><p></p>
<input type = "hidden" name = "bookName" value = "<%=bname%>">
<a>책가격 :</a>
<label><%=price%></label><p></p>

<%
if(nonmembercatch == null)
{%>
	<a>사용 가능 마일리지 :</a>
	<label><%=mileage%></label><p></p>
	<input type="hidden" name = "mileagecalculate" value = "<%=mileage%>">
<%}
%>
<a>입금자 :</a>
<input type = "text" name = "user"/><p></p>
<a>입금금액 :</a>
<input type = "text" name = "money" onkeypress="return isNumberKey(event)"><p></p>
<%
if(nonmembercatch == null)
{%>
<a>사용할 마일리지 :</a>
<input type = "text" name = "usemileage" onkeypress="return isNumberKey(event)"><p></p>
<%}
%>
</td>
</tr>
<tr>
<td>
<p><img src = "../img/buynotice.JPG"/></p>
<input type = "checkbox" name = "OK"/>동의합니다<p></p>
<input type="hidden" name = "pricecalculate" value = "<%=price%>">
<input type="hidden" name = "isNonmember" value = "<%=nonmembercatch%>">
<a href = "javascript:document.insert.submit();"><img src = "../img/buy.JPG" border = "0"></a>
</td>
</tr>

</table>

</form>
</div>
</body>
</html>