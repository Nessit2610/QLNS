package admindao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.DangKyLamBean;
import bean.NhanVienBean;
import bean.thongkecalambean;
import dao.ketnoiDB;

public class adminDangKyLamdao {
	public ArrayList<DangKyLamBean> GetDKLtheoma(String Manv ) throws Exception{
		ArrayList<DangKyLamBean> ds = new ArrayList<DangKyLamBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichLam where MaNV = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, Manv);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long MaDKLam = rs.getLong("MaDKLam");
			String MaNV = rs.getString("MaNV");
			String MaLoaiCa = rs.getString("MaLoaiCa");
			Date Duyet = rs.getDate("NgayDK");
			ds.add(new DangKyLamBean(MaDKLam, MaNV, MaLoaiCa, Duyet));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public ArrayList<DangKyLamBean> getDKLLTK(Date SDate , Date EDate) throws Exception{
		ArrayList<DangKyLamBean> ds = new ArrayList<DangKyLamBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "SELECT * FROM DangKyLichLam WHERE NgayDK BETWEEN ? AND ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd");
		String Sdate= dd.format(SDate);	// Doi ngay ra chuoi theo dd
		Date S= dd.parse(Sdate);
		String Edate= dd.format(EDate);
		Date E= dd.parse(Edate);
		cmd.setDate(1,new java.sql.Date(S.getTime()));
		cmd.setDate(2, new java.sql.Date(E.getTime()));
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long MaDKLam = rs.getLong("MaDKLam");
			String MaNV = rs.getString("MaNV");
			String MaLoaiCa = rs.getString("MaLoaiCa");
			Date Duyet = rs.getDate("NgayDK");
			ds.add(new DangKyLamBean(MaDKLam, MaNV, MaLoaiCa, Duyet));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public void ThemDKL(String maNV,String maLoaica, Date ngayDK) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="insert into DangKyLichLam(MaNV,MaLoaiCa,NgayDK) values(?,?,?) ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, maNV);
		cmd.setString(2, maLoaica);
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd"); 
		String tam= dd.format(ngayDK);
		Date n2= dd.parse(tam);
		cmd.setDate(3, new java.sql.Date(n2.getTime()));
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	public ArrayList<thongkecalambean> thongkecalam( int thang ,long nam) throws Exception{
		ArrayList<thongkecalambean> ds = new ArrayList<thongkecalambean>();
		NhanVienBean nvb = null;
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "SELECT MaNV, COUNT(*) AS total_shifts\r\n"
				+ "FROM DangKyLichLam\r\n"
				+ "WHERE MONTH(NgayDK) = ?\r\n"
				+ "AND YEAR(NgayDK) = ? \r\n"
				+ "GROUP BY MaNV;";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, thang);
		cmd.setLong(2, nam);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
			long SoCL = rs.getInt("total_shifts");
			ds.add(new thongkecalambean(MaNV,SoCL));
			}
		rs.close();
		kn.cn.close();
		
		return ds;
	}
}
