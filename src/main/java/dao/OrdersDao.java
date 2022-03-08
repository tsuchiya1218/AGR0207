package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Orders;

public class OrdersDao {
	private Connection con = null;
	
	public OrdersDao() {
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
	public ArrayList<Orders> findOrders(String u_id) {
		String sql = "SELECT * FROM orders WHERE u_id='" + u_id + "'";
		ArrayList<Orders> olist = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			olist = new ArrayList<>();
			while( rs.next() ) {
				Orders o = new Orders();
				o.setO_id(rs.getInt("o_id"));
				o.setU_id(rs.getString("u_id"));
				o.setG_id(rs.getString("g_id"));
				o.setW_id(rs.getString("w_id"));
				o.setO_quantity(rs.getInt("o_quantity"));
				o.setO_situation(rs.getString("o_situation"));
				o.setO_time(rs.getTimestamp("o_time"));
				o.setO_makeTime(rs.getTimestamp("o_makeTime"));
				o.setO_offerTime(rs.getTimestamp("o_offerTime"));
				olist.add(o);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return olist;
	}
	public void setOrder(ArrayList<String> ary) {
		ArrayList<String> a = ary;
		String sql = "INSERT INTO orders (u_id,g_id,o_quantity,o_time) "
				+ "values(?,?,?,?)";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, a.get(0));
			ps.setString(2, a.get(1));
			ps.setString(3, a.get(2));
			ps.setString(4, a.get(3));
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public String findMaxId() {
		String sql = "SELECT max(o_id) FROM orders";
		String id = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				id = rs.getString("max(o_id)");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return id;
	}
	public ArrayList<Orders> findTodayOrder(String time) {
		String sql = "SELECT * FROM orders WHERE o_time "
				+ "BETWEEN' "+time+" 00:00:00' AND '"+time+" 23:59:59'";
		ArrayList<Orders> ary = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<>();
			while( rs.next() ) {
				Orders o = new Orders();
				o.setO_id(rs.getInt("o_id"));
				o.setU_id(rs.getString("u_id"));
				o.setG_id(rs.getString("g_id"));
				o.setW_id(rs.getString("w_id"));
				o.setO_quantity(rs.getInt("o_quantity"));
				o.setO_situation(rs.getString("o_situation"));
				o.setO_time(rs.getTimestamp("o_time"));
				o.setO_makeTime(rs.getTimestamp("o_makeTime"));
				o.setO_offerTime(rs.getTimestamp("o_offerTime"));
				ary.add(o);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public ArrayList<Orders> findMonthOrder(String time) {
		String sql = "SELECT * FROM orders WHERE o_time "
				+ "BETWEEN' "+time+"01 00:00:00' AND '"+time+"31 23:59:59'";
		ArrayList<Orders> ary = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<>();
			while( rs.next() ) {
				Orders o = new Orders();
				o.setO_id(rs.getInt("o_id"));
				o.setU_id(rs.getString("u_id"));
				o.setG_id(rs.getString("g_id"));
				o.setW_id(rs.getString("w_id"));
				o.setO_quantity(rs.getInt("o_quantity"));
				o.setO_situation(rs.getString("o_situation"));
				o.setO_time(rs.getTimestamp("o_time"));
				o.setO_makeTime(rs.getTimestamp("o_makeTime"));
				o.setO_offerTime(rs.getTimestamp("o_offerTime"));
				ary.add(o);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public ArrayList<Orders> findYearOrder(String time) {
		String sql = "SELECT * FROM orders WHERE o_time "
				+ "BETWEEN' "+time+"-01-01 00:00:00' AND '"+time+"-12-31 23:59:59'";
		ArrayList<Orders> ary = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<>();
			while( rs.next() ) {
				Orders o = new Orders();
				o.setO_id(rs.getInt("o_id"));
				o.setU_id(rs.getString("u_id"));
				o.setG_id(rs.getString("g_id"));
				o.setW_id(rs.getString("w_id"));
				o.setO_quantity(rs.getInt("o_quantity"));
				o.setO_situation(rs.getString("o_situation"));
				o.setO_time(rs.getTimestamp("o_time"));
				o.setO_makeTime(rs.getTimestamp("o_makeTime"));
				o.setO_offerTime(rs.getTimestamp("o_offerTime"));
				ary.add(o);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public void updatew_id(String o_id,String w_id) {
		String sql = "UPDATE orders SET w_id = ? WHERE o_id='" + o_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1,w_id);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateO_situation(String o_id,String s) {
		String sql = "UPDATE Orders SET o_situation = ? WHERE o_id='" + o_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, s);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateO_makeTime(String o_id,String time) {
		String sql = "UPDATE Orders SET o_makeTime = ? WHERE o_id='" + o_id + "'";
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
	public void updateO_offerTime(String o_id,String time) {
		String sql = "UPDATE Orders SET o_offerTime = ? WHERE o_id='" + o_id + "'";
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

}
