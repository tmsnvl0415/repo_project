package my.login;
import my.db.*;
import java.sql.*;
//������������ �Ѿ�� ���̵�, ��й�ȣ�� DB�� ����� ���̵�, ��й�ȣ��
//���� ��ġ�ϴ��� ���θ� üũ�ϴ� ���� ������
public class LoginCheck {
	//��ȯ�� ���� ����� ����
	public static final int OK=1;			//id�� pwd�� ��ġ�ϴ� ���
	public static final int NOT_ID=2;		//id�� ���� ���
	public static final int NOT_PWD=3;	//id�� �ִµ� pwd�� ��ġ���� �ʴ� ���
	public static final int ERROR=-1;		//SQLException�� �߻��� ���
	
	//property�ϱ� ���� ��������
	private String id;
	private String pw;
	private ConnectionPoolBean pool;
	
	//����Ʈ�����ڸ� ���������.
	public LoginCheck(){}

	//property�ϱ� ���� setter, getter�޼ҵ带 ����
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
	
	//�����Ͻ� �޼ҵ带 �̿��Ͽ� ���� ��ȯ�� ����.
	public int memberCheck(){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select ��й�ȣ from ȸ�� where ȸ��ID=?";
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
			System.out.println("�����߻� : " + e.getMessage());
			return ERROR;
		}finally{
			if (rs != null) try{rs.close();}catch(SQLException e){}
			if (ps != null) try{ps.close();}catch(SQLException e){}
			if (con != null) try{pool.returnConnection(con);}catch(SQLException e){}
		}
	}
}











