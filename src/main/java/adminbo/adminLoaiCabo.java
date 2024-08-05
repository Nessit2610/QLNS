package adminbo;

import java.util.ArrayList;

import admindao.adminLoaiCadao;
import bean.LoaiCaBean;

public class adminLoaiCabo {
	adminLoaiCadao adcadao = new adminLoaiCadao();
	public ArrayList<LoaiCaBean> GetAllLC() throws Exception{
		return adcadao.GetAllLC();
	}
	public void ThemLoaiCa(String MaLoaiCa, String TenLoaiCa) throws Exception{
		adcadao.ThemLoaiCa(MaLoaiCa, TenLoaiCa);
		return;
	}
	public void updateLoaiCa(String MaLoaiCa, String TenLoaiCa) throws Exception{
		adcadao.updateLoaiCa(MaLoaiCa, TenLoaiCa);
		return;
	}
	public void DeleteLoaiCa(String MaLoaiCa) throws Exception{
		adcadao.DeleteLoaiCa(MaLoaiCa);
		return;
	}
}
