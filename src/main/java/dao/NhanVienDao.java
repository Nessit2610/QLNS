package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.NhanVienBean;


public class NhanVienDao {
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
	public void updateNV(NhanVienBean nhanVien) throws Exception{
		ketnoiDB kn = new ketnoiDB();
	    kn.ketnoi();
	    
	    String sql = "UPDATE ThongTinNhanVien SET TenNV=?, MaCV=?, NgaySinh=?, GioiTinh=?, Email=?, SDT=?, DVCT=?, ChucDanh=?,MatKhau=? ,TrangThaiCongViec=?, Anh=?, NgayVaoLam=?, NgayKetThuc=?, SoTaiKhoanNhanVien=? WHERE MaNV=?";
	    
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    
	    cmd.setString(1, nhanVien.getTenNV());
	    cmd.setString(2, nhanVien.getMaCV());
	    cmd.setDate(3, nhanVien.getNgaySinh());
	    cmd.setBoolean(4, nhanVien.getGioiTinh());
	    cmd.setString(5, nhanVien.getEmail());
	    cmd.setString(6, nhanVien.getsDT());
	    cmd.setString(7, nhanVien.getdVCT());
	    cmd.setString(8, nhanVien.getChucDanh());
	    cmd.setString(9, nhanVien.getMatKhau());
	    cmd.setBoolean(10, nhanVien.getTrangThaiCongViec());
	    cmd.setString(11, nhanVien.getAnh());
	    cmd.setDate(12, nhanVien.getNgayVaoLam());
	    cmd.setDate(13, nhanVien.getNgayKetThuc());
	    cmd.setString(14, nhanVien.getSoTaiKhoan());
	    cmd.setString(15, nhanVien.getMaNV());
	   
	    cmd.executeUpdate();
	    
	    kn.cn.close();
	}
	public void ThemNhanVien_QL(String tenNV, java.util.Date ngaySinh, Boolean gioiTinh, String email, String sDT, String tenDangNhap, String matKhau,
			String anh, String soTaiKhoan) throws Exception {
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="declare @newMaNV int, @newMaNV_Str nvarchar(10)\r\n"
				+ "select @newMaNV = max(CAST(SUBSTRING(MaNV, 3,LEN(MaNV) - 2) as int)) + 1 from ThongTinNhanVien\r\n"
				+ "if @newMaNV < 100 set @newMaNV_Str = '0'+ cast(@newMaNV as nvarchar(10))\r\n"
				+ "else set @newMaNV_Str = CAST(@newMaNV as nvarchar(10))\r\n"
				+ "insert into ThongTinNhanVien(MaNV,TenNV,MaCV,NgaySinh,GioiTinh,Email,SDT,DVCT,ChucDanh,TenDangNhap, MatKhau, TrangThaiCongViec, Anh, NgayVaoLam, NgayKetThuc, SoTaiKhoanNhanVien)\r\n"
				+ "values ('NV'+ cast(@newMaNV_Str as nvarchar(10)),?,'CV003',?,?,?,?,'Team Design','Teammate',?,?,'True',?,GETDATE(),null,?)";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, tenNV);
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd"); 
		String tam= dd.format(ngaySinh);
		java.util.Date n2= dd.parse(tam);
		cmd.setDate(2, new java.sql.Date(n2.getTime()));
		cmd.setBoolean(3, gioiTinh);
		cmd.setString(4, email);
		cmd.setString(5, sDT);
		cmd.setString(6, tenDangNhap);
		cmd.setString(7, matKhau);
		cmd.setString(8, anh);
		cmd.setString(9, soTaiKhoan);
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	public void UpdateTTCV(String MaNV, String TrangThaiCongViec) throws Exception {
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
        String sql = "UPDATE ThongTinNhanVien SET NgayKetThuc = GETDATE(), TrangThaiCongViec = ?  WHERE MaNV = ?"; // Chỉ cập nhật khi trạng thái công việc là true

        PreparedStatement cmd = kn.cn.prepareStatement(sql);
        cmd.setString(2, MaNV); 
        cmd.setString(1, TrangThaiCongViec);
        cmd.executeUpdate();
        
        System.out.println("Đã đuổi việc");
        cmd.close();
        kn.cn.close();
	}
	public static void main(String[] args) {
		try {
			NhanVienDao nvdao = new NhanVienDao();
			nvdao.UpdateTTCV("NV001", "0");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
