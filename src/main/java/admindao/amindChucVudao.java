package admindao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ChucVuBean;

public class amindChucVudao {
	public ArrayList<ChucVuBean> getAllCV() throws Exception{
		ArrayList<ChucVuBean> ds = new ArrayList<ChucVuBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ChucVu";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaCV = rs.getString("MaCV");
			String TenCV = rs.getString("TenCV");
			ds.add(new ChucVuBean(MaCV, TenCV));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public void ThemChucVu(String macv, String tencv) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="insert into ChucVu(MaCV,TenCV) values(?,?) ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, macv);
		cmd.setString(2, tencv);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	public void updateChucVu(String macv, String tencv) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="UPDATE ChucVu SET TenCV =? where MaCV = ?  ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, tencv);
		cmd.setString(2, macv);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		
	}
	public void DeleteChucVu(String macv) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="DELETE FROM ChucVu WHERE MaCV = ?;";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, macv);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		
	}
}
