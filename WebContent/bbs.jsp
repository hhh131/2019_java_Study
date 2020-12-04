<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.io.PrintWriter" %>
  <%@ page import= "user.UserDAO" %>
	<%@ page import="bbs.BbsDAO" %>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="bbs.Bbs" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>게시판</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<!-- <link rel="stylesheet" href="./css/bb.min.css">
<link rel="stylesheet" href="./css/bb.css"> -->

<link rel="stylesheet" href="./css/custom.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<style type="text/css">
		a{
		color:#000000;
		text-decoration:none;
		}
		a:hover{
		color:#000000;
		}
	
     

</style>


</head>
<body>
	<%

	int DIV = 0;

	
	String userID=null;
	String IMG="";
			
			
			
	if(session.getAttribute("userID")!=null)
	{
		userID=(String)session.getAttribute("userID");
		
	}
	if(userID==null)
	{

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
	
	UserDAO userDAO = new UserDAO();
	IMG=userDAO.getUserImg(userID);
	DIV=userDAO.getUserDIV(userID);
	

	%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="index.jsp">Job_Search</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
		<sapn class="navbar-toggler-icon"></sapn>
		</button>
		
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link"	href="bbs.jsp">게시판</a>
				</li>
				<li class="nav-item">
					
				</li>
				<%if(DIV==0)
					{
					}
				else{
					
				
					%>
					
					<li class="nav-item">
					<a class="nav-link"	href="userlist.jsp">회원목록</a>
				</li>
				<%
				}
				%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					회원관리
					</a>
						<div class="dropdown-menu" aria-labelledby="dropdown">
					<%
						if(userID==null){
					%>
						<a class="dropdown-item" href="userlogin.jsp">로그인</a>
						<a class="dropdown-item" href="join.jsp">회원가입</a>
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
			<%if(DIV==1){
				%>
			
				<h5 class="navbar-brand"> (기업)</h5>
		<%
			}else if(DIV==0)
			{%>
				<h5 class="navbar-brand"> (개인)</h5>
			<%} %>
		
			
		
			 <img  class="rounded-circle img-fluid" style="max-width:40px;" src="<%= IMG %>">&nbsp;<a class="navbar-brand" href="My.jsp?id=<%=userID %>"><h2><%=userID %></h2></a>
			
		</div>
	</nav>
		<div class="container">
			<div class="row">
					<table class="table table-hover mt-4" style="text-align:center; border: 1px solid #dddddd">
						<thread>
							<tr class="table-dark">
								<th width="10%" scope="col" style="text-align: center;">번호</th>
								<th width="40%" scope="col" style="text-align: center;">제목</th>
								<th width="20%" scope="col" style="text-align: center;">작성자</th>
								<th width="20%" scope="col" style="text-align: center;">작성일</th>
							</tr>
						</thread>
						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							for(int i = 0; i < list.size(); i++){
								
							
						
						
						
						%>
						<tbody>
							<tr scope="row">
								<td><%= list.get(i).getBbsID()%></td>
								<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle()%></a></td>
								<td><a href="My.jsp?id=<%= list.get(i).getUserID()%>"> <%= list.get(i).getUserID() %></a></td>
								<td><%= list.get(i).getBbsDate() %></td>
							</tr>
							<%
							}
							%>
						</tbody>
						</table>
						<%
							if(pageNumber!=1){
								
							%>
							<a href="bbs.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arrow-left">이전</a>
						<%
						
							}
							if(bbsDAO.nextPage(pageNumber+1))
							{
								%>
								<a href="bbs.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arrow-right">다음</a>
						<%
							}
						%>
			
					<a href ="write.jsp" class="btn btn-outline-primary">글쓰기</a>
			
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