<%@page import="com.mysql.cj.protocol.a.authentication.Sha256PasswordPlugin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="user.UserDAO" %>
 <%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
	<%@ page import="java.util.ArrayList" %>
	
<%





String userID="";
if(session.getAttribute("userID")!=null)
{
	userID=(String)session.getAttribute("userID");
}





request.setCharacterEncoding("UTF-8");


	
	if(userID==null)
	{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인 하세요')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
	script.close();
	return;		
	}
	
	String id="";
	String userEmail="";
	String userName="";
	String userHP="";
	String MainContent="";
	String userContent="";
	if(request.getParameter("userEmail")!=null){
		userEmail= request.getParameter("userEmail");

	}
	if(request.getParameter("userName")!=null){
		userName= request.getParameter("userName");

	}
	if(request.getParameter("userHP")!=null){
		userHP= request.getParameter("userHP");

	}	if(request.getParameter("MainContent")!=null){
		MainContent= request.getParameter("MainContent");

	}
	if(request.getParameter("userContent")!=null){
		userContent= request.getParameter("userContent");

	}
	
	
	
	
	int uID = 0;
	
	UserDAO userDAO = new UserDAO();
	%>
<!-- 	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
		 -->
		
	<%
		int result = userDAO.userUpdate(userID, userEmail, userName, userHP, MainContent,userContent);
		
		if(result==-1){
			PrintWriter script = response.getWriter();
		
			script.println("<script>");
			script.println("alert('정보 수정에 실패했습니다.')");
			script.println("location.href='bbs.jsp");
			script.println("</script>");
			script.close();
			return;		
		}
		else{
			//response.sendRedirect("index.jsp");
			%>
			<script>
		
			alert("수정완료.");
			location.href="My.jsp?id=<%=userID%>";
			</script>
			<%
		}
		 %>
		
	
	
	
