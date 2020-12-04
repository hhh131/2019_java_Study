<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="com.mysql.cj.protocol.a.authentication.Sha256PasswordPlugin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="javax.mail.*" %>
  <%@ page import="java.util.Properties" %>

 <%@ page import="user.UserDAO" %>
   <%@ page import="utill.SHA256" %>
   <%@ page import="utill.Gmail" %>
<%@ page import="java.io.PrintWriter" %>



<%

	UserDAO userDAO = new UserDAO();
	String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String) session.getAttribute("userID");
		}
		if(userID==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href='userlogin.jsp'");
			script.println("</script>");
			script.close();
			return;		
		}
			









	boolean emailChecked =userDAO.getUserEmailChecked(userID);
	if(emailChecked==true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증 된 회원입니다.');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;		
	}
	

	String host="http://localhost:8080/Project/";
	String from="gmlrnjs131@gmail.com";
	String to = userDAO.getUserEmail(userID);
	String subject = "가입을  위한 이메일 인증메일입니다.";

	String content = "다음링크에 접속하여 이메일 인증을 진행하세요."+
		"<a href='"+host+"emailCheckAction.jsp?code="+new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
		
		Properties p = new Properties();
		p.put("mail.smtp.user",from);
		p.put("mail.smtp.host","smtp.googlemail.com");
		p.put("mail.smtp.port","465");
		p.put("mail.smtp.starttls.enable","true");
		p.put("mail.smtp.auth","true");
		p.put("mail.smtp.sdebug","true");
		p.put("mail.smtp.socketFactory.port","465");
		p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback","false");

		try{
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p,auth);
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO,toAddr);
			msg.setContent(content,"text/html;charset=UTF8");
			Transport.send(msg);
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;		
		}
		
%>

			<!DOCTYPE html>
			<html>
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
			<title>이메일</title>
			<link rel="stylesheet" href="./css/bootstrap.min.css">

			<link rel="stylesheet" href="./css/custom.min.css">



			</head>
			<body>
				
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
				<a class="navbar-brand" href="index.jsp">Job_Search</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
					<sapn class="navbar-toggler-icon"></sapn>
					</button>
					
					
							<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					회원관리
					</a>
						<div class="dropdown-menu" aria-labelledby="dropdown">
					<%
						if(userID==null){
					%>
						<a class="dropdown-item" href="userlogin.jsp">로그인</a>
						<a class="dropdown-item" href="userjoin.jsp">회원가입</a>
						<%
						} else{
						%>										
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<%
							}
						%>
					</div>
								</li>
						</ul>
					</div>
					
				</nav>
					<section class="container mt-3" style="max-width: 560px">
						<div class="alert alert-success mt-4" role="alert">
							이메일 주소인증메일이 전송되었습니다. 인증해주세요.
						</div>
					</section>

			<footer class="bg-dark mt-4 p-5 text-center" style="color:#FFFFFF;">
				Copyright &copy; 2019 신희권 All rights Reserved.
			</footer>
				<script src="./js/jquery.min.js"></script>
				
				<script src="./js/jooper.js"></script>
				<script src="./js/bootstrap.min.js"></script>
				




			</body>
			</html>
	