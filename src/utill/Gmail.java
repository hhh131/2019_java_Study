package utill;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class Gmail extends Authenticator{

	
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("gmlrnjs131@gmail.com", "akxlcl157");
			
	}
}
