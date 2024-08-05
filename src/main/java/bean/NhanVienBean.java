package bean;

import java.sql.Date;

public class NhanVienBean {
	private String maNV;
	private String tenNV;
	private String maCV;
	private Date ngaySinh;
	private Boolean gioiTinh;
	private String email;
	private String sDT;
	private String dVCT;
	private String chucDanh;
	private String tenDangNhap;
	private String matKhau;
	private Boolean trangThaiCongViec;
	private String anh;
	private Date ngayVaoLam;
	private Date ngayKetThuc;
	private String soTaiKhoan;
	public NhanVienBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NhanVienBean(String maNV, String tenNV, String maCV, Date ngaySinh, Boolean gioiTinh, String email,
			String sDT, String dVCT, String chucDanh, String tenDangNhap, String matKhau, Boolean trangThaiCongViec,
			String anh, Date ngayVaoLam, Date ngayKetThuc, String soTaiKhoan) {
		super();
		this.maNV = maNV;
		this.tenNV = tenNV;
		this.maCV = maCV;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.email = email;
		this.sDT = sDT;
		this.dVCT = dVCT;
		this.chucDanh = chucDanh;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.trangThaiCongViec = trangThaiCongViec;
		this.anh = anh;
		this.ngayVaoLam = ngayVaoLam;
		this.ngayKetThuc = ngayKetThuc;
		this.soTaiKhoan = soTaiKhoan;
	}
	public String getMaNV() {
		return maNV;
	}
	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}
	public String getTenNV() {
		return tenNV;
	}
	public void setTenNV(String tenNV) {
		this.tenNV = tenNV;
	}
	public String getMaCV() {
		return maCV;
	}
	public void setMaCV(String maCV) {
		this.maCV = maCV;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public Boolean getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(Boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getsDT() {
		return sDT;
	}
	public void setsDT(String sDT) {
		this.sDT = sDT;
	}
	public String getdVCT() {
		return dVCT;
	}
	public void setdVCT(String dVCT) {
		this.dVCT = dVCT;
	}
	public String getChucDanh() {
		return chucDanh;
	}
	public void setChucDanh(String chucDanh) {
		this.chucDanh = chucDanh;
	}
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public Boolean getTrangThaiCongViec() {
		return trangThaiCongViec;
	}
	public void setTrangThaiCongViec(Boolean trangThaiCongViec) {
		this.trangThaiCongViec = trangThaiCongViec;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public Date getNgayVaoLam() {
		return ngayVaoLam;
	}
	public void setNgayVaoLam(Date ngayVaoLam) {
		this.ngayVaoLam = ngayVaoLam;
	}
	public Date getNgayKetThuc() {
		return ngayKetThuc;
	}
	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}
	public String getSoTaiKhoan() {
		return soTaiKhoan;
	}
	public void setSoTaiKhoan(String soTaiKhoan) {
		this.soTaiKhoan = soTaiKhoan;
	}
	@Override
	public String toString() {
		return "NhanVienBean [maNV=" + maNV + ", tenNV=" + tenNV + ", maCV=" + maCV + ", ngaySinh=" + ngaySinh
				+ ", gioiTinh=" + gioiTinh + ", email=" + email + ", sDT=" + sDT + ", dVCT=" + dVCT + ", chucDanh="
				+ chucDanh + ", tenDangNhap=" + tenDangNhap + ", matKhau=" + matKhau + ", trangThaiCongViec="
				+ trangThaiCongViec + ", anh=" + anh + ", ngayVaoLam=" + ngayVaoLam + ", ngayKetThuc=" + ngayKetThuc
				+ ", soTaiKhoan=" + soTaiKhoan + "]";
	}
	
}
