package admindao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.ThongKeLuongBean;


public class adminThongKeLuongdao {
	public ArrayList<ThongKeLuongBean> getAllThongKeLuong() throws Exception{
		ArrayList<ThongKeLuongBean> ds = new ArrayList<ThongKeLuongBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongKeLuong";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long MaThongKe = rs.getLong("MaThongKe");
			String MaNV = rs.getString("MaNV");
			Date ThangNam = rs.getDate("ThangNam");
			int SoCaLam = rs.getInt("SoCaLam");
			int SoCaNghi = rs.getInt("SoCaNghi");
			float Luong = rs.getFloat("Luong");
			ds.add(new ThongKeLuongBean(MaThongKe, MaNV, ThangNam, SoCaLam, SoCaNghi, Luong));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public ArrayList<ThongKeLuongBean> getTKLthang(int thang, long nam) throws Exception{
		ArrayList<ThongKeLuongBean> ds = new ArrayList<ThongKeLuongBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongKeLuong WHERE MONTH(ThangNam) = ? AND YEAR(ThangNam) = ? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, thang);
		cmd.setLong(2, nam);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long MaThongKe = rs.getLong("MaThongKe");
			String MaNV = rs.getString("MaNV");
			Date ThangNam = rs.getDate("ThangNam");
			int SoCaLam = rs.getInt("SoCaLam");
			int SoCaNghi = rs.getInt("SoCaNghi");
			float Luong = rs.getFloat("Luong");
			ds.add(new ThongKeLuongBean(MaThongKe, MaNV, ThangNam, SoCaLam, SoCaNghi, Luong));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public void ThemThongKeLuong(String maNV, Date thangNam, int soCaLam, int soCaNghi, float luong) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="insert into ThongKeLuong(MaNV,ThangNam,SoCaLam,SoCaNghi,Luong) values(?,?,?,?,?) ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, maNV);
		cmd.setDate(2, thangNam);
		cmd.setInt(3, soCaLam);
		cmd.setInt(4, soCaNghi);
		cmd.setFloat(5, luong);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void updateThongKeLuong(String maNV, Date thangNam, int soCaLam, int soCaNghi, float luong) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="UPDATE ThongKeLuong SET ThangNam =?, SoCaLam =?, SoCaNghi =?, Luong =? where MaNV = ?  ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setDate(1, thangNam);
		cmd.setInt(2, soCaLam);
		cmd.setInt(3, soCaNghi);
		cmd.setFloat(4, luong);
		cmd.setString(5, maNV);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void DeleteThongKeLuong(String MaNV) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="DELETE FROM ThongKeLuong WHERE MaNV = ?;";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, MaNV);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
}
