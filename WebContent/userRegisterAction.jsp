<%@page import="com.mysql.cj.protocol.a.authentication.Sha256PasswordPlugin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="user.UserDAO" %>
  <%@ page import="user.UserDTO" %>
   <%@ page import="utill.SHA256" %>
<%@ page import="java.io.PrintWriter" %>





<%
int DIV=0;
String userID=null;
if(session.getAttribute("userID")!=null)
{
userID=(String) session.getAttribute("userID");

}
if(userID!=null)
{
session.setAttribute("userID",userID);
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('로그인이 된 상태입니다.')");
script.println("location.href='index.jsp'");
script.println("</script>");
script.close();
return;		
}



	request.setCharacterEncoding("UTF-8");
	

	String userPassword=null;
	String userEmail=null;
	String options=null;
	if(request.getParameter("userID")!=null){
		userID=request.getParameter("userID");
	}
	if(request.getParameter("userPassword")!=null){
		userPassword=request.getParameter("userPassword");
		
	}if(request.getParameter("userEmail")!=null){
		userEmail=request.getParameter("userEmail");
	}
	if(request.getParameter("options")!=null){
		options=request.getParameter("options");
	}
	if(userID==null||userPassword==null||userEmail==null){
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;		
	}
	

	if(options.equals("user"))
	{
		DIV=0;
	}
	else if(options.equals("com")){
		DIV=1;
	}
	
	
	
	
	
	
	UserDAO userDAO = new UserDAO();
	int result =userDAO.Join(new UserDTO(userID,userPassword,userEmail,SHA256.getSHA256(userEmail),false,DIV));
	
	if(result==-1){
		PrintWriter script = response.getWriter();
	
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;		
	}
	else{
		session.setAttribute("userID",userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='emailSendAction.jsp'");
		script.println("</script>");
		script.close();
		return;		
	}
	
	%>