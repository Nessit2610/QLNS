package controller;

import java.io.IOException;

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
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tendangnhap = request.getParameter("tendangnhap");
		String matkhau = request.getParameter("matkhau");
		NhanVienBo nvbo = new NhanVienBo();
		String url = "";
		HttpSession session = request.getSession();
		try {
			NhanVienBean nhanvien = null;
			if(tendangnhap != null && matkhau != null){					
				nhanvien = nvbo.getNhanVienTheoTKvaMK(tendangnhap, matkhau);
					if(nhanvien != null && nhanvien.getTrangThaiCongViec()==true){
						url = "index";
						session.setAttribute("nhanvien", nhanvien);
					}else {
						url = "login.jsp";
						request.setAttribute("baoloilogin", "Sai tên đăng nhập hoặc mật khẩu!");
						request.setAttribute("tendangnhap", tendangnhap);
					}
			}else {
				url = "login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
