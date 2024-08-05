package bean;

public class ChucVuBean {
	private String maVc;
	private String tenCV;
	public ChucVuBean() {
		super();
	}
	public ChucVuBean(String maVc, String tenCV) {
		super();
		this.maVc = maVc;
		this.tenCV = tenCV;
	}
	public String getMaVc() {
		return maVc;
	}
	public void setMaVc(String maVc) {
		this.maVc = maVc;
	}
	public String getTenCV() {
		return tenCV;
	}
	public void setTenCV(String tenCV) {
		this.tenCV = tenCV;
	}
	@Override
	public String toString() {
		return "ChucVuBean [maVc=" + maVc + ", tenCV=" + tenCV + "]";
	}
	
}
