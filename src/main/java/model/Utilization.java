package model;

import java.sql.Timestamp;

public class Utilization {
	private String u_id;
	private String m_id;
	private String r_id;
	private String s_id;
	private int u_num;
	private Timestamp u_time;
	private int u_Etime;
	private Timestamp u_enterDay;
	private int u_reservePrice;
	private int u_roomPrice;
	private int u_Eprice;
	private int u_payment;
	private String u_pay;
	private String u_enterJudge;
	private Timestamp u_enterTime;
	private Timestamp u_exitTime;

	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public Timestamp getU_time() {
		return u_time;
	}
	public void setU_time(Timestamp u_time) {
		this.u_time = u_time;
	}
	public int getU_Etime() {
		return u_Etime;
	}
	public void setU_Etime(int u_Etime) {
		this.u_Etime = u_Etime;
	}
	public Timestamp getU_enterDay() {
		return u_enterDay;
	}
	public void setU_enterDay(Timestamp u_enterDay) {
		this.u_enterDay = u_enterDay;
	}
	public int getU_reservePrice() {
		return u_reservePrice;
	}
	public void setU_reservePrice(int u_reservePrice) {
		this.u_reservePrice = u_reservePrice;
	}
	public int getU_roomPrice() {
		return u_roomPrice;
	}
	public void setU_roomPrice(int u_roomPrice) {
		this.u_roomPrice = u_roomPrice;
	}
	public int getU_Eprice() {
		return u_Eprice;
	}
	public void setU_Eprice(int u_Eprice) {
		this.u_Eprice = u_Eprice;
	}
	public int getU_payment() {
		return u_payment;
	}
	public void setU_payment(int u_payment) {
		this.u_payment = u_payment;
	}
	public String getU_pay() {
		return u_pay;
	}
	public void setU_pay(String u_pay) {
		this.u_pay = u_pay;
	}
	public String getU_enterJudge() {
		return u_enterJudge;
	}
	public void setU_enterJudge(String u_enterJudge) {
		this.u_enterJudge = u_enterJudge;
	}
	public Timestamp getU_enterTime() {
		return u_enterTime;
	}
	public void setU_enterTime(Timestamp u_enterTime) {
		this.u_enterTime = u_enterTime;
	}
	public Timestamp getU_exitTime() {
		return u_exitTime;
	}
	public void setU_exitTime(Timestamp u_exitTime) {
		this.u_exitTime = u_exitTime;
	}
}
