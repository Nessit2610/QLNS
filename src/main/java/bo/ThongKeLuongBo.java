package bo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.TKeLuongBean;
import bean.ThongKeLuongBean;
import bean.ThongSoKiThuatBean;
import dao.ThongKeLuongdao;
import dao.ketnoiDB;

public class ThongKeLuongBo {
	ThongKeLuongdao tkdao = new ThongKeLuongdao();
	public float TinhLuong(ThongSoKiThuatBean tkb,int SoCaLam, int SoCaNghiKhongPhep) throws Exception{
		int SoCaLamMin = tkb.getSoCaLamMin();
		long Luong1ca = tkb.getLuong();
		float HSL = tkb.getHSL();
		float HSLOT = tkb.getHSLOT();
		
//		ThongSoKyThuatBo tskt = new ThongSoKyThuatBo();
//		int SoCaLamMin = tskt.GetThongSo().getSoCaLamMin();
//		long Luong1ca = tskt.GetThongSo().getLuong();
//		float HSL = tskt.GetThongSo().getHSL();
//		float HSLOT = tskt.GetThongSo().getHSLOT();
		float luong = 0;
		if(SoCaNghiKhongPhep == 0) {
			if(SoCaLam == SoCaLamMin) {
				luong = SoCaLam*HSL*Luong1ca;
			}else if(SoCaLam > SoCaLamMin) {
				luong = SoCaLam*HSL*Luong1ca + (SoCaLam - SoCaLamMin)*HSLOT*Luong1ca;
			}else{
				float SoCaLamThieu = SoCaLam - SoCaLamMin;
				float n = (SoCaLamThieu/SoCaLamMin)*100;
				if(n <= 10) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.1f));
				}else if(n <= 20) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.2f));
				}else if(n <= 30) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.5f));
				}
			}			
		}else {
			if(SoCaLam == SoCaLamMin) {
				luong = SoCaLam*HSL*Luong1ca - SoCaNghiKhongPhep*200000;
			}else if(SoCaLam > SoCaLamMin) {
				luong = SoCaLam*HSL*Luong1ca + (SoCaLam - SoCaLamMin)*HSLOT*Luong1ca - SoCaNghiKhongPhep*200000;
			}else{
				float SoCaLamThieu = SoCaLam - SoCaLamMin;
				float n = (SoCaLamThieu/SoCaLamMin)*100;
				if(n <= 10) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.1f) - SoCaNghiKhongPhep*200000);
				}else if(n <= 20) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.2f) - SoCaNghiKhongPhep*200000);
				}else if(n <= 30) {
					luong = (float)(SoCaLam*Luong1ca*(HSL-0.5f) - SoCaNghiKhongPhep*200000);
				}
			}
		}
		return luong;
	}
	public ArrayList<ThongKeLuongBean> getTKLTheoThangNam(int thang, int nam) throws Exception{
		return tkdao.getTKLTheoThangNam(thang, nam);
	}
	public void DuyetLuongTheoThangNam(ThongKeLuongBean tlb) throws Exception{
		tkdao.DuyetLuongTheoThangNam(tlb);
	}
	public ArrayList<ThongKeLuongBean> getTKLTamTheoThangNam(int thang, int nam) throws Exception{
		return tkdao.getTKLTamTheoThangNam(thang, nam);
	}
	public ArrayList<ThongKeLuongBean> getTKLTheoMaNV(String manv) throws Exception{
		return tkdao.getTKLTheoMaNV(manv);
	}
	public ArrayList<ThongKeLuongBean>  getTKLTheoMaNV_Thang_Nam(String manv,int thang , int nam) throws Exception{
		return tkdao.getTKLTheoMaNV_Thang_Nam(manv,thang, nam);
	}
	
	public ArrayList<TKeLuongBean> getTKLTamTheoThangNam_Moi(int thang, int nam) throws Exception{
		return tkdao.getTKLTamTheoThangNam_Moi(thang, nam);
	}
	public void DuyetLuongTheoThangNam_Moi(TKeLuongBean tlb) throws Exception{
		tkdao.DuyetLuongTheoThangNam_Moi(tlb);
	}
	public void XoaTKL(int thang, int nam) throws Exception {
	    tkdao.XoaTKL(thang, nam);
	}
//	public static void main(String[] args) {
//		ThongKeLuongBo tkbo = new ThongKeLuongBo();
//		ArrayList<TKeLuongBean> tkl = new ArrayList<TKeLuongBean>();
//		try {
//			tkl = tkbo.getTKLTamTheoThangNam_Moi(4, 2024);
//			for (TKeLuongBean tKeLuongBean : tkl) {
//				System.out.println(tKeLuongBean);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}
