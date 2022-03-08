package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Goods;

public class GoodsDao {
	private Connection con = null;
	
	public GoodsDao() {
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
	public String findName(String g_id) {
		String sql = "SELECT g_name FROM goods WHERE g_id ='" + g_id + "'";
		String g_name = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				Goods g = new Goods();
				g_name = rs.getString("g_name");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return g_name;
	}
	public int findPrice(String g_id) {
		String sql = "SELECT g_price FROM goods WHERE g_id ='" + g_id + "'";
		int g_price = 0;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				Goods g = new Goods();
				g_price = rs.getInt("g_price");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return g_price;
	}
	public ArrayList<Goods> findSoftDrink() {
		String sql = "SELECT * FROM goods WHERE g_id like 's%'";
		ArrayList<Goods> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Goods>();
			while( rs.next() ) {
				Goods g = new Goods();
				g.setG_id(rs.getString("g_id"));
				g.setG_name( rs.getString("g_name") );
				g.setG_imgName( rs.getString("g_imgName") );
				g.setG_price( rs.getInt("g_price") );
				ary.add(g);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public ArrayList<Goods> findAlcohol() {
		String sql = "SELECT * FROM goods WHERE g_id like 'a%'";
		ArrayList<Goods> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Goods>();
			while( rs.next() ) {
				Goods g = new Goods();
				g.setG_id(rs.getString("g_id"));
				g.setG_name( rs.getString("g_name") );
				g.setG_imgName( rs.getString("g_imgName") );
				g.setG_price( rs.getInt("g_price") );
				ary.add(g);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public ArrayList<Goods> findFood() {
		String sql = "SELECT * FROM goods WHERE g_id like 'f%'";
		ArrayList<Goods> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Goods>();
			while( rs.next() ) {
				Goods g = new Goods();
				g.setG_id(rs.getString("g_id"));
				g.setG_name( rs.getString("g_name") );
				g.setG_imgName( rs.getString("g_imgName") );
				g.setG_price( rs.getInt("g_price") );
				ary.add(g);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	public int goodsPrice(String g_id) {
		String sql = "SELECT g_price FROM goods WHERE g_id = '"+g_id+"'";
		int price = 0;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				Goods g = new Goods();
				price = rs.getInt("g_price");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return price;
	}
}
