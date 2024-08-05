package bo;

import java.util.ArrayList;

import bean.DangKyNghiBean;
import dao.DangKyNghidao;

public class DangKyNghibo {
	DangKyNghidao dknghidao = new DangKyNghidao();
	public ArrayList<DangKyNghiBean> GetAllDKN() throws Exception{
		return dknghidao.GetAllDKN();
	}
	public ArrayList<DangKyNghiBean> GetDKNbyMaNV_Month_Year(String manv, int monnth, int year) throws Exception{
		return dknghidao.GetDKNbyMaNV_Month_Year(manv,monnth,year);
	}
	public void insertDKN(DangKyNghiBean dkn) throws Exception {
		dknghidao.insertDKN(dkn);
	}
	public ArrayList<DangKyNghiBean> getDSDKNtheoNgay(String NgayDK) throws Exception{
		return dknghidao.getDSDKNtheoNgay(NgayDK);
	}
	public void DuyetLichNghi(String Duyet, String NguoiDuyet, String NgayDK, String MaNV) throws Exception{
		dknghidao.DuyetLichNghi(Duyet, NguoiDuyet, NgayDK, MaNV);
	}
	public void DanhVangKhongPhep(String MaNV, String MaLoaiCa, String NgayDK ,String NguoiDuyet) throws Exception{
		dknghidao.DanhVangKhongPhep(MaNV, MaLoaiCa, NgayDK, NguoiDuyet);
	}
	public void XoaLichLam(String MaNV, String MaLoaiCa, String NgayDK) throws Exception{
		dknghidao.XoaLichLam(MaNV, MaLoaiCa, NgayDK);
	}
	public void XoaLichNghi(String MaNV, String MaLoaiCa, String NgayDK) throws Exception{
		dknghidao.XoaLichNghi(MaNV, MaLoaiCa, NgayDK);
	}
	public ArrayList<DangKyNghiBean> getNVvangkhongphep(String manv, int month, int year) throws Exception{
		return dknghidao.getNVvangkhongphep(manv, month, year);
	}
	public ArrayList<DangKyNghiBean> getDS_DKLN_BDKT(String ngayBatDau, String ngayKetThuc) throws Exception{
		return dknghidao.getDS_DKLN_BDKT(ngayBatDau, ngayKetThuc);
	}
}
