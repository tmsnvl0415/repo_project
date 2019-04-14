package my.login;
import my.db.*;
import java.sql.*;
//엡브라우저에서 넘어온 아이디, 비밀번호와 DB에 저장된 아이디, 비밀번호가
//서로 일치하는지 여부를 체크하는 빈을 만들자
public class LoginCheck {
	//반환될 값을 상수로 선언
	public static final int OK=1;			//id와 pwd가 일치하는 경우
	public static final int NOT_ID=2;		//id가 없는 경우
	public static final int NOT_PWD=3;	//id는 있는데 pwd가 일치하지 않는 경우
	public static final int ERROR=-1;		//SQLException이 발생한 경우
	
	//property하기 위한 변수선언
	private String id;
	private String pw;
	private ConnectionPoolBean pool;
	
	//디폴트생성자를 명시해주자.
	public LoginCheck(){}

	//property하기 위해 setter, getter메소드를 설정
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPwd(String pw) {
		this.pw = pw;
	}
	public ConnectionPoolBean getPool() {
		return pool;
	}
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	//비지니스 메소드를 이용하여 값을 반환해 주자.
	public int memberCheck(){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select 비밀번호 from 회원 where 회원ID=?";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			boolean isId = rs.next();
			if (!isId) return NOT_ID;
			String dbPw = rs.getString(1);
			if (dbPw.equals(pw)){
				return OK;
			}else {
				return NOT_PWD;
			}
		}catch(SQLException e){
			System.out.println("오류발생 : " + e.getMessage());
			return ERROR;
		}finally{
			if (rs != null) try{rs.close();}catch(SQLException e){}
			if (ps != null) try{ps.close();}catch(SQLException e){}
			if (con != null) try{pool.returnConnection(con);}catch(SQLException e){}
		}
	}
}











