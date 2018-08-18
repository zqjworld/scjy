package org.sc.scjy.utils.mail;


public class SendMailDemo {

	 /**
		 * @param args
		 */
//		public static void main(String[] args) {
//		  // 设置邮件服务器信息
//		  MailSenderInfo mailInfo = new MailSenderInfo();
//		  mailInfo.setMailServerHost("smtp.163.com");
//		  mailInfo.setMailServerPort("25");
//		  mailInfo.setValidate(true);
//		  
//		  // 邮箱用户名
//		  mailInfo.setUserName("sdzhangqingjun@163.com");
//		  // 邮箱密码
//		  mailInfo.setPassword("Zqj0612");
//		  // 发件人邮箱
//		  mailInfo.setFromAddress("sdzhangqingjun@163.com");
//		  // 收件人邮箱
//		  mailInfo.setToAddress("869338081@qq.com");
//		  // 邮件标题
//		  mailInfo.setSubject("转正须知");
//		  // 邮件内容
//		  StringBuffer buffer = new StringBuffer();
//		  buffer.append("Hello Good Gang ");
//		  buffer.append("恭喜您通过试用期的考核，顺利成为通软的员工");
//		  mailInfo.setContent(buffer.toString());
//		  
//		  // 发送邮件
//		  SimpleMailSender sms = new SimpleMailSender();
//		  // 发送文体格式
//		  sms.sendTextMail(mailInfo);
//		  // 发送html格式
//		  SimpleMailSender.sendHtmlMail(mailInfo);
//		  System.out.println("邮件发送完毕");
//		 }
	public static void main(String[] args) {
		sendEmail("sdzhangqingjun@163.com", "Zqj0612", "869338081@qq.com","Hello");
	}
	
	public static void sendEmail(String userName,String Password,String Address,String Info) {
	  // 设置邮件服务器信息
	  MailSenderInfo mailInfo = new MailSenderInfo();
	  mailInfo.setMailServerHost("smtp.163.com");
	  mailInfo.setMailServerPort("25");
	  mailInfo.setValidate(true);
	  
	  // 邮箱用户名
	  mailInfo.setUserName("sdzhangqingjun@163.com");
	  // 邮箱密码
	  mailInfo.setPassword("Zqj0612");
	  // 发件人邮箱
	  mailInfo.setFromAddress("sdzhangqingjun@163.com");
	  // 收件人邮箱
	  mailInfo.setToAddress("869338081@qq.com");
	  // 邮件标题
	  mailInfo.setSubject("山财大交易平台订单交易提醒");
	  // 邮件内容
	  StringBuffer buffer = new StringBuffer();
	  buffer.append(Info);
	  mailInfo.setContent(buffer.toString());
	  
	  // 发送邮件
	  SimpleMailSender sms = new SimpleMailSender();
	  // 发送文体格式
	  sms.sendTextMail(mailInfo);
	  // 发送html格式
	  SimpleMailSender.sendHtmlMail(mailInfo);
	  System.out.println("邮件发送完毕");
	 }
	
	

}
