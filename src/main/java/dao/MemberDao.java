package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.Member;

public class MemberDao {
	private Connection con = null;

	public MemberDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.exit(1);
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://10.42.129.142:3306/"
					+ "20gr27?characterEncoding=UTF-8", "20gr27", "20gr27");
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

	public void setMember(ArrayList<String> ary, Date date) {
		ArrayList<String> a = ary;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String d = sdf.format(date);
		String sql = "INSERT INTO member (m_id,m_sei,m_mei,m_birthday,m_postcode,m_address,m_mail,m_phone1,m_phone2,m_phone3,m_pass) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			//JDBCドライバをロードする
			con.setAutoCommit(false); //オートコミットはオフ
			//実行するSQL文とパラメータを指定する
			ps = con.prepareStatement(sql);
			ps.setString(1, a.get(0));
			ps.setString(2, a.get(1));
			ps.setString(3, a.get(2));
			ps.setString(4, d);
			ps.setString(5, a.get(6) + a.get(7));
			ps.setString(6, a.get(8));
			ps.setString(7, a.get(9));
			ps.setString(8, a.get(10));
			ps.setString(9, a.get(11));
			ps.setString(10, a.get(12));
			ps.setString(11, a.get(13));
			//INSERT文を実行する
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Member findMember(String id) {
		String m_id = id;
		String sql = "SELECT * FROM member WHERE m_id ='" + m_id + "'";
		Member one = new Member();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				one.setM_id(rs.getString("m_id"));
				one.setM_sei(rs.getString("m_sei"));
				one.setM_mei(rs.getString("m_mei"));
				one.setM_birthday(rs.getDate("m_birthday"));
				one.setM_postcode(rs.getString("m_postcode"));
				one.setM_address(rs.getString("m_address"));
				one.setM_mail(rs.getString("m_mail"));
				one.setM_phone1(rs.getString("m_phone1"));
				one.setM_phone2(rs.getString("m_phone2"));
				one.setM_phone3(rs.getString("m_phone3"));
				one.setM_pass(rs.getString("m_pass"));
				one.setM_pay(rs.getInt("m_pay"));
				one.setM_cardNum(rs.getString("m_cardNum"));
				one.setM_cardYear(rs.getString("m_cardYear"));
				one.setM_cardMonth(rs.getString("m_cardMonth"));
				one.setM_cardName(rs.getString("m_cardName"));
				one.setM_cardCord(rs.getString("m_cardCord"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return one;
	}

	public String logIn(Member member) {
		Member m = member;
		String sql = "SELECT m_id FROM member WHERE m_mail='" + m.getSearchM_mail() + "'";
		String m_id = "";
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				m_id = rs.getString("m_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return m_id;
	}

	public boolean serchMail(String m) {
		String mail = m;
		String m_mail = null;
		String sql = "SELECT m_mail FROM member WHERE m_mail='" + mail + "'";
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				m_mail = rs.getString("m_mail");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(m_mail == null) {
			return true;
		}else {
			return false;
		}
	}

	public void updatePostcode(Member member) {
		Member m = member;
		String sql = "UPDATE member SET m_postcode = '" + m.getM_postcode() + "' WHERE m_id='" + m.getM_id() + "'";
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("SQLException:" + e.getMessage());
		}
	}

	public void updateAddress(Member member) {
		Member m = member;
		String sql = "UPDATE member SET m_address = '" + m.getM_address() + "' WHERE m_id='" + m.getM_id() + "'";
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateMail(Member member) {
		Member m = member;
		String sql = "UPDATE member SET m_mail = '" + m.getM_mail() + "' WHERE m_id='" + m.getM_id() + "'";
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updatePhone(Member member) {
		Member m = member;
		String sql1 = "UPDATE member SET m_phone1 = '" + m.getM_phone1() + "' WHERE m_id='" + m.getM_id() + "'";
		String sql2 = "UPDATE member SET m_phone2 = '" + m.getM_phone2() + "' WHERE m_id='" + m.getM_id() + "'";
		String sql3 = "UPDATE member SET m_phone3 = '" + m.getM_phone3() + "' WHERE m_id='" + m.getM_id() + "'";
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql1);
			state.executeUpdate(sql2);
			state.executeUpdate(sql3);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updatePass(Member member) {
		Member m = member;
		String sql = "UPDATE member SET m_pass = '" + m.getM_pass() + "' WHERE m_id='" + m.getM_id() + "'";
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateCard(ArrayList<String> ary) {
		String sql1 = "UPDATE member SET m_cardNum = '" + ary.get(1) + "' WHERE m_id='" + ary.get(0) + "'";
		String sql2 = "UPDATE member SET m_cardYear = '" + ary.get(2) + "' WHERE m_id='" + ary.get(0) + "'";
		String sql3 = "UPDATE member SET m_cardMonth = '" + ary.get(3) + "' WHERE m_id='" + ary.get(0) + "'";
		String sql4 = "UPDATE member SET m_cardName = '" + ary.get(4) + "' WHERE m_id='" + ary.get(0) + "'";
		String sql5 = "UPDATE member SET m_cardcord = '" + ary.get(5) + "' WHERE m_id='" + ary.get(0) + "'";
			
		
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql1);
			state.executeUpdate(sql2);
			state.executeUpdate(sql3);
			state.executeUpdate(sql4);
			state.executeUpdate(sql5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void delete(String m_id) {
		String sql = "DELETE FROM member WHERE m_id='"+ m_id + "'";
		try {
			Statement state = con.createStatement();
			state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public Date findBirthday(String m_id) {
		String sql = "SELECT m_birthday FROM member WHERE m_id='" + m_id + "'";
		Date m_birthday = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				m_birthday = rs.getDate("m_birthday");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return m_birthday;
	}
	public ArrayList<Member> searchMember(int m_id) {
		String sql = "SELECT * FROM member WHERE m_id LIKE '" + m_id + "'";
		ArrayList<Member> mlist = new ArrayList<>();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				Member one = new Member();
				one.setM_id(rs.getString("m_id"));
				one.setM_sei(rs.getString("m_sei"));
				one.setM_mei(rs.getString("m_mei"));
				one.setM_birthday(rs.getDate("m_birthday"));
				one.setM_postcode(rs.getString("m_postcode"));
				one.setM_address(rs.getString("m_address"));
				one.setM_mail(rs.getString("m_mail"));
				one.setM_phone1(rs.getString("m_phone1"));
				one.setM_phone2(rs.getString("m_phone2"));
				one.setM_phone3(rs.getString("m_phone3"));
				one.setM_pass(rs.getString("m_pass"));
				one.setM_pay(rs.getInt("m_pay"));
				one.setM_cardNum(rs.getString("m_cardNum"));
				one.setM_cardYear(rs.getString("m_cardYear"));
				one.setM_cardMonth(rs.getString("m_cardMonth"));
				one.setM_cardName(rs.getString("m_cardName"));
				one.setM_cardCord(rs.getString("m_cardCord"));
				mlist.add(one);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mlist;
	}
	public ArrayList<Member> searchMember(String name) {
		String sql = "SELECT * FROM member WHERE CONCAT(m_sei,m_mei) LIKE CONCAT('"+name+"','%')";
		ArrayList<Member> mlist = new ArrayList<>();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				Member one = new Member();
				one.setM_id(rs.getString("m_id"));
				one.setM_sei(rs.getString("m_sei"));
				one.setM_mei(rs.getString("m_mei"));
				one.setM_birthday(rs.getDate("m_birthday"));
				one.setM_postcode(rs.getString("m_postcode"));
				one.setM_address(rs.getString("m_address"));
				one.setM_mail(rs.getString("m_mail"));
				one.setM_phone1(rs.getString("m_phone1"));
				one.setM_phone2(rs.getString("m_phone2"));
				one.setM_phone3(rs.getString("m_phone3"));
				one.setM_pass(rs.getString("m_pass"));
				one.setM_pay(rs.getInt("m_pay"));
				one.setM_cardNum(rs.getString("m_cardNum"));
				one.setM_cardYear(rs.getString("m_cardYear"));
				one.setM_cardMonth(rs.getString("m_cardMonth"));
				one.setM_cardName(rs.getString("m_cardName"));
				one.setM_cardCord(rs.getString("m_cardCord"));
				mlist.add(one);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mlist;
	}
	public String findName(String m_id) {
		String sql = "SELECT m_sei,m_mei FROM member WHERE m_id ='" + m_id + "'";
		String name = null;
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				name = rs.getString("m_sei");
				name += rs.getString("m_mei");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
}
