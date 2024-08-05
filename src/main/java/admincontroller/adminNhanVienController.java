package admincontroller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminbo.adminNhanVienBo;

/**
 * Servlet implementation class adminNhanVienController
 */
@WebServlet("/adminNhanVienController")
public class adminNhanVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminNhanVienController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			adminNhanVienBo adnvbo = new adminNhanVienBo();
			request.setAttribute("DanhSachNhanVien", adnvbo.getnhanvien());
			String key= request.getParameter("txttk");
			if(key != null) {
				request.setAttribute("DanhSachNhanVien", adnvbo.getnhanvienTK(key));
			}
			String tennv = request.getParameter("tennv");
			String selectedDate = request.getParameter("selectedDate");
			String gender = request.getParameter("gender");
			String cv = request.getParameter("cv");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");
			String tendn = request.getParameter("tendn");
			String mk = request.getParameter("mk");
			String image = request.getParameter("image");
			String stk = request.getParameter("stk");
			if(tennv != null && selectedDate != null && gender != null && cv != null && email != null && sdt != null && tendn != null && mk != null && image != null && stk != null) {
				adnvbo.ThemNhanVien_QL(tennv, cv, Date.valueOf(selectedDate), Boolean.parseBoolean(gender), email, sdt, tendn, stk, image, stk);
				request.setAttribute("DaThem", "DaThem");
				request.setAttribute("DanhSachNhanVien", adnvbo.getnhanvien());
			}
			RequestDispatcher rd = request.getRequestDispatcher("ADMINnhanvien.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
