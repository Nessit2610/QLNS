package admindao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ThongSoKiThuatBean;


public class adminThongSoKyThuatdao {
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
	public void SuaThongSo(long luong ,int SoCaLamMin, int SoNVMotCaMin ,int SoNVMotCaMax ,float HSL, float HSLOT, float HSLPhat) throws Exception{
		ketnoiDB kn = new ketnoiDB();
		kn.ketnoi();
		String sql = "Update ThongSoKiThuat Set Luong=?, SoCaLamMin = ? ,SoNVMotCaMin = ?,SoNVMotCaMax = ?, HSL= ?, HSLOT=?, HSLPhat= ? ";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, luong);
		cmd.setInt(2, SoCaLamMin);
		cmd.setInt(3, SoNVMotCaMin);
		cmd.setInt(4, SoNVMotCaMax);
		cmd.setFloat(5, HSL);
		cmd.setFloat(6, HSLOT);
		cmd.setFloat(7, HSLPhat);
		cmd.executeUpdate();
		kn.cn.close();
	}
}