<%@page import="com.mysql.cj.protocol.a.authentication.Sha256PasswordPlugin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="bbs.BbsDAO" %>

<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty property="bbsTitle" name="bbs"/>
<jsp:setProperty property="bbsContent" name="bbs"/>

<%

request.setCharacterEncoding("UTF-8");

	String userID=null;
	if(session.getAttribute("userID")!=null)
	{
	userID=(String) session.getAttribute("userID");

	}
	
	if(userID==null)
	{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인 하세요')");
	response.sendRedirect("login.jsp");
	script.println("</script>");
	script.close();
	return;		
	}
	else{
	
		if(bbs.getBbsTitle()==null||bbs.getBbsContent()==null){
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
		
			script.println("</script>");
			script.close();
			return;		
		}
		else{
			BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.write(bbs.getBbsTitle(),userID,bbs.getBbsContent());
		
		if(result==-1){
			PrintWriter script = response.getWriter();
		
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다..');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;		
		}
		else{
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			response.sendRedirect("bbs.jsp");
			script.println("</script>");
			script.close();
			return;		
		}
	}
	}
	
	
%>