<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.io.PrintWriter" %>
  <%@ page import = "user.UserDAO" %>
  <%@ page import = "bbs.Bbs" %>
  <%@ page import = "bbs.BbsDAO" %>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>web</title>
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
		script.println("location.href='.jsp'");
		script.println("</script>");
		script.close();
		return;		
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
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='bbs.jsp'");
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
					<a class="nav-link"	href="index.jsp">메인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link"	href="#">게시판</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					회원관리
					</a>
						<div class="dropdown-menu" aria-labelledby="dropdown">
								
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
			
					</div>
					</li>
			</ul>
			
		</div>
	</nav>
		<div class="container">
			<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
			
			<table  width="600" style="text-align:center; border: 1px solid #dddddd">
						<thread>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글수정</th>
								
							</tr>
						</thread>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle()%>"></td>
							</tr>	
								<tr>
								<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style='height:350px'"> <%= bbs.getBbsContent()%></textarea></td>
								
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