<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>이메일</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.min.css">



</head>
<body>
		<%
			String userID=null;
	if(session.getAttribute("userID")!=null)
	{
		userID=(String) session.getAttribute("userID");
		
	}
	if(userID==null)
	{
		session.setAttribute("userID",userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해 주세요.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;		
	}
	
	
	%>
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
			<div class="alert alert-warning mt-4" role="alert">
				이메일 주소 인증을 하셔야 이용 가능합니다. 인증 메일을 받지 못하셨나요?
			</div>
			<a href="emailSendAction.jsp" class="btn btn-primary"> 인증메일 다시받기
			</a>
		</section>

<footer class="bg-dark mt-4 p-5 text-center" style="color:#FFFFFF;">
	Copyright &copy; 2019 신희권 All rights Reserved.
</footer>
	<script src="./js/jquery.min.js"></script>
	
	<script src="./js/jooper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	




</body>
</html>