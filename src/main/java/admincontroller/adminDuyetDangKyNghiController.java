package admincontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminbo.adminDangKyNghiBo;
import admindao.adminDangKyNghiDao;
import bean.NhanVienBean;

/**
 * Servlet implementation class adminDuyetDangKyNghiController
 */
@WebServlet("/adminDuyetDangKyNghiController")
public class adminDuyetDangKyNghiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDuyetDangKyNghiController() {
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
			adminDangKyNghiBo dkbo = new adminDangKyNghiBo();
			
			String[] gt= request.getParameterValues("check");
			String duyet= request.getParameter("btn-duyet");
			String tuchoi= request.getParameter("btn-tuchoi");
			if(duyet != null && gt != null) {
				for(String checkbox:gt) {
					dkbo.UpdateDangKyNghi(Long.parseLong(checkbox), duyet);
				}
		    }
			if(tuchoi != null && gt != null) {
				for(String checkbox:gt) {
					dkbo.UpdateTuChoiDangKyNghi(Long.parseLong(checkbox), tuchoi);
				}
			}
		
			RequestDispatcher rd = request.getRequestDispatcher("adminDangKyNghiController");
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
