package model;

import java.sql.Timestamp;

public class Orders {
	private int o_id;
	private String u_id;
	private String g_id;
	private String w_id;
	private int o_quantity;
	private String o_situation;
	private Timestamp o_time;
	private Timestamp o_makeTime;
	private Timestamp o_offerTime;
	
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getG_id() {
		return g_id;
	}
	public void setG_id(String g_id) {
		this.g_id = g_id;
	}
	public String getW_id() {
		return w_id;
	}
	public void setW_id(String w_id) {
		this.w_id = w_id;
	}
	public int getO_quantity() {
		return o_quantity;
	}
	public void setO_quantity(int o_quantity) {
		this.o_quantity = o_quantity;
	}
	public String getO_situation() {
		return o_situation;
	}
	public void setO_situation(String o_situation) {
		this.o_situation = o_situation;
	}
	public Timestamp getO_time() {
		return o_time;
	}
	public void setO_time(Timestamp o_time) {
		this.o_time = o_time;
	}
	public Timestamp getO_makeTime() {
		return o_makeTime;
	}
	public void setO_makeTime(Timestamp o_makeTime) {
		this.o_makeTime = o_makeTime;
	}
	public Timestamp getO_offerTime() {
		return o_offerTime;
	}
	public void setO_offerTime(Timestamp o_offerTime) {
		this.o_offerTime = o_offerTime;
	}
}
