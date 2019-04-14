package my.login;
import my.db.*;
import java.sql.*;
//�α��ο� �����ϸ� �ش�Ǵ� ����� ������ �α��� ���ȸ� ���������ش�
public class LoginOkBean {
	private String name;
	private String id;
	private String pw;
	private String ssn;
	private String phone;
	private String mail;
	private String addr;
	private String bonus;
	private ConnectionPoolBean pool;
	
	public void setId(String id){
		this.id = id;
	}
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}

	public void infoSetting() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from ȸ�� where ȸ��ID=?";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()){
				name = rs.getString(1);
				//id = rs.getString(2);
				pw = rs.getString(3);
				ssn = rs.getString(4);
				phone = rs.getString(5);
				mail = rs.getString(6);
				addr = rs.getString(7);
				bonus = rs.getString(8);
			}
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	public String getName() {
		return name;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getSsn() {
		return ssn;
	}
	public String getMail() {
		return mail;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddr() {
		return addr;
	}
	public String getBonus() {
		return bonus;
	}
	public ConnectionPoolBean getPool() {
		return pool;
	}
}








