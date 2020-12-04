<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.io.PrintWriter" %>
  <%@ page import = "user.UserDAO" %>
  <%@ page import="bbs.Bbs" %>
    <%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>view</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.min.css">



</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
			String userID=null;
	if(session.getAttribute("userID")!=null)
	{
		userID=(String) session.getAttribute("userID");
	}
		int bbsID = 0;
		if(request.getParameter("bbsID")!=null){
			bbsID= Integer.parseInt(request.getParameter("bbsID"));
		}
	if(bbsID==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>"); 
		script.close();
		return;
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="index.jsp">JOB_SEARCH</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
		<sapn class="navbar-toggler-icon"></sapn>
		</button>
		
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
		
				<li class="nav-item active">
					<a class="nav-link"href="bbs.jsp">게시판</a>
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
			
			
			<table class="table table-striped mt-4" style="text-align:center; border: 1px solid #dddddd">
						<thread>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판</th>
								
							</tr>
						</thread>
						<tbody>
							<tr>
								<td style="width: 20%;">글제목</td>
								<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
							</tr>	
							
								<tr>
								<td>작성자</td>
								<td colspan="2"><%= bbs.getUserID() %></td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2"><%= bbs.getBbsDate() %></td>
							</tr>	
							
							<tr>
								<td>내용</td>
								<td colspan="2" style="min-height: 200px; text-align:left;">
								<%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>") %>
								</td>
							</tr>			
							
						</tbody>
					</table>
					<a href="bbs.jsp" class="btn btn-primary">목록</a>
					
					<%
					
							if(userID!=null&&userID.equals(bbs.getUserID())){
								%>
								<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
								<a onclick="return confirm('정말로 삭제하시겠습니까?')"href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
							<%
							}
					%>
			
					
					
					
					
					
					
					
				</div>
		</div>

	<script src="./js/jquery.min.js"></script>
	
	<script src="./js/jooper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	




</body>
</html>