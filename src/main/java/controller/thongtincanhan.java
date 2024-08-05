package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.NhanVienBean;
import bo.NhanVienBo;

/**
 * Servlet implementation class thongtincanhan
 */
@WebServlet("/thongtincanhan")
public class thongtincanhan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thongtincanhan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		NhanVienBo nvbo = new NhanVienBo();
		try {
			NhanVienBean nv = (NhanVienBean)session.getAttribute("nhanvien");
			String MaNV = nv.getMaNV();
			String name = request.getParameter("name");
			String gioitinh = request.getParameter("gioitinh");
			Boolean gt = Boolean.parseBoolean(gioitinh);
			String ngaysinh = request.getParameter("ngaysinh");
			SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
			Date ngay = dd.parse(ngaysinh);
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phonenumber");
			
			session.setAttribute("nhanvien", nvbo.getnhanvientheoma(MaNV));
			RequestDispatcher rd = request.getRequestDispatcher("NHANVIENttcn.jsp");
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
