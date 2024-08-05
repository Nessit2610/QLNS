package bo;

import bean.ThongSoKiThuatBean;
import dao.ThongSoKyThuatDao;

public class ThongSoKyThuatBo {
	ThongSoKyThuatDao tsktdao = new ThongSoKyThuatDao();
	public ThongSoKiThuatBean GetThongSo() throws Exception{
		return tsktdao.GetThongSo();
	}
}
