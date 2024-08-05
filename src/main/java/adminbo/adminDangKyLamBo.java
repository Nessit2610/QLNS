package adminbo;

import java.util.ArrayList;
import java.util.Date;

import admindao.adminDangKyLamdao;
import bean.DangKyLamBean;
import bean.thongkecalambean;

public class adminDangKyLamBo {
	adminDangKyLamdao addkl = new adminDangKyLamdao();
	public ArrayList<DangKyLamBean> GetDKLtheoma(String manv) throws Exception{
		return addkl.GetDKLtheoma(manv);
	}
	public ArrayList<DangKyLamBean> getDKLLTK(Date SDate , Date EDate) throws Exception{
		return addkl.getDKLLTK(SDate, EDate);
	}
	public ArrayList<thongkecalambean> thongkecalam( int thang ,long nam) throws Exception{
		return addkl.thongkecalam(thang, nam);
	}
}
