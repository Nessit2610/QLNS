package admincontroller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminbo.adminDangKyLamBo;
import bo.DangKyLamBo;

/**
 * Servlet implementation class adminDangKyLamController
 */
@WebServlet("/adminDangKyLamController")
public class adminDangKyLamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDangKyLamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session= request.getSession();
			adminDangKyLamBo  addklbo = new adminDangKyLamBo();
			DangKyLamBo dklbo = new DangKyLamBo();
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			
			if (month == null && year == null) {
				LocalDate currentDate = LocalDate.now();
				int currentMonth = currentDate.getMonthValue();
				long currentYear = currentDate.getYear();
				request.setAttribute("BangDangKyLam", addklbo.thongkecalam(currentMonth,currentYear));
				request.setAttribute("month", currentMonth);
			}
			if(month != null && year != null) {	
				int m = Integer.parseInt(month);
				long y = Long.parseLong(year);
				request.setAttribute("BangDangKyLam", addklbo.thongkecalam(m,y));
				request.setAttribute("month", m);
			}
			
			String manv = request.getParameter("maNV");
			String btn_xemchitiet = request.getParameter("btn_xemchitiet");
			if(manv != null && btn_xemchitiet != null) {
				request.setAttribute("ChiTiet", dklbo.GetDKLbyMaNV_Month_Year(manv, Integer.parseInt(month),  Integer.parseInt(year)));
				request.setAttribute("month", month);
			}
			RequestDispatcher rd = request.getRequestDispatcher("ADMINdangkylam.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
