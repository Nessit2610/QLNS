package adminbo;

import java.util.ArrayList;

import admindao.adminThongSoKyThuatdao;
import bean.ThongSoKiThuatBean;

public class adminThongSoKyThuatbo {
	ThongSoKiThuatBean ds;
	adminThongSoKyThuatdao tsktdao = new adminThongSoKyThuatdao();
	public ThongSoKiThuatBean GetThongSo() throws Exception{
		ds = tsktdao.GetThongSo();
		return ds;
	}
	public void SuaThongSo(long luong,int SoCaLamMin, int SoNVMotCaMin ,int SoNVMotCaMax ,float HSL, float HSLOT, float HSLPhat) throws Exception{
		tsktdao.SuaThongSo(luong ,SoCaLamMin, SoNVMotCaMin, SoNVMotCaMax, HSL, HSLOT, HSLPhat);
	}
}
