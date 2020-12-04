<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
    <%@ page import="java.io.File" %>
    <%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
 <%@ page import="com.oreilly.servlet.MultipartRequest" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload</title>
</head>
<body>
<%-- <%
MultipartRequest multi =null;
		
		int fileMaxSize = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload").replaceAll("\\\\","/");
		try { 
			 multi = new MultipartRequest(request,savePath,fileMaxSize,"UTF-8",new DefaultFileRenamePolicy());
			 
		}catch(Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("messageType","오류메시지");
			request.getSession().setAttribute("messageContent","파일 크기는 10mb를 넘을 수 없습니다.");
			response.sendRedirect("index.jsp");
			return;
		}
		String userID = multi.getParameter("userID");
		HttpSession session = request.getSession();
		if(!userID.equals((String)session.getAttribute("userID"))) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "접근 할 수 없습니다.");
			//response.sendRedirect("index.jsp");
			return;
		}
		String fileName="";
		File file = multi.getFile("userIMG");
			if(file!=null) {
				String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
				if(ext.equals("jpg")||ext.equals("png")||ext.equals("gif")) {
					String prev = new UserDAO().getUserImg(userID);
					File prevFile = new File(savePath+"/"+prev);
					if(prevFile.exists()) {
						prevFile.delete();
					}
					fileName= file.getName();
				}else {
					if(file.exists()) {
						file.delete();
					}
					//response.sendRedirect("index.jsp");
					return;
				}
			}
			new UserDAO().setUserIMG(userID,fileName);
			session.setAttribute("messageType", "성공 메시지");
			session.setAttribute("messageContent", "접근 할 수 없습니다.");
			return;
			 %>	





 --%>

	<%
	String userID="";
	if(session.getAttribute("userID")!=null)
	{
		userID=(String)session.getAttribute("userID");
	}
	//request.
		String dir = application.getRealPath("/upload").replaceAll("\\\\","/");
		int maxSize = 1024 * 1024*10;
		String encoding ="UTF-8";
		
		MultipartRequest multipartRequest
		= new MultipartRequest(request,dir,maxSize,"UTF-8",
				new DefaultFileRenamePolicy());
		
		
		String fileName = multipartRequest.getFilesystemName("userImg");
		
		new UserDAO().setUserIMG(userID,fileName);
	
		out.write("실제 파일명:"+ fileName+"<br>");

		//response.sendRedirect("index.jsp");
	%>
	<script>
	location.href="MyUpdate.jsp?id=<%=userID%>";
	
	</script>

</body>
</html>