<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.io.PrintWriter" %>
     <%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>게시판</title>
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
		script.println("alert('로그인을 해주세요.')");
		response.sendRedirect("login.jsp");
		script.println("</script>");
		script.close();
		return;		
	}
	
	%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="index.jsp">Job_Search</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
		<sapn class="navbar-toggler-icon"></sapn>
		</button>
		
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
					<a class="nav-link"	href="bbs.jsp">게시판</a>
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
	
		<div class="container mt-3">
			<div class="row">
			<form action="writeAction.jsp">
			
			<table  width="600" style="text-align:center; border: 1px solid #dddddd">
						<thread>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">글 작성</th>
								
							</tr>
						</thread>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" required></td>
							</tr>	
								<tr>
								<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style='height:350px' required></textarea></td>
								
							</tr>
						</tbody>
					</table>
					<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
			
					
					
				</div>
		</div>

	<script src="./js/jquery.min.js"></script>
	
	<script src="./js/jooper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	




</body>
</html>