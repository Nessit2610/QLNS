package admincontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminbo.adminThongSoKyThuatbo;

/**
 * Servlet implementation class ThongSoController
 */
@WebServlet("/ThongSoController")
public class ThongSoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThongSoController() {
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
			String hsl = request.getParameter("hsl");
			String hslOT = request.getParameter("hslOT");
			String hslPhat = request.getParameter("hslPhat");
			String sclMinThang = request.getParameter("sclMinThang");
			String sclMaxCa = request.getParameter("sclMaxCa");
			String sclMinCa = request.getParameter("sclMinCa");
			String luong = request.getParameter("luong");
			HttpSession session= request.getSession();
			adminThongSoKyThuatbo tskhbo = new adminThongSoKyThuatbo();
			
			request.setAttribute("BangThongSo", tskhbo.GetThongSo());
			if(hsl != null && hslOT != null && hslPhat != null && sclMinThang != null && sclMaxCa != null && sclMinCa != null) {
				tskhbo.SuaThongSo(Long.parseLong(luong),Integer.parseInt(sclMinThang), Integer.parseInt(sclMinCa), Integer.parseInt(sclMaxCa), Float.parseFloat(hsl), Float.parseFloat(hslOT), Float.parseFloat(hslPhat));
				request.setAttribute("BangThongSo", tskhbo.GetThongSo());
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("ADMINview.jsp");
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