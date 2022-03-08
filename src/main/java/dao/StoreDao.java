package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Store;

public class StoreDao {
	private Connection con = null;
	
	public StoreDao() {
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
	public boolean login(String s_id,String s_pass) {
		String sql = "SELECT DISTINCT s_id FROM store WHERE s_id = '"+s_id+"' AND s_pass = '"+s_pass+"'";
		boolean b = false;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				String id = rs.getString("s_id");
				b = true;
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return b;
	}

	
	public ArrayList<Store> findArea() {
		String sql = "SELECT DISTINCT s_area FROM store";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	
	public String findId(String s_name) {
		String sql = "SELECT s_id FROM store WHERE s_store like'" + s_name + "'";
		String s_id = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				s_id = rs.getString("s_id");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return s_id;
	}
	public String findAreaName(String s_id) {
		String sql = "SELECT s_area FROM store WHERE s_id ='" + s_id + "'";
		String s_name = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				s_name = rs.getString("s_area");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return s_name;
	}
	
	public String findStoreName(String s_id) {
		String sql = "SELECT s_store FROM store WHERE s_id ='" + s_id + "'";
		String s_name = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while( rs.next() ) {
				s_name = rs.getString("s_store");
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return s_name;
	}

	public ArrayList<Store> findStoreAD() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'AD%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	
	public ArrayList<Store> findStoreCC() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'CC%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	
	public ArrayList<Store> findStoreKA() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'KA%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}

	public ArrayList<Store> findStoreKE() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'KE%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}

	public ArrayList<Store> findStoreMI() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'MI%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}

	public ArrayList<Store> findStoreOU() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'OU%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	
	public ArrayList<Store> findStoreSA() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'SA%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	
	public ArrayList<Store> findStoreSM() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'SM%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	
	public ArrayList<Store> findStoreSO() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'SO%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	
	public ArrayList<Store> findStoreSS() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'SS%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}
	
	public ArrayList<Store> findStoreTN() {
		String sql = "SELECT s_area,s_store,s_pass FROM store WHERE s_id like 'TN%'";
		ArrayList<Store> ary = null;
		try { 
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			ary = new ArrayList<Store>();
			while( rs.next() ) {
				Store s = new Store();
				s.setS_area( rs.getString("s_area") );
				s.setS_store( rs.getString("s_store") );
				s.setS_pass( rs.getString("s_pass") );
				ary.add(s);
			}
		}catch( SQLException e ) {
			e.printStackTrace();
		}
		return ary;
	}

}
