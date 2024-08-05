package bean;

import java.util.Date;

public class TKeLuongBean {
	private Long MaThongKe;
	private String MaNV;
	private Date ThangNam;
	private int SoCaLam;
	private int TongSoCaNghi;
	private int SoCaNghiKhongPhep;
	private float Luong;
	public TKeLuongBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TKeLuongBean(Long maThongKe, String maNV, Date thangNam, int soCaLam, int tongSoCaNghi,
			int soCaNghiKhongPhep, float luong) {
		super();
		MaThongKe = maThongKe;
		MaNV = maNV;
		ThangNam = thangNam;
		SoCaLam = soCaLam;
		TongSoCaNghi = tongSoCaNghi;
		SoCaNghiKhongPhep = soCaNghiKhongPhep;
		Luong = luong;
	}
	public TKeLuongBean(String maNV, Date thangNam, int soCaLam, int tongSoCaNghi, int soCaNghiKhongPhep, float luong) {
		super();
		MaNV = maNV;
		ThangNam = thangNam;
		SoCaLam = soCaLam;
		TongSoCaNghi = tongSoCaNghi;
		SoCaNghiKhongPhep = soCaNghiKhongPhep;
		Luong = luong;
	}
	public TKeLuongBean(String maNV, int soCaLam, int tongSoCaNghi, int soCaNghiKhongPhep) {
		super();
		MaNV = maNV;
		SoCaLam = soCaLam;
		TongSoCaNghi = tongSoCaNghi;
		SoCaNghiKhongPhep = soCaNghiKhongPhep;
	}
	public TKeLuongBean(String maNV, int soCaLam, int tongSoCaNghi, int soCaNghiKhongPhep, float luong) {
		super();
		MaNV = maNV;
		SoCaLam = soCaLam;
		TongSoCaNghi = tongSoCaNghi;
		SoCaNghiKhongPhep = soCaNghiKhongPhep;
		Luong = luong;
	}
	
	public TKeLuongBean(String maNV, Date thangNam, int soCaLam, int tongSoCaNghi, int soCaNghiKhongPhep) {
		super();
		MaNV = maNV;
		ThangNam = thangNam;
		SoCaLam = soCaLam;
		TongSoCaNghi = tongSoCaNghi;
		SoCaNghiKhongPhep = soCaNghiKhongPhep;
	}
	public Long getMaThongKe() {
		return MaThongKe;
	}
	public void setMaThongKe(Long maThongKe) {
		MaThongKe = maThongKe;
	}
	public String getMaNV() {
		return MaNV;
	}
	public void setMaNV(String maNV) {
		MaNV = maNV;
	}
	public Date getThangNam() {
		return ThangNam;
	}
	public void setThangNam(Date thangNam) {
		ThangNam = thangNam;
	}
	public int getSoCaLam() {
		return SoCaLam;
	}
	public void setSoCaLam(int soCaLam) {
		SoCaLam = soCaLam;
	}
	public int getTongSoCaNghi() {
		return TongSoCaNghi;
	}
	public void setTongSoCaNghi(int tongSoCaNghi) {
		TongSoCaNghi = tongSoCaNghi;
	}
	public int getSoCaNghiKhongPhep() {
		return SoCaNghiKhongPhep;
	}
	public void setSoCaNghiKhongPhep(int soCaNghiKhongPhep) {
		SoCaNghiKhongPhep = soCaNghiKhongPhep;
	}
	public float getLuong() {
		return Luong;
	}
	public void setLuong(float luong) {
		Luong = luong;
	}
	@Override
	public String toString() {
		return "TKeLuongBean [MaThongKe=" + MaThongKe + ", MaNV=" + MaNV + ", ThangNam=" + ThangNam + ", SoCaLam="
				+ SoCaLam + ", TongSoCaNghi=" + TongSoCaNghi + ", SoCaNghiKhongPhep=" + SoCaNghiKhongPhep + ", Luong="
				+ Luong + "]";
	}
	
}
