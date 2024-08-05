package bo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

import bean.DangKyLamBean;
import dao.DangKyLichLamdao;
import dao.ketnoiDB;

public class DangKyLamBo {
	DangKyLichLamdao dklam = new DangKyLichLamdao();
	public ArrayList<DangKyLamBean> GetDKLamByNhanVien(String idnv) throws Exception{
		return dklam.GetDKLamByNhanVien(idnv);
	}
	public ArrayList<DangKyLamBean> GetAllNVLamCungCa(Date ngayDK, String maLC) throws Exception{
		return dklam.GetAllNVLamCungCa(ngayDK,maLC);
	}
	public ArrayList<DangKyLamBean> GetDKLamByNhanVienAndMonth(String idnv, int month) throws Exception{
		return dklam.GetDKLamByNhanVienAndMonth(idnv,month);
	}
	public void insertDK(String idnv,String maloaica,Date date) throws Exception{
		dklam.ThemDKL(idnv,maloaica,date);
	}
	public ArrayList<DangKyLamBean> GetDKLamByNhanVienNextWeek(String idnv) throws Exception{
		LocalDate currentDate = LocalDate.now();
		currentDate = LocalDate.now().plusDays(7);
        // Tính toán ngày bắt đầu và kết thúc của tuần
        LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
        LocalDate endOfWeek = currentDate.with(DayOfWeek.SATURDAY);
		return dklam.GetDKLamByNhanVienNextWeek(Date.valueOf(startOfWeek), Date.valueOf(endOfWeek), idnv);
	}
	public void deleteDK(String idnv) throws Exception{
		LocalDate currentDate = LocalDate.now();
		currentDate = LocalDate.now().plusDays(7);
        // Tính toán ngày bắt đầu và kết thúc của tuần
        LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
        LocalDate endOfWeek = currentDate.with(DayOfWeek.SATURDAY);
		dklam.XoaDKL(Date.valueOf(startOfWeek), Date.valueOf(endOfWeek), idnv);
	}
	public int CountRecordsByNgayDKAndMaLoaiCa(java.sql.Date ngayDK, String maLC) throws Exception {
		return dklam.CountRecordsByNgayDKAndMaLoaiCa(ngayDK, maLC);
	}
	public ArrayList<DangKyLamBean> GetAllDKL() throws Exception{
		return dklam.GetAllDKL();
	}
	public ArrayList<DangKyLamBean> GetDKLbyMaNV_Month_Year(String manv, int month, int year) throws Exception{
		return dklam.GetDKLbyMaNV_Month_Year(manv, month, year);
	}
	public ArrayList<DangKyLamBean> getDKL_BD_KT(java.util.Date ngayBatDau , java.util.Date ngayKetThuc) throws Exception{
		return dklam.getDKL_BD_KT(ngayBatDau, ngayKetThuc);
	}
	public ArrayList<DangKyLamBean> GetDKLbyMonth_Year(int month, int year) throws Exception{
		return dklam.GetDKLbyMonth_Year(month, year);
	}
	public ArrayList<DangKyLamBean> getDSDKLtheoNgay(String NgayDK) throws Exception{
		return dklam.getDSDKLtheoNgay(NgayDK);
	}
	public ArrayList<DangKyLamBean> getDSDKLtheoNgay_LoaiCa(String NgayDK, String MaLoaiCa) throws Exception{
		return dklam.getDSDKLtheoNgay_LoaiCa(NgayDK, MaLoaiCa);
	}
	public ArrayList<DangKyLamBean> getDKL_BD_KT_MLC(java.util.Date ngayBatDau , java.util.Date ngayKetThuc, String MaLoaiCa) throws Exception{
		return dklam.getDKL_BD_KT_MLC(ngayBatDau, ngayKetThuc, MaLoaiCa);
	}
	public static void main(String[] args) {
		DangKyLamBo dkbo = new DangKyLamBo();
		try {
			System.out.println(dkbo.getDSDKLtheoNgay("2024-05-01"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
