package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.DangKyNghiBean;


public class DangKyNghidao {
	public ArrayList<DangKyNghiBean> GetAllDKN() throws Exception{
		ArrayList<DangKyNghiBean> ds = new ArrayList<DangKyNghiBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichNghi";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long maDangkyNghi = rs.getLong("MaDKNghi");
			String maNV = rs.getString("MaNV");
			String maLoaiCa = rs.getString("MaLoaiCa");
			Date ngayDK = rs.getDate("NgayDK");
			int duyet = rs.getInt("Duyet");
			String nguoiDuyet = rs.getString("NguoiDuyet");
			String lyDo = rs.getString("LyDo");
			ds.add(new DangKyNghiBean(maDangkyNghi, maNV, maLoaiCa, ngayDK, duyet, nguoiDuyet, lyDo));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public ArrayList<DangKyNghiBean> GetDKNbyMaNV_Month_Year(String manv, int month, int year) throws Exception{
		ArrayList<DangKyNghiBean> ds = new ArrayList<DangKyNghiBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichNghi where MaNV = ? and month(NgayDK)= ? and YEAR(NgayDK) = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, manv);
		cmd.setInt(2, month);
		cmd.setInt(3, year);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long maDangkyNghi = rs.getLong("MaDKNghi");
			String maNV = rs.getString("MaNV");
			String maLoaiCa = rs.getString("MaLoaiCa");
			Date ngayDK = rs.getDate("NgayDK");
			int duyet = rs.getInt("Duyet");
			String nguoiDuyet = rs.getString("NguoiDuyet");
			String lyDo = rs.getString("LyDo");
			ds.add(new DangKyNghiBean(maDangkyNghi, maNV, maLoaiCa, ngayDK, duyet, nguoiDuyet, lyDo));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public void insertDKN(DangKyNghiBean dkn) throws Exception {
	    ketnoiDB kn = new ketnoiDB();
	    kn.ketnoi();
	    String sql = "INSERT INTO DangKyLichNghi (MaNV, MaLoaiCa, NgayDK, Duyet, NguoiDuyet, LyDo) VALUES (?, ?, ?, ?, ?, ?)";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, dkn.getMaNV());
	    cmd.setString(2, dkn.getMaLoaiCa());
	    cmd.setDate(3, new java.sql.Date(dkn.getNgayDK().getTime()));
	    cmd.setInt(4, dkn.getDuyet());
	    cmd.setString(5, dkn.getNguoiDuyet());
	    cmd.setString(6, dkn.getLyDo());
	    cmd.executeUpdate();
	    kn.cn.close();
	}
	public ArrayList<DangKyNghiBean> getDSDKNtheoNgay(String NgayDK) throws Exception{
		ArrayList<DangKyNghiBean> ds = new ArrayList<DangKyNghiBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichNghi where NgayDK=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, NgayDK);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long maDangkyNghi = rs.getLong("MaDKNghi");
			String maNV = rs.getString("MaNV");
			String maLoaiCa = rs.getString("MaLoaiCa");
			Date ngayDK = rs.getDate("NgayDK");
			int duyet = rs.getInt("Duyet");
			String nguoiDuyet = rs.getString("NguoiDuyet");
			String lyDo = rs.getString("LyDo");
			ds.add(new DangKyNghiBean(maDangkyNghi, maNV, maLoaiCa, ngayDK, duyet, nguoiDuyet, lyDo));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public void DuyetLichNghi(String Duyet, String NguoiDuyet, String NgayDK, String MaNV) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "update DangKyLichNghi set Duyet=?, NguoiDuyet =? where NgayDK=? and MaNV=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, Duyet);
		cmd.setString(2, NguoiDuyet);
		cmd.setString(3, NgayDK);
		cmd.setString(4, MaNV);
		cmd.executeUpdate();
		System.out.println("Duyet thanh cong");
		kn.cn.close();
		cmd.close();
	}
	public void DanhVangKhongPhep(String MaNV, String MaLoaiCa, String NgayDK ,String NguoiDuyet) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "insert into DangKyLichNghi (MaNV, MaLoaiCa, NgayDK, Duyet, NguoiDuyet, LyDo) VALUES (?, ?, ?, 3, ?, 'Vắng không phép')";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, MaNV);
		cmd.setString(2, MaLoaiCa);
		cmd.setString(3, NgayDK);
		cmd.setString(4, NguoiDuyet);
		cmd.executeUpdate();
		System.out.println("Duyet thanh cong");
		kn.cn.close();
		cmd.close();
	}
	public void XoaLichLam(String MaNV, String MaLoaiCa, String NgayDK) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="DELETE FROM DangKyLichLam WHERE MaNV = ? AND MaLoaiCa = ? AND NgayDK = ?;";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, MaNV);
		cmd.setString(2, MaLoaiCa);
		cmd.setString(3, NgayDK);
		cmd.executeUpdate();
		cmd.close();
		System.out.println("Da xoa");
		kn.cn.close();
	}
	public void XoaLichNghi(String MaNV, String MaLoaiCa, String NgayDK) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql="DELETE FROM DangKyLichNghi WHERE MaNV = ? AND MaLoaiCa = ? AND NgayDK = ? AND Duyet=2;";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, MaNV);
		cmd.setString(2, MaLoaiCa);
		cmd.setString(3, NgayDK);
		cmd.executeUpdate();
		cmd.close();
		System.out.println("Da xoa");
		kn.cn.close();
	}
	public ArrayList<DangKyNghiBean> getNVvangkhongphep(String manv, int month, int year) throws Exception{
		ArrayList<DangKyNghiBean> ds = new ArrayList<DangKyNghiBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from DangKyLichNghi where MaNV = ? and month(NgayDK)= ? and YEAR(NgayDK) = ? and Duyet=3";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, manv);
		cmd.setInt(2, month);
		cmd.setInt(3, year);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long maDangkyNghi = rs.getLong("MaDKNghi");
			String maNV = rs.getString("MaNV");
			String maLoaiCa = rs.getString("MaLoaiCa");
			Date ngayDK = rs.getDate("NgayDK");
			int duyet = rs.getInt("Duyet");
			String nguoiDuyet = rs.getString("NguoiDuyet");
			String lyDo = rs.getString("LyDo");
			ds.add(new DangKyNghiBean(maDangkyNghi, maNV, maLoaiCa, ngayDK, duyet, nguoiDuyet, lyDo));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
	public ArrayList<DangKyNghiBean> getDS_DKLN_BDKT(String ngayBatDau, String ngayKetThuc) throws Exception{
		ArrayList<DangKyNghiBean> ds = new ArrayList<DangKyNghiBean>();
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "SELECT * FROM DangKyLichNghi WHERE NgayDK BETWEEN ? AND ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, ngayBatDau);
		cmd.setString(2, ngayKetThuc);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			Long maDangkyNghi = rs.getLong("MaDKNghi");
			String maNV = rs.getString("MaNV");
			String maLoaiCa = rs.getString("MaLoaiCa");
			Date ngayDK = rs.getDate("NgayDK");
			int duyet = rs.getInt("Duyet");
			String nguoiDuyet = rs.getString("NguoiDuyet");
			String lyDo = rs.getString("LyDo");
			ds.add(new DangKyNghiBean(maDangkyNghi, maNV, maLoaiCa, ngayDK, duyet, nguoiDuyet, lyDo));
		}
		kn.cn.close();
		rs.close();
		return ds;
	}
}
