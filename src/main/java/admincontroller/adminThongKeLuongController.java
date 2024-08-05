package admincontroller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminbo.adminThongKeLuongbo;

/**
 * Servlet implementation class adminThongKeLuongController
 */
@WebServlet("/adminThongKeLuongController")
public class adminThongKeLuongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminThongKeLuongController() {
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
			adminThongKeLuongbo adtklbo = new adminThongKeLuongbo();
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			
			if (month == null && year == null) {
				LocalDate currentDate = LocalDate.now();
				int currentMonth = currentDate.getMonthValue();
				long currentYear = currentDate.getYear();
				request.setAttribute("ThongKeLuong", adtklbo.getTKLthang(currentMonth, currentYear));
				request.setAttribute("month", currentMonth);
			}
			if(month != null && year != null) {	
				int m = Integer.parseInt(month);
				long y = Long.parseLong(year);
				request.setAttribute("ThongKeLuong", adtklbo.getTKLthang(m, y));
				request.setAttribute("month", m);
			}
			RequestDispatcher rd = request.getRequestDispatcher("ADMINthongkeluong.jsp");
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
