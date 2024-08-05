package admindao;

import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import bean.DangKyNghiBean;
import bean.VDangKyNghiBean;
import dao.ketnoiDB;

public class adminDangKyNghiDao {
	
	ArrayList<DangKyNghiBean> ds = new ArrayList<DangKyNghiBean>();
	public ArrayList<VDangKyNghiBean> GetAllDKN() throws Exception{
		ArrayList<VDangKyNghiBean> ds = new ArrayList<VDangKyNghiBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from VDangKyLichNghi";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long maDkNghi = rs.getLong("MaDKNghi");
			String maNV = rs.getString("MaNV");
			String tenNV = rs.getString("tenNV");
			String maLoaiCa = rs.getString("MaLoaiCa");
			Date ngayDK = rs.getDate("NgayDK");
			int duyet = rs.getInt("Duyet");
			String nguoiDuyet = rs.getString("NguoiDuyet");
			String lyDo = rs.getString("LyDo");
			ds.add(new VDangKyNghiBean(maDkNghi, maNV,tenNV, maLoaiCa, ngayDK, duyet, nguoiDuyet, lyDo));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public void UpdateDangKyNghi(Long MaDKNghi, String NguoiDuyet) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="UPDATE DangKyLichnghi SET Duyet = 1, NguoiDuyet = ? where MaDKNghi = ?  ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, NguoiDuyet);
		cmd.setLong(2, MaDKNghi);
		cmd.executeUpdate();
		kn.cn.close();
	}
	
	public void UpdateTuChoiDangKyNghi(Long MaDKNghi, String NguoiDuyet) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="UPDATE DangKyLichnghi SET Duyet = 2, NguoiDuyet = ? where MaDKNghi = ?  ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, NguoiDuyet);
		cmd.setLong(2, MaDKNghi);
		cmd.executeUpdate();
		kn.cn.close();
	}
	
	public static void main(String[] args) {
		try {
			adminDangKyNghiDao ad = new adminDangKyNghiDao();
			ad.UpdateDangKyNghi(Long.parseLong("5"), "Nguyễn Tín");
			System.out.println("Da sua");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
