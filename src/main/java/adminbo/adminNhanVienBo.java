package adminbo;

import java.sql.Date;
import java.util.ArrayList;

import admindao.adminNhanVienDao;
import bean.NhanVienBean;

public class adminNhanVienBo {
	ArrayList<NhanVienBean>ds;
	adminNhanVienDao adnvdao = new adminNhanVienDao();
	public ArrayList<NhanVienBean> getnhanvien() throws Exception{
		return adnvdao.getnhanvien();
	}
	public ArrayList<NhanVienBean> getnhanvienTK(String manv) throws Exception{
		return adnvdao.getnhanvienTK(manv);
	}
	public NhanVienBean getnhanvientheoma(String manv) throws Exception{
		return adnvdao.getnhanvientheoma(manv);
	}
	public void UpdateNhanVien(String maNV, String tenNV, String maCV, Date ngaySinh, Boolean gioiTinh, String email, String sDT, String dVCT, String chucDanh, String tenDangNhap, String matKhau, Boolean trangThaiCongViec, Date ngayVaoLam, String soTaiKhoan) throws Exception{
		adnvdao.UpdateNhanVien(maNV, tenNV, maCV, ngaySinh, gioiTinh, email, sDT, dVCT, chucDanh, tenDangNhap, matKhau, trangThaiCongViec,  ngayVaoLam, soTaiKhoan);
	}
	public void UpdateNgayKetThuc(String MaNV) throws Exception {
		adnvdao.UpdateNgayKetThuc(MaNV);
	}
	public void BTW(String maNV) throws Exception {
		adnvdao.BTW(maNV);
	}
	public void ThemNhanVien_QL(String tenNV, String maCV, java.util.Date ngaySinh, Boolean gioiTinh, String email, String sDT, String tenDangNhap, String matKhau,
			String anh, String soTaiKhoan) throws Exception {
		adnvdao.ThemNhanVien_QL(tenNV, maCV, ngaySinh, gioiTinh, email, sDT, tenDangNhap, matKhau, anh, soTaiKhoan);
	}
}