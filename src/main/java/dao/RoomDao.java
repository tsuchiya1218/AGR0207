package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Room;

public class RoomDao {
	private Connection con = null;
	
	public RoomDao() {
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
	public ArrayList<Room> room() {
		String sql = "SELECT * FROM room";
		ArrayList<Room> rlist = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			rlist = new ArrayList<>();
			while( rs.next() ) {
				Room r = new Room();
				r.setR_id(rs.getString("r_id"));
				r.setS_id(rs.getString("s_id"));
				r.setModel_id(rs.getString("model_id"));
				r.setW_id(rs.getString("w_id"));
				r.setR_number(rs.getInt("r_number"));
				r.setR_clean(rs.getString("r_clean"));
				rlist.add(r);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return rlist;
	}
	public ArrayList<Room> room(String s_id) {
		String sql = "SELECT * FROM room WHERE s_id = '"+s_id+"'";
		ArrayList<Room> rlist = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			rlist = new ArrayList<>();
			while( rs.next() ) {
				Room r = new Room();
				r.setR_id(rs.getString("r_id"));
				r.setS_id(rs.getString("s_id"));
				r.setModel_id(rs.getString("model_id"));
				r.setW_id(rs.getString("w_id"));
				r.setR_number(rs.getInt("r_number"));
				r.setR_clean(rs.getString("r_clean"));
				rlist.add(r);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return rlist;
	}
	public ArrayList<Room> findAllRoom(String s_id) {
		String sql = "SELECT * FROM room WHERE r_clean like '空き'AND s_id = '"+s_id+"'";
		ArrayList<Room> rlist = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			rlist = new ArrayList<>();
			while( rs.next() ) {
				Room r = new Room();
				r.setR_id(rs.getString("r_id"));
				r.setS_id(rs.getString("s_id"));
				r.setModel_id(rs.getString("model_id"));
				r.setW_id(rs.getString("w_id"));
				r.setR_number(rs.getInt("r_number"));
				r.setR_clean(rs.getString("r_clean"));
				rlist.add(r);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return rlist;
	}
	
	public ArrayList<Room> findRoom(String s_id) {
		String sql = "SELECT * FROM room WHERE r_clean like '空き'AND s_id = '"+s_id+"'";
		ArrayList<Room> rlist = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			rlist = new ArrayList<>();
			while( rs.next() ) {
				Room r = new Room();
				r.setR_id(rs.getString("r_id"));
				r.setS_id(rs.getString("s_id"));
				r.setModel_id(rs.getString("model_id"));
				r.setW_id(rs.getString("w_id"));
				r.setR_number(rs.getInt("r_number"));
				r.setR_clean(rs.getString("r_clean"));
				rlist.add(r);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return rlist;
	}
	public String findModelId(String r_id) {
		String sql = "SELECT model_id FROM room WHERE r_id = '"+r_id+"'";
		String model_id = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				model_id = rs.getString("model_id");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return model_id;
	}
	public String findR_clean(String r_id) {
		String sql = "SELECT r_clean FROM room WHERE r_id = '"+r_id+"'";
		String r_clean = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				r_clean = rs.getString("r_clean");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return r_clean;
	}
	public ArrayList<Room> findClean() {
		String sql = "SELECT * FROM room WHERE r_clean = '未清掃' OR r_clean = '清掃中'";
		ArrayList<Room> rlist = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			rlist = new ArrayList<>();
			while( rs.next() ) {
				Room r = new Room();
				r.setR_id(rs.getString("r_id"));
				r.setS_id(rs.getString("s_id"));
				r.setModel_id(rs.getString("model_id"));
				r.setW_id(rs.getString("w_id"));
				r.setR_number(rs.getInt("r_number"));
				r.setR_clean(rs.getString("r_clean"));
				rlist.add(r);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return rlist;
	}
	public void updateR_clean(String r_id,String r_clean) {
		String sql = "UPDATE room SET r_clean = ? WHERE r_id='" + r_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, r_clean);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateW_id(String r_id,String w_id) {
		String sql = "UPDATE room SET w_id = ? WHERE r_id='" + r_id + "'";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, w_id);
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
