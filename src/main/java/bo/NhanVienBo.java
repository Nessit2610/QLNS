package bo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import bean.NhanVienBean;
import dao.NhanVienDao;
import dao.ketnoiDB;


public class NhanVienBo {
	ArrayList<NhanVienBean> ds;
	NhanVienDao nvd = new NhanVienDao();
	public ArrayList<NhanVienBean> getnhanvien() throws Exception{
		ds = nvd.getnhanvien();
		return ds;
	}
	public NhanVienBean getnhanvientheoma(String manv) throws Exception{
		return nvd.getnhanvientheoma(manv);
	}
	public NhanVienBean getNhanVienTheoTKvaMK( String tendangnhap,String matkhau) throws Exception{
		return nvd.getNhanVienTheoTKvaMK(tendangnhap,matkhau);
	}
	public void updateNV(NhanVienBean nhanvien) throws Exception{
		nvd.updateNV(nhanvien);
	}
	public void ThemNhanVien_QL(String tenNV, java.util.Date ngaySinh, Boolean gioiTinh, String email, String sDT, String tenDangNhap, String matKhau,
			String anh, String soTaiKhoan) throws Exception {
		nvd.ThemNhanVien_QL(tenNV, ngaySinh, gioiTinh, email, sDT, tenDangNhap, matKhau, anh, soTaiKhoan);
	}
	public void UpdateTTCV(String MaNV, String TrangThaiCongViec) throws Exception {
		nvd.UpdateTTCV(MaNV, TrangThaiCongViec);
	}
}
