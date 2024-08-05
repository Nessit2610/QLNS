package bean;

public class thongkecalambean {
	private String MaNV;
	private Long socalam;
	public thongkecalambean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public thongkecalambean(String maNV, Long socalam) {
		super();
		MaNV = maNV;
		this.socalam = socalam;
	}
	public String getMaNV() {
		return MaNV;
	}
	public void setMaNV(String maNV) {
		MaNV = maNV;
	}
	public Long getSocalam() {
		return socalam;
	}
	public void setSocalam(Long socalam) {
		this.socalam = socalam;
	}
	@Override
	public String toString() {
		return "thongkecalambean [MaNV=" + MaNV + ", socalam=" + socalam + "]";
	}


	
}
