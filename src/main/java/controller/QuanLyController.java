package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminbo.adminDangKyLamBo;
import adminbo.adminNhanVienBo;
import bean.DangKyLamBean;
import bean.DangKyNghiBean;
import bean.NhanVienBean;
import bean.TKeLuongBean;
import bean.ThongKeLuongBean;
import bo.DangKyLamBo;
import bo.DangKyNghibo;
import bo.NhanVienBo;
import bo.ThongKeLuongBo;
import bo.ThongSoKyThuatBo;

/**
 * Servlet implementation class Quanlycontroller
 */
@WebServlet("/quanly")
public class QuanLyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		HttpSession session = request.getSession();
		if((NhanVienBean)session.getAttribute("nhanvien")!=null) {			
			if(action != null) {
				if(action.equals("quanlyIndex")) {
					quanlyIndex(request, response);
				}else if(action.equals("showMonthlySchedule")) {
					showMonthlySchedule(request, response);
				}else if(action.equals("xemdsdangkinghi")){
					xemdsdangkinghi(request, response);
				}else if(action.equals("showemployeesworkingtogether")){
					showEmployeesWorkingTogether(request, response);
				}else if(action.equals("duyetlichnghi")) {
					duyetlichnghi(request, response);	
				}else if(action.equals("danhvangkhongphep")) {
					danhvangkhongphep(request, response);	
				}else if(action.equals("danhsachnhanvien")) {
					danhsachnhanvien(request, response);
				}else if(action.equals("themnhanvien")) {
					themnhanvien(request, response);
				}else if(action.equals("thongkeluong")) {
					thongkeluong(request, response);
				}else if(action.equals("danhsachnghilam")) {
					danhsachnghilam(request, response);
				}else if(action.equals("suattnhanvien")) {
					suattnhanvien(request, response);
				}else if(action.equals("thongkelichlam")) {
					thongkelichlam(request, response);
				}else if(action.equals("bangluong")) {
					bangluong(request, response);
				}
			}
		}else {
			response.sendRedirect("login");			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void quanlyIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		HttpSession session = request.getSession();
		DangKyLamBo dklbo= new DangKyLamBo();
		NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
		String url = "";
		if(nv != null) {
			url = "QUANLYview.jsp";
			try {
				ArrayList<DangKyLamBean> ds = dklbo.GetAllDKL();
				request.setAttribute("bdk", ds);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			url = "login.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void showMonthlySchedule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYlichthang.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();

			String ngayBatDau = request.getParameter("ngayBatDau");
			String ngayKetThuc = request.getParameter("ngayKetThuc");
			String caLam = request.getParameter("calam");
			ArrayList<DangKyLamBean> ds_dkl = null;
			DangKyLamBo dklbo = new DangKyLamBo();
			
			System.out.println(ngayBatDau + ngayKetThuc + caLam);
			LocalDate date = LocalDate.now();
			String thang = Integer.toString(date.getMonthValue());
			String nam = Integer.toString(date.getYear());
			
			if(ngayBatDau == null && ngayKetThuc == null) {
				ds_dkl = dklbo.GetDKLbyMonth_Year(Integer.parseInt(thang), Integer.parseInt(nam));
				request.setAttribute("ds_dkn",ds_dkl);
			}else if(ngayBatDau != null && (ngayKetThuc.trim()).length()== 0) {
				if(caLam.equals("Chọn Ca")) {
					ds_dkl = dklbo.getDSDKLtheoNgay(ngayBatDau);
					request.setAttribute("ds_dkn",ds_dkl);					
				}
				else {
					ds_dkl = dklbo.getDSDKLtheoNgay_LoaiCa(ngayBatDau, caLam);
					request.setAttribute("ds_dkn",ds_dkl);	
				}
			}else if(ngayBatDau != null && ngayKetThuc != null) {
				SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
				Date S = dd.parse(ngayBatDau);
				Date E = dd.parse(ngayKetThuc);
				if(caLam.equals("Chọn Ca")) {
					ds_dkl = dklbo.getDKL_BD_KT(S, E);
					request.setAttribute("ds_dkn",ds_dkl);					
				}
				else {
					ds_dkl = dklbo.getDKL_BD_KT_MLC(S, E, caLam);
					request.setAttribute("ds_dkn",ds_dkl);	
				}
			}
			request.setAttribute("ngayBatDau", ngayBatDau);
			request.setAttribute("ngayKetThuc", ngayKetThuc);
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void showEmployeesWorkingTogether(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdslamcungca.jsp";
		String date = request.getParameter("date");
		String loaica = request.getParameter("lc");
		request.setAttribute("date", date);
		request.setAttribute("loaica", loaica);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void xemdsdangkinghi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsdangkinghi.jsp";
		System.out.println(url);
		try {
			ArrayList<DangKyNghiBean> ds_dkn = null;
			DangKyNghibo dbo = new DangKyNghibo();
			String date = request.getParameter("date");
			String loaica = request.getParameter("loaica");
			ds_dkn = dbo.getDSDKNtheoNgay(date);
			request.setAttribute("ds_dkn",ds_dkn);
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private static boolean isOverdue(String ngaydk) throws ParseException {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate ngayDangKy = LocalDate.parse(ngaydk, formatter);
		LocalDate currentDate = LocalDate.now();
		
		// Kiểm tra nếu ngày đăng ký + 1 ngày lớn hơn ngày hiện tại thì chưa qua hạn
		return ngayDangKy.plusDays(1).isAfter(currentDate);
	}
	public void duyetlichnghi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsdangkinghi.jsp";
		System.out.println(url);
		try {
			DangKyNghibo dbo = new DangKyNghibo();
			ArrayList<DangKyNghiBean> ds_dkn = new ArrayList<DangKyNghiBean>();
			ds_dkn = dbo.GetAllDKN();
			String duyet = request.getParameter("duyet");
			String nguoiduyet = request.getParameter("nguoiduyet");
			String ngaydk = request.getParameter("ngaydk");
			String manv = request.getParameter("manv");
			String maloaica = request.getParameter("maloaica");
			 // Kiểm tra nếu trạng thái là "Đang chờ duyệt" và ngày đăng ký đã qua hạn
	        for (DangKyNghiBean dangKyNghiBean : ds_dkn) {
	        	if (!isOverdue(dangKyNghiBean.getNgayDK().toString())== true && dangKyNghiBean.getDuyet()==0) {
	        		// Tự động chuyển sang trạng thái "Không duyệt"
	        		dbo.DuyetLichNghi("2", "", dangKyNghiBean.getNgayDK().toString(), dangKyNghiBean.getMaNV());
	        		System.out.println( ngaydk+ duyet+"djtme dung co bug");
	        	}
			}
			if(duyet.equals("1")) {
				dbo.DuyetLichNghi(duyet, nguoiduyet, ngaydk, manv);
				dbo.XoaLichLam(manv, maloaica, ngaydk);
			}
			if(duyet.equals("2")) {
				dbo.DuyetLichNghi(duyet, nguoiduyet, ngaydk, manv);				
			}
			ds_dkn = dbo.getDSDKNtheoNgay(ngaydk);
			request.setAttribute("ds_dkn",ds_dkn);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void danhvangkhongphep(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsdangkinghi.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			ArrayList<DangKyNghiBean> ds_dkn = null;
			DangKyNghibo dbo = new DangKyNghibo();
			
			String maloaica = request.getParameter("maloaica");
			String nguoiduyet = request.getParameter("nguoiduyet");
			String ngaydk = request.getParameter("ngaydk");
			String manv = request.getParameter("manv");	
			dbo.DanhVangKhongPhep(manv, maloaica, ngaydk, nguoiduyet);
			dbo.XoaLichLam(manv, maloaica, ngaydk);
			dbo.XoaLichNghi(manv, maloaica, ngaydk);
			ds_dkn = dbo.getDSDKNtheoNgay(ngaydk);
			request.setAttribute("ds_dkn",ds_dkn);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void danhsachnhanvien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsnhanvien.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			ArrayList<NhanVienBean> ds_nv = null;
			NhanVienBo nvbo = new NhanVienBo();
			
			String manv = request.getParameter("manv");
			String ttcv = request.getParameter("ttcv");
			nvbo.UpdateTTCV(manv, ttcv);
			ds_nv = nvbo.getnhanvien();
			request.setAttribute("ds_nv", ds_nv);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void themnhanvien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsnhanvien.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			ArrayList<NhanVienBean> ds_nv = null;
			NhanVienBo nvbo = new NhanVienBo();
			
			String tennv = request.getParameter("tennv");
			String ngaysinh = request.getParameter("ngaysinh");
			String gioitinh = request.getParameter("gioitinh");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");
			String tendn = request.getParameter("tendn");
			String mk = request.getParameter("mk");
			String anh = request.getParameter("anh");
			String stk = request.getParameter("stk");
			
			nvbo.ThemNhanVien_QL(tennv, java.sql.Date.valueOf(ngaysinh), Boolean.parseBoolean(gioitinh), email, sdt, tendn, stk, anh, anh);
			ds_nv = nvbo.getnhanvien();
			
			request.setAttribute("ds_nv", ds_nv);
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void suattnhanvien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsnhanvien.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			adminNhanVienBo adnvbo = new adminNhanVienBo();
			NhanVienBo nvbo = new NhanVienBo();
			ArrayList<NhanVienBean> ds_nv = null;
			
			String manv = request.getParameter("mã nhân viên");
			String tennv = request.getParameter("tên nhân viên");
			String macv = request.getParameter("mã chức vụ");
			String ngaySinh = request.getParameter("ngày sinh");
			String gioiTinh = request.getParameter("giới tính");
			String email = request.getParameter("email");
			String sdt = request.getParameter("số điện thoại");
			String DVCT = request.getParameter("đơn vị công tác");
			String chucDanh = request.getParameter("chức danh");
			String tenDangNhap = request.getParameter("tên đăng nhập");
			String matKhau = request.getParameter("mật khẩu");
			String trangThaiCongViec = request.getParameter("trạng thái công việc");
			String ngayVaoLam = request.getParameter("ngày vào làm");
			String ngayKetThuc = request.getParameter("ngày kết thúc");
			String stk = request.getParameter("số tài khoản");

			if (manv != null && Boolean.parseBoolean(trangThaiCongViec) == false) {
				adnvbo.UpdateNhanVien(manv, tennv, macv, java.sql.Date.valueOf(ngaySinh), Boolean.parseBoolean(gioiTinh), email,
										sdt, DVCT, chucDanh, tenDangNhap, matKhau,
										Boolean.parseBoolean(trangThaiCongViec), java.sql.Date.valueOf(ngayVaoLam), stk);
				adnvbo.UpdateNgayKetThuc(manv);
				System.out.println("Da Duoi Viec");
			}

			if (manv != null && Boolean.parseBoolean(trangThaiCongViec) == true) {
				adnvbo.BTW(manv);
				System.out.println("Djt con me may lam tiep de");
			}
			
			if(manv != null && tennv != null && macv != null && ngaySinh != null && gioiTinh != null && email != null && sdt != null && DVCT != null && 
					 chucDanh != null && tenDangNhap != null && matKhau != null && trangThaiCongViec != null && ngayVaoLam != null && stk != null) 
			{ 
				 
				adnvbo.UpdateNhanVien(manv, tennv, macv, java.sql.Date.valueOf(ngaySinh), Boolean.parseBoolean(gioiTinh), email,
						 				sdt, DVCT, chucDanh, tenDangNhap, matKhau,
						 				Boolean.parseBoolean(trangThaiCongViec), java.sql.Date.valueOf(ngayVaoLam), stk); 
				System.out.println("DaSuaThongTin"); 
			}
			ds_nv = nvbo.getnhanvien();
			request.setAttribute("ds_nv", ds_nv);
			 
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void thongkeluong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYthongkeluong.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
			DangKyNghibo dknbo = new DangKyNghibo();
			DangKyLamBo dklbo = new DangKyLamBo();
			NhanVienBo nvbo = new NhanVienBo();
			ThongKeLuongBo tkbo = new ThongKeLuongBo();
			
			ArrayList<NhanVienBean> nvbean = nvbo.getnhanvien();
			ArrayList<ThongKeLuongBean> tkl = new ArrayList<ThongKeLuongBean>();
			ArrayList<TKeLuongBean> tkl_tam = new ArrayList<TKeLuongBean>();
			String thang = request.getParameter("thang");
			String nam = request.getParameter("nam");
			ThongSoKyThuatBo tsktbo = new ThongSoKyThuatBo();
			if(thang == null && nam == null) {				
				LocalDate date = LocalDate.now();
				thang = Integer.toString(date.getMonthValue());
				nam = Integer.toString(date.getYear());
			}

				tkl_tam = tkbo.getTKLTamTheoThangNam_Moi(Integer.parseInt(thang), Integer.parseInt(nam));
				
				System.out.println(tkl_tam);
				for (TKeLuongBean thongKeLuongBean : tkl_tam) {
					thongKeLuongBean.setLuong(tkbo.TinhLuong(tsktbo.GetThongSo(),thongKeLuongBean.getSoCaLam(), thongKeLuongBean.getSoCaNghiKhongPhep()));
				}
				request.setAttribute("thang", thang);
				request.setAttribute("nam", nam);
				request.setAttribute("tkl_tam", tkl_tam);
				request.setAttribute("msg", "Danh sách tạm tính:");
			
			if(request.getParameter("tinhluongtam") != null) {
		            for (int i = 0; i < tkl_tam.size(); i++) {
		            	double luongTamTinh = Double.parseDouble(request.getParameter("luongtam" + (i + 1)));
		                double luongThuong = Double.parseDouble(request.getParameter("luongthuong" + (i + 1)));
		                double luongPhat = Double.parseDouble(request.getParameter("luongphat" + (i + 1)));
		                double tongLuong = luongTamTinh + luongThuong - luongPhat;
		                System.out.println(tongLuong);
		                // Cập nhật lại giá trị tổng lương
		                request.setAttribute("tongluong" + (i + 1), tongLuong);
		            }
			 }
			System.out.println(tkl);
			if(request.getParameter("duyet") != null) {
				tkbo.XoaTKL(Integer.parseInt(thang), Integer.parseInt(nam));
				for (int i = 0; i < tkl_tam.size(); i++) {
	            	double tongLuong = Double.parseDouble(request.getParameter("tongluong" + (i + 1)));
	            	 tkl_tam.get(i).setLuong((float)tongLuong);
	            	 tkbo.DuyetLuongTheoThangNam_Moi(tkl_tam.get(i));
	            	 request.setAttribute("tkl_tam", tkl_tam);
	            }
			}
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void bangluong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYbangluong.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
			DangKyNghibo dknbo = new DangKyNghibo();
			DangKyLamBo dklbo = new DangKyLamBo();
			NhanVienBo nvbo = new NhanVienBo();
			ThongKeLuongBo tkbo = new ThongKeLuongBo();
			
			ArrayList<NhanVienBean> nvbean = nvbo.getnhanvien();
			ArrayList<ThongKeLuongBean> tkl = new ArrayList<ThongKeLuongBean>();
			String thang = request.getParameter("thang");
			String nam = request.getParameter("nam");
			ThongSoKyThuatBo tsktbo = new ThongSoKyThuatBo();
			if(thang == null && nam == null) {				
				LocalDate date = LocalDate.now();
				thang = Integer.toString(date.getMonthValue());
				nam = Integer.toString(date.getYear());
			}
			tkl = tkbo.getTKLTheoThangNam(Integer.parseInt(thang), Integer.parseInt(nam));
			request.setAttribute("thang", thang);
			request.setAttribute("nam", nam);
			request.setAttribute("tkl", tkl);
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void danhsachnghilam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdsnghilam.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			LocalDate date = LocalDate.now();

			String ngayBatDau = request.getParameter("ngayBatDau");
			String ngayKetThuc = request.getParameter("ngayKetThuc");
			ArrayList<DangKyNghiBean> ds_dkn = null;
			DangKyNghibo dbo = new DangKyNghibo();
			request.setAttribute("ds_dkn", dbo.getDSDKNtheoNgay(date.toString()));;
			
			if(ngayBatDau != null && (ngayKetThuc.trim()).length()== 0) {
				ds_dkn = dbo.getDSDKNtheoNgay(ngayBatDau);
				request.setAttribute("ds_dkn",ds_dkn);
			}else
			if(ngayBatDau != null && ngayKetThuc != null) {
				ds_dkn = dbo.getDS_DKLN_BDKT(ngayBatDau, ngayKetThuc);
				request.setAttribute("ds_dkn",ds_dkn);
			}
			
			System.out.println(ngayBatDau + ngayKetThuc);
			request.setAttribute("ngayBatDau", ngayBatDau);
			request.setAttribute("ngayKetThuc", ngayKetThuc);
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void thongkelichlam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "QUANLYdangkylam.jsp";
		System.out.println(url);
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session= request.getSession();
			
			adminDangKyLamBo  addklbo = new adminDangKyLamBo();
			DangKyLamBo dklbo = new DangKyLamBo();
			String month = request.getParameter("thang");
			String year = request.getParameter("nam");
			
			if(month == null && year == null) {
				LocalDate currentDate = LocalDate.now();
				String currentMonth = Integer.toString(currentDate.getMonthValue());
				String currentYear = Integer.toString(currentDate.getYear());
				request.setAttribute("BangDangKyLam", addklbo.thongkecalam(Integer.parseInt(currentMonth),Long.parseLong(currentYear)));
				request.setAttribute("thang", currentMonth);
			}
			if(month != null && year != null) {	
				int m = Integer.parseInt(month);
				long y = Long.parseLong(year);
				System.out.println(month + year);
				request.setAttribute("BangDangKyLam", addklbo.thongkecalam(m,y));
				request.setAttribute("thang", m);
			}
			
			String manv = request.getParameter("maNV");
			String btn_xemchitiet = request.getParameter("btn_xemchitiet");
			if(btn_xemchitiet != null && month != null && year != null) {
				request.setAttribute("ChiTiet", dklbo.GetDKLbyMaNV_Month_Year(manv, Integer.parseInt(month) , Integer.parseInt(year)));
				request.setAttribute("thang", month);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
