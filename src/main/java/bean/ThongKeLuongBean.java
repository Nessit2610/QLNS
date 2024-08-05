package bean;

import java.util.Date;

public class ThongKeLuongBean {
	private Long MaThongKe;
	private String MaNV;
	private Date ThangNam;
	private int SoCaLam;
	private int SoCaNghi;
	private float Luong;
	public ThongKeLuongBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThongKeLuongBean(Long maThongKe, String maNV, Date thangNam, int soCaLam, int soCaNghi, float luong) {
		super();
		MaThongKe = maThongKe;
		MaNV = maNV;
		ThangNam = thangNam;
		SoCaLam = soCaLam;
		SoCaNghi = soCaNghi;
		Luong = luong;
	}
	public ThongKeLuongBean(String maNV, int soCaLam, int soCaNghi) {
		super();
		MaNV = maNV;
		SoCaLam = soCaLam;
		SoCaNghi = soCaNghi;
	}
	public ThongKeLuongBean(String maNV,Date thangNam, int soCaLam, int soCaNghi) {
		super();
		MaNV = maNV;
		ThangNam = thangNam;
		SoCaLam = soCaLam;
		SoCaNghi = soCaNghi;
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
	public int getSoCaNghi() {
		return SoCaNghi;
	}
	public void setSoCaNghi(int soCaNghi) {
		SoCaNghi = soCaNghi;
	}
	public float getLuong() {
		return Luong;
	}
	public void setLuong(float luong) {
		Luong = luong;
	}
	@Override
	public String toString() {
		return "ThongKeLuongBean [MaThongKe=" + MaThongKe + ", MaNV=" + MaNV + ", ThangNam=" + ThangNam + ", SoCaLam="
				+ SoCaLam + ", SoCaNghi=" + SoCaNghi + ", Luong=" + Luong + "]";
	}
	
	
}
