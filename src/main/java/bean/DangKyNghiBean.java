package bean;

import java.util.Date;

public class DangKyNghiBean {
	private Long maDkNghi;
	private String maNV;
	private String maLoaiCa;
	private Date ngayDK;
	private int duyet;
	private String nguoiDuyet;
	private String lyDo;
 	public DangKyNghiBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DangKyNghiBean(Long maDkNghi, String maNV, String maLoaiCa, Date ngayDK, int duyet, String nguoiDuyet,
			String lyDo) {
		super();
		this.maDkNghi = maDkNghi;
		this.maNV = maNV;
		this.maLoaiCa = maLoaiCa;
		this.ngayDK = ngayDK;
		this.duyet = duyet;
		this.nguoiDuyet = nguoiDuyet;
		this.lyDo = lyDo;
	}
	public DangKyNghiBean(String maNV, String maLoaiCa, Date ngayDK, int duyet, String nguoiDuyet, String lyDo) {
		super();
		this.maNV = maNV;
		this.maLoaiCa = maLoaiCa;
		this.ngayDK = ngayDK;
		this.duyet = duyet;
		this.nguoiDuyet = nguoiDuyet;
		this.lyDo = lyDo;
	}
	public Long getMaDkNghi() {
		return maDkNghi;
	}
	public void setMaDkNghi(Long maDkNghi) {
		this.maDkNghi = maDkNghi;
	}
	public String getMaNV() {
		return maNV;
	}
	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}
	public String getMaLoaiCa() {
		return maLoaiCa;
	}
	public void setMaLoaiCa(String maLoaiCa) {
		this.maLoaiCa = maLoaiCa;
	}
	public Date getNgayDK() {
		return ngayDK;
	}
	public void setNgayDK(Date ngayDK) {
		this.ngayDK = ngayDK;
	}
	public int getDuyet() {
		return duyet;
	}
	public void setDuyet(int duyet) {
		this.duyet = duyet;
	}
	public String getNguoiDuyet() {
		return nguoiDuyet;
	}
	public void setNguoiDuyet(String nguoiDuyet) {
		this.nguoiDuyet = nguoiDuyet;
	}
	public String getLyDo() {
		return lyDo;
	}
	public void setLyDo(String lyDo) {
		this.lyDo = lyDo;
	}
	@Override
	public String toString() {
		return "DangKyNghiBean [maDkNghi=" + maDkNghi + ", maNV=" + maNV + ", maLoaiCa=" + maLoaiCa + ", ngayDK="
				+ ngayDK + ", duyet=" + duyet + ", nguoiDuyet=" + nguoiDuyet + ", lyDo=" + lyDo + "]";
	}
	
}
