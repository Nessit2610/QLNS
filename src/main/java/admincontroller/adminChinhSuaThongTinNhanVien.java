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
 * Servlet implementation class adminChinhSuaThongTinNhanVien
 */
@WebServlet("/adminChinhSuaThongTinNhanVien")
public class adminChinhSuaThongTinNhanVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminChinhSuaThongTinNhanVien() {
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
			adminNhanVienBo adnvbo = new adminNhanVienBo();

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
			String stk = request.getParameter("số tài khoản");
			
			if (manv != null && Boolean.parseBoolean(trangThaiCongViec) == false) {
				adnvbo.UpdateNhanVien(manv, tennv, macv, Date.valueOf(ngaySinh), Boolean.parseBoolean(gioiTinh), email,
										sdt, DVCT, chucDanh, tenDangNhap, matKhau,
										Boolean.parseBoolean(trangThaiCongViec), Date.valueOf(ngayVaoLam), stk);
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
				 
				adnvbo.UpdateNhanVien(manv, tennv, macv, Date.valueOf(ngaySinh), Boolean.parseBoolean(gioiTinh), email,
						 				sdt, DVCT, chucDanh, tenDangNhap, matKhau,
						 				Boolean.parseBoolean(trangThaiCongViec), Date.valueOf(ngayVaoLam), stk); 
				System.out.println("DaSuaThongTin"); 
			}
			 
			 

			RequestDispatcher rd = request.getRequestDispatcher("adminNhanVienController");
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
