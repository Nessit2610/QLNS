package adminbo;

import java.util.ArrayList;

import admindao.adminDangKyNghiDao;
import bean.DangKyNghiBean;
import bean.VDangKyNghiBean;

public class adminDangKyNghiBo {
	adminDangKyNghiDao dkdao = new adminDangKyNghiDao();
	public ArrayList<VDangKyNghiBean> GetAllDKN() throws Exception{
		return dkdao.GetAllDKN();
	}
	public void UpdateDangKyNghi(Long MaDKNghi, String NguoiDuyet) throws Exception{
		dkdao.UpdateDangKyNghi(MaDKNghi, NguoiDuyet);
	}
	public void UpdateTuChoiDangKyNghi(Long MaDKNghi, String NguoiDuyet) throws Exception{
		dkdao.UpdateTuChoiDangKyNghi(MaDKNghi, NguoiDuyet);
	}
}
