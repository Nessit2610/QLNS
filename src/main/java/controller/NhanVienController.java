package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DangKyLamBean;
import bean.DangKyNghiBean;
import bean.NhanVienBean;
import bean.ThongKeLuongBean;
import bo.DangKyLamBo;
import bo.DangKyNghibo;
import bo.NhanVienBo;
import bo.ThongKeLuongBo;

/**
 * Servlet implementation class nhanviencontroller
 */
@WebServlet("/nhanvien")
public class NhanVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NhanVienController() {
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
		HttpSession session = request.getSession();
		if((NhanVienBean)session.getAttribute("nhanvien")!=null) {			
			if(action != null) {
				if(action.equals("index")) {
					index(request, response);
				}else if(action.equals("showmonthlyschedule")) {
					showMonthlySchedule(request, response);
				}else if(action.equals("workregistration")){
					workRegistration(request, response);
				}else if(action.equals("showemployeesworkingtogether")){
					showEmployeesWorkingTogether(request, response);
				}else if(action.equals("dknghi")){
					dangKyNghi(request, response);
				}else if(action.equals("changerinf")){
					changerinformation(request, response);
				}else if(action.equals("showarrdkn")){
					showDsDonDkNghi(request, response);
				}else if(action.equals("changerpass")){
					changePass(request, response);
				}else if(action.equals("showarrluong")){
					showarrluong(request, response);
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
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		HttpSession session = request.getSession();
		DangKyLamBo dklbo= new DangKyLamBo();
		NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
		String url = "";
		if(nv != null) {
			url = "NHANVIENview.jsp";
			try {
				ArrayList<DangKyLamBean> ds = dklbo.GetDKLamByNhanVien(nv.getMaNV());
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
		HttpSession session = request.getSession();
		DangKyLamBo dklbo= new DangKyLamBo();
		NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
		String url = "";
		LocalDate lcdate = LocalDate.now();
		if(nv != null) {
			url = "NHANVIENLichthang.jsp";
			try {
				ArrayList<DangKyLamBean> ds = dklbo.GetDKLamByNhanVienAndMonth(nv.getMaNV(), lcdate.getMonthValue());
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
	public void workRegistration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "login";
		String btnAction = request.getParameter("submitBtn");
		String[] caSang = request.getParameterValues("casang");
		String[] caChieu = request.getParameterValues("cachieu");
		String[] caToi = request.getParameterValues("catoi");
		DangKyLamBo dklbo = new DangKyLamBo();
		LocalDate date = LocalDate.now();
		HttpSession session = request.getSession();
		if((NhanVienBean)session.getAttribute("nhanvien")!=null) {
			NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
			try {
				System.out.println(caToi);
				url = "NHANVIENDangkylam.jsp";
				if(btnAction!=null) {
					if(btnAction.equals("regis")) {
						if (caSang != null) {
							for (String ngay : caSang) {
								dklbo.insertDK(nv.getMaNV(),"LC001", Date.valueOf(ngay));
							}
						}
						if (caChieu != null) {
							for (String ngay : caChieu) {
								dklbo.insertDK(nv.getMaNV(),"LC002", Date.valueOf(ngay));
							}
						}
						if (caToi != null) {
							for (String ngay : caToi) {
								dklbo.insertDK(nv.getMaNV(),"LC003", Date.valueOf(ngay));
							}
						}
						request.setAttribute("msgSuccess", "Đăng kí thành công!");
					}else if(btnAction.equals("changeregis")) {
						dklbo.deleteDK(nv.getMaNV());
						if (caSang != null) {
							for (String ngay : caSang) {
								dklbo.insertDK(nv.getMaNV(),"LC001", Date.valueOf(ngay));
							}
						}
						if (caChieu != null) {
							for (String ngay : caChieu) {
								dklbo.insertDK(nv.getMaNV(),"LC002", Date.valueOf(ngay));
							}
						}
						if (caToi != null) {
							for (String ngay : caToi) {
								dklbo.insertDK(nv.getMaNV(),"LC003", Date.valueOf(ngay));
							}
						}
						request.setAttribute("msgSuccess", "Chỉnh sửa thành công!");
					}
				}
				request.setAttribute("socadadangky", dklbo.GetDKLamByNhanVienAndMonth(nv.getMaNV(), date.getMonthValue()).size());
				request.setAttribute("dsdk", dklbo.GetDKLamByNhanVienNextWeek(nv.getMaNV()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}System.out.println(url);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void showEmployeesWorkingTogether(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "NHANVIENDSLamcungca.jsp";
		String date = request.getParameter("date");
		String loaica = request.getParameter("lc");
		request.setAttribute("date", date);
		request.setAttribute("loaica", loaica);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void dangKyNghi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "NHANVIENDSLamcungca.jsp";
		String maNV = request.getParameter("manv");
		String date = request.getParameter("date");
		String loaica = request.getParameter("loaica");
		String lyDo = request.getParameter("lydo");
		DangKyNghibo dknghibo = new DangKyNghibo();
		if(maNV != null && date != null && loaica != null) {
			DangKyNghiBean dknghi = new DangKyNghiBean(maNV, loaica, Date.valueOf(date), 0, null, lyDo);
			try {
				dknghibo.insertDKN(dknghi);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			url = "index";
		}
		request.setAttribute("date", date);
		request.setAttribute("loaica", loaica);
		request.setAttribute("msgSuccess","Đăng ký nghỉ thành công!");
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void changerinformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "InfomationEmpl.jsp";
		String email = request.getParameter("email");
		String soDienThoai = request.getParameter("sdt");
		String soTaiKhoan = request.getParameter("stk");
		NhanVienBo nvbo = new NhanVienBo();
		HttpSession session = request.getSession();
		NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
		if(email != null && soDienThoai != null && soTaiKhoan != null) {
			nhanvien.setEmail(email);
			nhanvien.setsDT(soDienThoai);
			nhanvien.setSoTaiKhoan(soTaiKhoan);
			try {
				nvbo.updateNV(nhanvien);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("msgSuccess","Chỉnh sửa thông tin thành công!");
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void changePass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String url = "InfomationEmpl.jsp";
		String matkhaucu = request.getParameter("matkhaucu");
		String matkhaumoi = request.getParameter("matkhaumoi");
		String matkhaumoi2 = request.getParameter("matkhaumoi2");
		NhanVienBo nvbo = new NhanVienBo();
		HttpSession session = request.getSession();
		NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
		if(matkhaucu != null && matkhaumoi != null && matkhaumoi2 != null) {
			if(matkhaumoi.equals(matkhaumoi2)) {				
				nhanvien.setMatKhau(matkhaumoi);
				try {
					nvbo.updateNV(nhanvien);
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("msgSuccess","Chỉnh sửa thông tin thành công!");
			}else {
				request.setAttribute("msgSuccess","Mật khẩu không khớp");
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void showDsDonDkNghi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String url = "NHANVIENDSDangKyNghi.jsp";
		String thang = request.getParameter("thang");
		String nam = request.getParameter("nam");
		HttpSession session = request.getSession();
		NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
		DangKyNghibo dknbo = new DangKyNghibo();
		ArrayList<DangKyNghiBean> dsdknghi = new ArrayList<DangKyNghiBean>();
		LocalDate date = LocalDate.now();
		if(thang == null && nam == null) {						
			thang = Integer.toString(date.getMonthValue());
			nam = Integer.toString(date.getYear());
		}
		try {
			dsdknghi = dknbo.GetDKNbyMaNV_Month_Year(nhanvien.getMaNV(), Integer.parseInt(thang),  Integer.parseInt(nam));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(dsdknghi.size()!=0) {
			request.setAttribute("dsdknghi", dsdknghi);
		}else {				
			request.setAttribute("msg", "Danh sách trống!");
		}
		request.setAttribute("thang", thang);
		request.setAttribute("nam", nam);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	public void showarrluong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		HttpSession session = request.getSession();
		ThongKeLuongBo tklbo= new ThongKeLuongBo();
		NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
		String url = "";
		LocalDate lcdate = LocalDate.now();
		String thang = request.getParameter("thang");
		String nam = request.getParameter("nam");
		System.out.println(thang+"/"+nam);
		if(thang==null && nam==null) {				
			try {
				ArrayList<ThongKeLuongBean> ds = tklbo.getTKLTheoMaNV(nv.getMaNV());
				request.setAttribute("tk", ds);
				System.out.println("TKL:" + ds);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(thang!=null && nam!=null){
			try {
				ArrayList<ThongKeLuongBean> ds = tklbo.getTKLTheoMaNV_Thang_Nam(nv.getMaNV(),Integer.parseInt(thang), Integer.parseInt(nam));
				System.out.println("TKL:" + ds);
				if(ds.size()!=0) {
					request.setAttribute("tk", ds);
				}else {
					request.setAttribute("msg", "Không có thống kê lương của tháng đã chọn!");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("thang", thang);
			request.setAttribute("nam", nam);
		}
		url = "NHANVIENThongKeLuong.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
