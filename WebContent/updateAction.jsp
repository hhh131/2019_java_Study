<%@page import="com.mysql.cj.protocol.a.authentication.Sha256PasswordPlugin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="bbs.BbsDAO" %>
 <%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>

<%

request.setCharacterEncoding("UTF-8");

	String userID=null;
	if(session.getAttribute("userID")!=null)
	{
	userID=(String) session.getAttribute("userID");

	}
	
	if(userID==null)
	{
	//session.setAttribute("userID",userID);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인 하세요')");
	script.println("location.href='login.jsp'");
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
	}else{
	
		if(request.getParameter("bbsTitle")==null||request.getParameter("bbsContent")==null){
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;		
		}
		else{
			BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.update(bbsID,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
		
		if(result==-1){
			PrintWriter script = response.getWriter();
		
			script.println("<script>");
			script.println("alert('글 수정에 실패했습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
			script.close();
			return;		
		}
		else{
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정 완료 했습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
			script.close();
			return;		
		}
	}
	}
	
	
%>