package admindao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.NhanVienBean;

public class adminThongTinNhanViendao {
	public ArrayList<NhanVienBean> getAllNV() throws Exception {
		ArrayList<NhanVienBean> ds = new ArrayList<NhanVienBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongTinNhanVien";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
		    String TenNV = rs.getString("TenNV");
			String MaCV = rs.getString("MaCV");
			java.sql.Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			java.sql.Date ngayVaoLam = rs.getDate("NgayVaoLam");
			java.sql.Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			ds.add( new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	
	public void ThemNhanVien(String maNV, String tenNV, String maCV, Date ngaySinh, Boolean gioiTinh, String email, String sDT, String dVCT, String chucDanh, String tenDangNhap, String matKhau, Boolean trangThaiCongViec) throws Exception {
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="insert into ThongTinNhanVien( MaNV,  TenNV,  MaCV,  NgaySinh,  GioiTinh,  Email,  SDT,  DVCT,  ChucDanh,  TenDangNhap,  MatKhau,  TrangThaiCongViec) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, maNV);
		cmd.setString(2, tenNV);
		cmd.setString(3, maCV);
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd"); 
		String tam= dd.format(ngaySinh);
		Date n2= dd.parse(tam);
		cmd.setDate(4, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(5, gioiTinh);
		cmd.setString(6, email);
		cmd.setString(7, sDT);
		cmd.setString(8, dVCT);
		cmd.setString(9, chucDanh);
		cmd.setString(10, tenDangNhap);
		cmd.setString(11, matKhau);
		cmd.setBoolean(12, trangThaiCongViec);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void UpdateNhanVien(String maNV, String tenNV, String maCV, Date ngaySinh, Boolean gioiTinh, String email, String sDT, String dVCT, String chucDanh, String tenDangNhap, String matKhau, Boolean trangThaiCongViec) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="UPDATE ThongTinNhanVien SET TenNV =?, MaCV =?, NgaySinh =?, GioiTinh =?, Email =?, SDT =?, DVCT =?, ChucDanh =?, TenDangNhap =?, MatKhau =?, TrangThaiCongViec =? where MaNV = ?  ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, tenNV);
		cmd.setString(2, maCV);
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd"); 
		String tam= dd.format(ngaySinh);
		Date n2= dd.parse(tam);
		cmd.setDate(3, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(4, gioiTinh);
		cmd.setString(5, email);
		cmd.setString(6, sDT);
		cmd.setString(7, dVCT);
		cmd.setString(8, chucDanh);
		cmd.setString(9, tenDangNhap);
		cmd.setString(10, matKhau);
		cmd.setBoolean(11, trangThaiCongViec);
		cmd.setString(12, maNV);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void DeleteNhanVien(String MaNV) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="DELETE FROM ThongTinNhanVien WHERE MaNV = ?;";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, MaNV);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		
	}
}
