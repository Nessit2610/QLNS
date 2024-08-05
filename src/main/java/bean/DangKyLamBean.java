package bean;

import java.util.Date;

public class DangKyLamBean {
	private Long maDkLam;
	private String maNV;
	private String maLoaica;
	private Date ngayDK;
	public DangKyLamBean() {
		super();
	}
	public DangKyLamBean(Long maDkLam, String maNV, String maLoaica, Date ngayDK) {
		super();
		this.maDkLam = maDkLam;
		this.maNV = maNV;
		this.maLoaica = maLoaica;
		this.ngayDK = ngayDK;
	}
	public DangKyLamBean(String maLoaica, Date ngayDK) {
		super();
		this.maLoaica = maLoaica;
		this.ngayDK = ngayDK;
	}
	public Long getMaDkLam() {
		return maDkLam;
	}
	public void setMaDkLam(Long maDkLam) {
		this.maDkLam = maDkLam;
	}
	public String getMaNV() {
		return maNV;
	}
	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}
	public String getMaLoaica() {
		return maLoaica;
	}
	public void setMaLoaica(String maLoaica) {
		this.maLoaica = maLoaica;
	}
	public Date getNgayDK() {
		return ngayDK;
	}
	public void setNgayDK(Date ngayDK) {
		this.ngayDK = ngayDK;
	}
	@Override
	public String toString() {
		return "DangKyLamBean [maDkLam=" + maDkLam + ", maNV=" + maNV + ", maLoaica=" + maLoaica + ", ngayDK=" + ngayDK
				+ "]";
	}
	
}