package bean;

public class LoaiCaBean {
	private String MaLoaiCa;
	private String TenLoaiCa;
	public LoaiCaBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoaiCaBean(String maLoaiCa, String tenLoaiCa) {
		super();
		MaLoaiCa = maLoaiCa;
		TenLoaiCa = tenLoaiCa;
	}
	public String getMaLoaiCa() {
		return MaLoaiCa;
	}
	public void setMaLoaiCa(String maLoaiCa) {
		MaLoaiCa = maLoaiCa;
	}
	public String getTenLoaiCa() {
		return TenLoaiCa;
	}
	public void setTenLoaiCa(String tenLoaiCa) {
		TenLoaiCa = tenLoaiCa;
	}
	@Override
	public String toString() {
		return "LoaiCaBean [MaLoaiCa=" + MaLoaiCa + ", TenLoaiCa=" + TenLoaiCa + "]";
	}
	
}
