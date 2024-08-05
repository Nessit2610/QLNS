package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import admindao.ketnoiDB;
import bean.ThongSoKiThuatBean;

public class ThongSoKyThuatDao {
	public ThongSoKiThuatBean GetThongSo() throws Exception{
		ThongSoKiThuatBean ds = null;
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "select * from ThongSoKiThuat";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) { 
			long Luong = rs.getLong("Luong");
			int SoCaLamMin = rs.getInt("SoCaLamMin"); 
			int SoNVMotCaMin = rs.getInt("SoNVMotCaMin");
			int SoNVMotCaMax = rs.getInt("SoNVMotCaMax");
			float HSL = rs.getFloat("HSL");
			float HSLOT = rs.getFloat("HSLOT");;
			float HSLPhat = rs.getFloat("HSLPhat");
			ds = new ThongSoKiThuatBean(Luong,SoCaLamMin, SoNVMotCaMin, SoNVMotCaMax, HSL, HSLOT, HSLPhat);
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
}
