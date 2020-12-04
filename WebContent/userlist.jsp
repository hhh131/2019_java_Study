<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.io.PrintWriter" %>
  <%@ page import= "user.UserDAO" %>
	<%@ page import="user.UserDTO" %>
	<%@ page import="java.util.ArrayList" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>userlist</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.min.css">
<style type="text/css">
		a, a:hover{
		color:#000000;
		text-decoration:none;
		}
</style>


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
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		script.close();
		return;		
	}
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if(emailChecked == false){
		session.setAttribute("userID",userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
		script.println("location.href='emailSendConfirm.jsp'");
		script.println("</script>");
		script.close();
		return;		
	}
	int pageNumber=1;
	if(request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="index.jsp">Job_Search</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
		<sapn class="navbar-toggler-icon"></sapn>
		</button>
		
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item">
					<a class="nav-link"	href="bbs.jsp">게시판</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link"	href="#">회원목록</a>
				</li>
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
		<div class="container">
			<div class="row">
					<table class="table table-hover mt-4" style="text-align:center; border: 1px solid #dddddd">
						<thread>
							<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
								<th style="background-color: #eeeeee; text-align: center;">연락처</th>
								<th style="background-color: #eeeeee; text-align: center;">이메일</th>
								<th style="background-color: #eeeeee; text-align: center;">회원이름</th>
								<th style="background-color: #eeeeee; text-align: center;">회원아이디</th>
						
							</tr>
						</thread>
						<%
							UserDAO userDAO = new UserDAO();
							ArrayList<UserDTO> list = userDAO.getUserList();
							for(int i = 0; i < list.size(); i++)
						
								{
								%>
						<tbody>
							<tr>
							<td><a href="My.jsp?id=<%= list.get(i).getUserID()%>"><%= i+1 %></a></td>
							<td><a href="My.jsp?id=<%= list.get(i).getUserID()%>"><%= list.get(i).getUserHP() %></a></td>
								<td> <a href="My.jsp?id=<%= list.get(i).getUserID()%>"><%= list.get(i).getUserEmail() %></a></td>
									<td><a href="My.jsp?id=<%= list.get(i).getUserID()%>"><%= list.get(i).getUserName() %></a></td>
								<td><a href="My.jsp?id=<%= list.get(i).getUserID()%>"><%= list.get(i).getUserID()%></a></td>
							
								
							</tr>
							<%
							}
							%>
						</tbody>
						</table>
					
					
				</div>
		</div>
  <footer class="bg-dark mt-4 p-5 text-center" style="color:#FFFFFF;">
	Copyright &copy; 2019 신희권 All rights Reserved.
</footer>

	<script src="./js/jquery.min.js"></script>
	
	<script src="./js/jooper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	




</body>
</html>