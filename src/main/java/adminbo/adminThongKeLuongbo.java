package adminbo;

import java.util.ArrayList;

import admindao.adminThongKeLuongdao;
import bean.ThongKeLuongBean;

public class adminThongKeLuongbo {
	adminThongKeLuongdao adtkl = new adminThongKeLuongdao();
	public ArrayList<ThongKeLuongBean> getAllThongKeLuong() throws Exception{
		return adtkl.getAllThongKeLuong();
	}
	public ArrayList<ThongKeLuongBean> getTKLthang(int thang, long nam) throws Exception{
		return adtkl.getTKLthang(thang, nam);
	}
}
