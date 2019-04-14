package my.student;
import java.sql.*;
import java.util.*;
public class StudentDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public StudentDAO(){
		try{
			Class.forName("org.gjt.mm.mysql.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		url = "jdbc:mysql://127.0.0.1:3306/project";
		user = "root"; pass="yeji1123";
	}
	public int insertStudent(String id, String name, String cname)
																	throws SQLException {
		String sql = "insert into 회원 values(?,?,?)";
		try{				
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, cname);
			int result = ps.executeUpdate();
			return result;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public StudentDTO[] listStudent() throws SQLException{
		String sql = "select * from 회원";
		try{
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			StudentDTO[] stdto = makeArray(rs);
			return stdto;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public StudentDTO[] makeArray(ResultSet rs) throws SQLException {
		ArrayList al = new ArrayList();
		while(rs.next()){
			String id = rs.getString(1);
			String name = rs.getString(2);
			String cname = rs.getString(3);
			StudentDTO dto = new StudentDTO(id, name, cname);
			al.add(dto);
		}
		StudentDTO[] stdto = new StudentDTO[al.size()];
		al.toArray(stdto);
		return stdto;
	}
	public int deleteMember(String id) throws SQLException{
		String sql = "delete from 회원 where 회원ID=?";
		if(!(id=="root" || id.trim().equals("root"))){
		try{
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			int result = ps.executeUpdate();
			return result;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
		}
		else
			return 0;
	}
	public int deleteBook(String bName) throws SQLException{
		String sql = "delete from 책 where 책이름=?";
		try{
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, bName);
			int result = ps.executeUpdate();
			return result;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}













