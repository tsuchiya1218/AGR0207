package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import model.Utilization;

public class UtilizationDao {
	private Connection con = null;
	
	public UtilizationDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.exit(1);
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://10.42.129.142:3306/"
					+ "20gr27?characterEncoding=UTF-8","20gr27","20gr27");
		}catch(SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
	public void connectionClose() {
		try {
			con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Utilization> findAll() {
		String sql = "SELECT * FROM Utilization";
		ArrayList<Utilization> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Utilization>();
			while( rs.next() ) {
				Utilization u = new Utilization();
				u.setU_id( rs.getString("u_id") );
				u.setM_id( rs.getString("m_id") );
				u.setR_id( rs.getString("r_id") );
				u.setS_id( rs.getString("s_id") );
				u.setU_num( rs.getInt("u_num") );
				u.setU_time( rs.getTimestamp("u_time") );
				u.setU_enterDay( rs.getTimestamp("u_enterday") );
				u.setU_Etime( rs.getInt("u_Etime") );
				u.setU_reservePrice( rs.getInt("u_reservePrice") );
				u.setU_roomPrice( rs.getInt("u_roomPrice") );
				u.setU_Eprice( rs.getInt("u_Eprice") );
				u.setU_payment( rs.getInt("u_payment") );
				u.setU_pay( rs.getString("u_pay") );
				u.setU_enterJudge( rs.getString("u_enterJudge") );
				u.setU_enterTime(rs.getTimestamp("u_enterTime"));
				u.setU_exitTime(rs.getTimestamp("u_exitTime"));
				ary.add(u);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public String findMaxId() {
		String sql = "SELECT max(u_id) FROM Utilization";
		String id = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				id = rs.getString("max(u_id)");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return id;
	}
	public ArrayList<String> findUtilization( String m_id,String day ) {
		String sql = "SELECT MIN(u_enterDay),s_id,u_id FROM utilization WHERE m_id='"+m_id+"' AND "
				+ "u_enterDay =(SELECT MIN(u_enterDay) FROM utilization WHERE u_enterDay >= '"+day+"') AND u_enterJudge = '未入室'";
		ArrayList<String> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				ary = new ArrayList<>();
				ary.add(rs.getString("MIN(u_enterDay)"));
				ary.add(rs.getString("s_id"));
				ary.add(rs.getString("u_id"));
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public Utilization Utilization(String u_id) {
		String sql = "SELECT * FROM utilization WHERE u_id='"+u_id+"'";
		Utilization u = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				u = new Utilization();
				u.setU_id(rs.getString("u_id"));
				u.setM_id(rs.getString("m_id"));
				u.setR_id(rs.getString("r_id"));
				u.setS_id(rs.getString("s_id"));
				u.setU_num(rs.getInt("u_num"));
				u.setU_time(rs.getTimestamp("u_time"));
				u.setU_enterDay(rs.getTimestamp("u_enterDay"));
				u.setU_reservePrice(rs.getInt("u_reservePrice"));
				u.setU_roomPrice(rs.getInt("u_roomPrice"));
				u.setU_Eprice( rs.getInt("u_Eprice") );
				u.setU_payment( rs.getInt("u_payment") );
				u.setU_pay( rs.getString("u_pay") );
				u.setU_enterJudge( rs.getString("u_enterJudge") );
				u.setU_enterTime(rs.getTimestamp("u_enterTime"));
				u.setU_exitTime(rs.getTimestamp("u_exitTime"));
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return u;
	}
	public ArrayList<Utilization> findAllUtilization(String m_id,String day) {
		String sql = "SELECT * FROM utilization WHERE m_id='"+m_id+"' AND "
				+ "u_enterDay >='" + day + "' ORDER BY u_enterDay";
		ArrayList<Utilization> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Utilization>();
			while( rs.next() ) {
				Utilization u = new Utilization();
				u.setU_id(rs.getString("u_id"));
				u.setM_id(rs.getString("m_id"));
				u.setR_id(rs.getString("r_id"));
				u.setS_id(rs.getString("s_id"));
				u.setU_num(rs.getInt("u_num"));
				u.setU_time(rs.getTimestamp("u_time"));
				u.setU_enterDay(rs.getTimestamp("u_enterDay"));
				u.setU_reservePrice(rs.getInt("u_reservePrice"));
				u.setU_roomPrice(rs.getInt("u_roomPrice"));
				u.setU_Eprice( rs.getInt("u_Eprice") );
				u.setU_payment( rs.getInt("u_payment") );
				u.setU_pay( rs.getString("u_pay") );
				u.setU_enterJudge( rs.getString("u_enterJudge") );
				u.setU_enterTime(rs.getTimestamp("u_enterTime"));
				u.setU_exitTime(rs.getTimestamp("u_exitTime"));
				ary.add(u);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}

	public void setUtilization(ArrayList<String> ary) {
		ArrayList<String> a = ary;
		String sql = "INSERT INTO Utilization (u_id,m_id,r_id,s_id,u_num,u_time,u_enterDay,u_reservePrice,u_roomPrice,u_pay) "
				+ "values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			for(String s : a) {
				System.out.println(s);
			}

			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, a.get(0));
			ps.setString(2, a.get(1));
			ps.setString(3, a.get(2));
			ps.setString(4, a.get(3));
			ps.setString(5, a.get(4));
			ps.setString(6, a.get(5));
			ps.setString(7, a.get(6));
			ps.setString(8, a.get(7));
			ps.setString(9, a.get(8));
			ps.setString(10, a.get(9));
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateU_num(String u_id,String u_num) {
		String sql = "UPDATE Utilization SET u_num = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, u_num);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateR_id(String u_id,String r_id) {
		String sql = "UPDATE Utilization SET r_id = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, r_id);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateU_enterDay(String u_id,String time) {
		String sql = "UPDATE Utilization SET u_enterDay = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, time);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateU_time(String u_id,String time) {
		String sql = "UPDATE Utilization SET u_time = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, time);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateU_roomPrice(String u_id,String price) {
		String sql = "UPDATE Utilization SET u_roomPrice = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, price);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateU_reservePrice(String u_id,String price) {
		String sql = "UPDATE Utilization SET u_reservePrice = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, price);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateU_payment(String u_id,int payment) {
		String sql = "UPDATE Utilization SET u_payment = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setInt(1, payment);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
	public void updateU_enterJudge(String u_id,String enterJudge) {
		String sql = "UPDATE Utilization SET u_enterJudge = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, enterJudge);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateU_enterTime(String u_id,String enterTime) {
		String sql = "UPDATE Utilization SET u_enterTime = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, enterTime);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateU_exitTime(String u_id,String exitTime) {
		String sql = "UPDATE Utilization SET u_exitTime = ? WHERE u_id='" + u_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, exitTime);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void delete(String u_id) {
		String sql = "DELETE FROM utilization WHERE u_id='"+ u_id + "'";
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<String> findEnterJudge1(String m_id) {
		String sql = "SELECT u_id,u_enterJudge FROM utilization WHERE m_id='"+ m_id + "'AND u_enterJudge = '未入室'";
		ArrayList<String> ary = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				ary = new ArrayList<String>();
				ary.add(rs.getString("u_id"));
				ary.add(rs.getString("u_enterJudge"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ary;
	}
	public ArrayList<String> findEnterJudge(String m_id) {
		String sql = "SELECT u_id,u_enterJudge FROM utilization WHERE m_id='"+ m_id + "'AND u_enterJudge = '入室中'";
		ArrayList<String> ary = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				ary = new ArrayList<String>();
				ary.add(rs.getString("u_id"));
				ary.add(rs.getString("u_enterJudge"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ary;
	}
	public String findR_id(String u_id) {
		String sql = "SELECT r_id FROM utilization WHERE u_id='"+ u_id + "'";
		String r_id = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				r_id = rs.getString("r_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r_id;
	}
	public String findEnterTime(String r_id,String time) {
		String sql = "SELECT MIN(u_enterDay) FROM utilization "
				+ "WHERE r_id='"+r_id+"'AND u_enterDay >= '"+time+"'";
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		Timestamp u_enterDay = null;
		String s = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				u_enterDay = rs.getTimestamp("MIN(u_enterDay)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if( u_enterDay != null ) {
			Date date = new Date(u_enterDay.getTime());
			s = sdf.format(date);
		}
		return s;
	}
	public String findUseEnterTime(String r_id) {
		String sql = "SELECT u_enterTime FROM utilization WHERE r_id='"+ r_id + "'AND u_enterJudge='入室中'";
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		Timestamp u_enterTime = null;
		String s = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				u_enterTime = rs.getTimestamp("u_enterTime");
				s = sdf.format(u_enterTime);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	public String findUseExitTime(String r_id) {
		String sql = "SELECT u_enterTime,u_time,u_Etime FROM utilization WHERE r_id='"+ r_id + "'AND u_enterJudge='入室中'";
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat hh = new SimpleDateFormat("HH");
		SimpleDateFormat mm = new SimpleDateFormat("mm");
		Timestamp u_enterTime = null;
		Timestamp u_time = null;
		Timestamp u_Etime = null;
		String s = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				u_enterTime = rs.getTimestamp("u_enterTime");
				u_time = rs.getTimestamp("u_time");
				u_Etime = rs.getTimestamp("u_Etime");
			}
			Calendar cal = Calendar.getInstance();
			cal.setTime(u_enterTime);
			cal.add(Calendar.HOUR,Integer.parseInt(hh.format(u_time)));
			cal.add(Calendar.MINUTE,Integer.parseInt(mm.format(u_time)));
			if(u_Etime != null) {
				cal.add(Calendar.HOUR,Integer.parseInt(hh.format(u_Etime)));
				cal.add(Calendar.MINUTE,Integer.parseInt(mm.format(u_Etime)));
			}
			Date date = cal.getTime();
			s = sdf.format(date);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	public int findUseNum(String r_id) {
		String sql = "SELECT u_num FROM utilization WHERE r_id='"+ r_id + "'AND u_enterJudge='入室中'";
		int u_num = 0;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				u_num = rs.getInt("u_num");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u_num;
	}
	public ArrayList<Utilization> findRoom(String r_id,String time) {
		String sql = "SELECT * FROM utilization WHERE r_id='"+ r_id
				+ "'AND u_enterDay BETWEEN '"+time+" 00:00:00' AND '"+time+" 23:59:59' ORDER BY u_enterDay";
		ArrayList<Utilization> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Utilization>();
			while( rs.next() ) {
				Utilization u = new Utilization();
				u.setU_id(rs.getString("u_id"));
				u.setM_id(rs.getString("m_id"));
				u.setR_id(rs.getString("r_id"));
				u.setS_id(rs.getString("s_id"));
				u.setU_num(rs.getInt("u_num"));
				u.setU_time(rs.getTimestamp("u_time"));
				u.setU_enterDay(rs.getTimestamp("u_enterDay"));
				u.setU_reservePrice(rs.getInt("u_reservePrice"));
				u.setU_roomPrice(rs.getInt("u_roomPrice"));
				u.setU_Eprice( rs.getInt("u_Eprice") );
				u.setU_payment( rs.getInt("u_payment") );
				u.setU_pay( rs.getString("u_pay") );
				u.setU_enterJudge( rs.getString("u_enterJudge") );
				u.setU_enterTime(rs.getTimestamp("u_enterTime"));
				u.setU_exitTime(rs.getTimestamp("u_exitTime"));
				ary.add(u);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public ArrayList<Utilization> searchMember(String m_id) {
		String sql = "SELECT * FROM Utilization WHERE m_id ='"+m_id+"'";
		ArrayList<Utilization> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Utilization>();
			while( rs.next() ) {
				Utilization u = new Utilization();
				u.setU_id( rs.getString("u_id") );
				u.setM_id( rs.getString("m_id") );
				u.setR_id( rs.getString("r_id") );
				u.setS_id( rs.getString("s_id") );
				u.setU_num( rs.getInt("u_num") );
				u.setU_time( rs.getTimestamp("u_time") );
				u.setU_enterDay( rs.getTimestamp("u_enterday") );
				u.setU_Etime( rs.getInt("u_Etime") );
				u.setU_reservePrice( rs.getInt("u_reservePrice") );
				u.setU_roomPrice( rs.getInt("u_roomPrice") );
				u.setU_Eprice( rs.getInt("u_Eprice") );
				u.setU_payment( rs.getInt("u_payment") );
				u.setU_pay( rs.getString("u_pay") );
				u.setU_enterJudge( rs.getString("u_enterJudge") );
				u.setU_enterTime(rs.getTimestamp("u_enterTime"));
				u.setU_exitTime(rs.getTimestamp("u_exitTime"));
				ary.add(u);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public Utilization searchTodayU(String r_id,String time) {
		String sql = "SELECT * FROM utilization WHERE r_id='"+r_id+"' "
				+ "AND u_enterDay BETWEEN '"+time+" 00:00:00' AND '" +time+" 23:59:59'";
		Utilization u = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				u = new Utilization();
				u.setU_id(rs.getString("u_id"));
				u.setM_id(rs.getString("m_id"));
				u.setR_id(rs.getString("r_id"));
				u.setS_id(rs.getString("s_id"));
				u.setU_num(rs.getInt("u_num"));
				u.setU_time(rs.getTimestamp("u_time"));
				u.setU_enterDay(rs.getTimestamp("u_enterDay"));
				u.setU_reservePrice(rs.getInt("u_reservePrice"));
				u.setU_roomPrice(rs.getInt("u_roomPrice"));
				u.setU_Eprice( rs.getInt("u_Eprice") );
				u.setU_payment( rs.getInt("u_payment") );
				u.setU_pay( rs.getString("u_pay") );
				u.setU_enterJudge( rs.getString("u_enterJudge") );
				u.setU_enterTime(rs.getTimestamp("u_enterTime"));
				u.setU_exitTime(rs.getTimestamp("u_exitTime"));
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return u;
	}
	public int priceToday(String time) {
		String sql = "SELECT u_reservePrice,u_roomPrice,u_Eprice FROM utilization "
				+ "WHERE u_enterDay BETWEEN '"+time+" 00:00:00' AND '"+time+" 23:59:59'";
		int total = 0;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				total += rs.getInt("u_reservePrice");
				total += rs.getInt("u_roomPrice");
				total += rs.getInt("u_Eprice");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return total;
	}
	public int priceMonth(String time) {
		String sql = "SELECT u_reservePrice,u_roomPrice,u_Eprice FROM utilization "
				+ "WHERE u_enterDay BETWEEN '"+time+"01 00:00:00' AND '"+time+"31 23:59:59'";
		int total = 0;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				total += rs.getInt("u_reservePrice");
				total += rs.getInt("u_roomPrice");
				total += rs.getInt("u_Eprice");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return total;
	}
	public int priceYear(String time) {
		String sql = "SELECT u_reservePrice,u_roomPrice,u_Eprice FROM utilization "
				+ "WHERE u_enterDay BETWEEN '"+time+"-01-01 00:00:00' AND '"+time+"-12-31 23:59:59'";
		int total = 0;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				total += rs.getInt("u_reservePrice");
				total += rs.getInt("u_roomPrice");
				total += rs.getInt("u_Eprice");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return total;
	}
	public boolean check(String u_id) {
		String sql = "SELECT u_id FROM Utilization WHERE u_id = '"+u_id + "'";
		String id = null;
		boolean b = false;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				id = rs.getString("u_id");
				if( id!=null ) {
					b = true;
				}
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return b;
	}
}
