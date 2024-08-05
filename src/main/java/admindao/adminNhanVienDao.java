package admindao;

import java.lang.reflect.Array;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.NhanVienBean;
import controller.main;
import dao.ketnoiDB;

public class adminNhanVienDao {
	public ArrayList<NhanVienBean> getnhanvien() throws Exception{
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
			Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			Date ngayVaoLam = rs.getDate("NgayVaoLam");
			Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			ds.add( new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public void BTW(String maNV) throws Exception {
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql= "UPDATE ThongTinNhanVien SET NgayKetThuc = NULL WHERE MaNV=?";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, maNV);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void UpdateNhanVien(String maNV, String tenNV, String maCV, Date ngaySinh, Boolean gioiTinh, String email, String sDT, String dVCT, String chucDanh, String tenDangNhap, String matKhau, Boolean trangThaiCongViec, Date ngayVaoLam, String soTaiKhoan) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="UPDATE ThongTinNhanVien SET TenNV =?, MaCV =?, NgaySinh =?, GioiTinh =?, Email =?, SDT =?, DVCT =?, ChucDanh =?, TenDangNhap =?, MatKhau =?, TrangThaiCongViec =?, NgayVaoLam =?, SoTaiKhoanNhanVien =? where MaNV = ?  ";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, tenNV);
		cmd.setString(2, maCV);
		cmd.setDate(3, ngaySinh);
		cmd.setBoolean(4, gioiTinh);
		cmd.setString(5, email);
		cmd.setString(6, sDT);
		cmd.setString(7, dVCT);
		cmd.setString(8, chucDanh);
		cmd.setString(9, tenDangNhap);
		cmd.setString(10, matKhau);
		cmd.setBoolean(11, trangThaiCongViec);
		cmd.setDate(12, ngayVaoLam);
		cmd.setString(13, soTaiKhoan);
		cmd.setString(14, maNV);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	
	public void UpdateNgayKetThuc(String MaNV) throws Exception {
		admindao.ketnoiDB kn= new admindao.ketnoiDB();
		kn.ketnoi();
        String sql = "UPDATE ThongTinNhanVien SET NgayKetThuc = GETDATE() WHERE MaNV = ? AND TrangThaiCongViec = 0"; // Chỉ cập nhật khi trạng thái công việc là true

        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(1, MaNV); 
        cmd.executeUpdate();

        cmd.close();
        kn.cn.close();
	}
	public NhanVienBean getnhanvientheoma(String manv) throws Exception{
		NhanVienBean nvb = new NhanVienBean();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongTinNhanVien where MaNV = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, manv);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
		    String TenNV = rs.getString("TenNV");
			String MaCV = rs.getString("MaCV");
			Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			Date ngayVaoLam = rs.getDate("NgayVaoLam");
			Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			nvb =  new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan);
		}
		rs.close();
		kn.cn.close();
		
		return nvb;
	}
	public ArrayList<NhanVienBean> getnhanvienTK(String key) throws Exception{
		ArrayList<NhanVienBean> ds = new ArrayList<NhanVienBean>();
		NhanVienBean nvb = new NhanVienBean();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongTinNhanVien where MaNV = ? or TenNV LIKE ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, key);
		cmd.setString(2, "%" + key + "%");
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
		    String TenNV = rs.getString("TenNV");
			String MaCV = rs.getString("MaCV");
			Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			Date ngayVaoLam = rs.getDate("NgayVaoLam");
			Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			ds.add(new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan));
		}
		rs.close();
		kn.cn.close();
		
		return ds;
	}
	public NhanVienBean getNhanVienTheoTKvaMK( String tendangnhap,String matkhau) throws Exception{
		NhanVienBean nvb = null;
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongTinNhanVien where TenDangNhap = ? and MatKhau = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendangnhap);
		cmd.setString(2, matkhau);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String MaNV = rs.getString("MaNV");
		    String TenNV = rs.getString("TenNV");
			String MaCV = rs.getString("MaCV");
			Date NgaySinh = rs.getDate("NgaySinh");
			Boolean GioiTinh = rs.getBoolean("GioiTinh");
			String Email = rs.getString("Email");
			String SDT = rs.getString("SDT");
			String DVCT = rs.getString("DVCT");
			String ChucDanh = rs.getString("ChucDanh");
			String TenDangNhap = rs.getString("TenDangNhap");
			String MatKhau = rs.getString("MatKhau");
			Boolean TrangThai = rs.getBoolean("TrangThaiCongViec");
			String anh = rs.getString("Anh");
			Date ngayVaoLam = rs.getDate("NgayVaoLam");
			Date ngayKetThuc = rs.getDate("NgayKetThuc");
			String soTaiKhoan = rs.getString("SoTaiKhoanNhanVien");
			nvb =  new NhanVienBean(MaNV, TenNV, MaCV, NgaySinh, GioiTinh, Email, SDT, DVCT, ChucDanh, TenDangNhap, MatKhau, TrangThai, anh, ngayVaoLam, ngayKetThuc, soTaiKhoan);
		}
		rs.close();
		kn.cn.close();
		
		return nvb;
	}
	public void ThemNhanVien_QL(String tenNV, String maCV, java.util.Date ngaySinh, Boolean gioiTinh, String email, String sDT, String tenDangNhap, String matKhau,
			String anh, String soTaiKhoan) throws Exception {
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="declare @newMaNV int, @newMaNV_Str nvarchar(10)\r\n"
				+ "select @newMaNV = max(CAST(SUBSTRING(MaNV, 3,LEN(MaNV) - 2) as int)) + 1 from ThongTinNhanVien\r\n"
				+ "if @newMaNV < 100 set @newMaNV_Str = '0'+ cast(@newMaNV as nvarchar(10))\r\n"
				+ "else set @newMaNV_Str = CAST(@newMaNV as nvarchar(10))\r\n"
				+ "insert into ThongTinNhanVien(MaNV,TenNV,MaCV,NgaySinh,GioiTinh,Email,SDT,DVCT,ChucDanh,TenDangNhap, MatKhau, TrangThaiCongViec, Anh, NgayVaoLam, NgayKetThuc, SoTaiKhoanNhanVien)\r\n"
				+ "values ('NV'+ cast(@newMaNV_Str as nvarchar(10)),?,?,?,?,?,?,'Team Design','Teammate',?,?,'True',?,GETDATE(),null,?)";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, tenNV);
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd"); 
		String tam= dd.format(ngaySinh);
		java.util.Date n2= dd.parse(tam);
		cmd.setString(2, maCV);
		cmd.setDate(3, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(4, gioiTinh);
		cmd.setString(5, email);
		cmd.setString(6, sDT);
		cmd.setString(7, tenDangNhap);
		cmd.setString(8, matKhau);
		cmd.setString(9, anh);
		cmd.setString(10, soTaiKhoan);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
}

