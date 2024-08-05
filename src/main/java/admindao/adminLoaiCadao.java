package admindao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.LoaiCaBean;

public class adminLoaiCadao {
	public ArrayList<LoaiCaBean> GetAllLC() throws Exception{
		ArrayList<LoaiCaBean> ds = new ArrayList<LoaiCaBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from LoaiCa";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaLoaiCa = rs.getString("MaLoaiCa");
			String TenLoaiCa = rs.getString("TenLoaiCa");
			ds.add(new LoaiCaBean(MaLoaiCa, TenLoaiCa));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public void ThemLoaiCa(String MaLoaiCa, String TenLoaiCa) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="insert into LoaiCa(MaLoaiCa,TenLoaiCa) values(?,?) ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, MaLoaiCa);
		cmd.setString(2, TenLoaiCa);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void updateLoaiCa(String MaLoaiCa, String TenLoaiCa) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="UPDATE LoaiCa SET TenLoaiCa =? where MaLoaiCa = ?  ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, TenLoaiCa);
		cmd.setString(2, MaLoaiCa);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void DeleteLoaiCa(String MaLoaiCa) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="DELETE FROM LoaiCa WHERE MaLoaiCa = ?;";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, MaLoaiCa);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
}
