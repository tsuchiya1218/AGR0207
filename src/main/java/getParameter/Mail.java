package getParameter;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail; 

public class Mail{
	public static void main(String[] args) {
		SimpleEmail email = new SimpleEmail();  
		//送り先
		try {
			email.setHostName("1252JY02");
			//送り先
			email.addTo("20y0230@jynet2.jec.ac.jp");
			//送信元
			email.setFrom("20jy0230@jynet2.jec.ac.jp","日本電子通商");
			email.setSubject("カラオケわしょい会員登録");  
			email.setMsg("uc01_06.jsp");  
			email.send();
			System.out.println("メール送信完了");
		} catch (EmailException e) {
			e.printStackTrace();
			System.out.println("メール送信失敗");
		}
	}
}