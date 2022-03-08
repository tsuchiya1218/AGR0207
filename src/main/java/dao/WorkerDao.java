package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Worker;

public class WorkerDao {
	private Connection con = null;

	public WorkerDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.exit(1);
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://10.42.129.142:3306/" + "20gr27?characterEncoding=UTF-8",
					"20gr27", "20gr27");
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(1);
		}
	}

	public void connectionClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Worker> findAll() {
		String sql = "SELECT * FROM Worker WHERE w_id !='NO'";
		ArrayList<Worker> ary = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Worker>();
			while (rs.next()) {
				Worker w = new Worker();
				w.setW_id(rs.getString("w_id"));
				w.setW_name(rs.getString("w_name"));
				w.setW_pass(rs.getString("w_pass"));
				w.setW_day(rs.getString("w_day"));
				ary.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ary;
	}
	public String findName(String w_id) {
		String sql = "SELECT w_name FROM Worker WHERE w_id = '" + w_id + "'";
		String w_name = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				w_name = rs.getString("w_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return w_name;
	}
	public String findpass(String w_id) {
		String sql = "SELECT w_pass FROM Worker WHERE w_id = '" + w_id + "'";
		String w_pass = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				w_pass = rs.getString("w_pass");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return w_pass;
	}
	public boolean checkId(String w_id) {
		String sql = "SELECT w_id FROM Worker WHERE w_id ='"+w_id+"'";
		boolean b = true;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				Worker w = new Worker();
				w.setW_id(rs.getString("w_id"));
				b = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
	public void setWorker(ArrayList<String> ary) {
		ArrayList<String> a = ary;
		String sql = "INSERT INTO Worker (w_id,w_name,w_day) "
				+ "values(?,?,?)";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, a.get(0));
			ps.setString(2, a.get(1));
			ps.setString(3, a.get(2));
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteWorker(String w_id) {
		String sql = "DELETE FROM Worker WHERE w_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,w_id);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}