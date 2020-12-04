<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.io.PrintWriter" %>

	<%@ page import="java.util.ArrayList" %>
	<%@ page import="user.UserDTO" %>
	<%@ page import="user.UserDAO" %>
	
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>MyUpdate</title>

  <!-- Custom fonts for this theme -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="css/freelancer.min.css" rel="stylesheet">

</head>
<%
String userID=null;
if(session.getAttribute("userID")!=null)
{
userID=(String) session.getAttribute("userID");

}
UserDAO userDAO = new UserDAO();
String Email="";
String uID="";
String id = "";
String Name="";
String HP="";
String Main = "";
String Content = "";
String IMG="";

int DIV=0;
if(request.getParameter("id")!=null){
	id= request.getParameter("id");
}
ArrayList<UserDTO> list = userDAO.getUserALL(id);

IMG=userDAO.getUserImg(id);
uID=list.get(0).getUserID();
Email=list.get(0).getUserEmail();
Name=list.get(0).getUserName();
HP=list.get(0).getUserHP();
Main=list.get(0).getMainContent();
Content=list.get(0).getUserContent();

%>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">My page</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index.jsp">Home</a>
          </li>            
        </ul>
      </div>		
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">

      <!-- Masthead Avatar Image -->
       <img  class="rounded-circle img-fluid" style="max-width: 200px" src="<%= IMG %>" alt="">
		<p>

      <!-- Masthead Heading -->
      <h1 class="masthead-heading text-uppercase mb-0"><%= uID %></h1>
	
      <!-- Icon Divider -->
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
        
      </div>

      <!-- Masthead Subheading -->
        
   	<form name="UserIMG" method="post"  action="uploadAction.jsp" enctype="multipart/form-data">
       	
      
       	 <input type="file" name="userImg" class="file">
       	    <button type="submit" class="btn btn-primary btn-xl">프로필사진 저장</button>
       	     	
       	
       	</form>
       	 	 <form name="UserIMsG"  action="MyUpdateAction.jsp" enctype="multipart/form-data">
        	
      <input type="text" class="form-control" name="MainContent" value="<%= Main %>" maxlength="30"> 
	
		
    </div>
  </header>

<%

if(!(userID.equals(uID))){
	
}
else{
	

%>

  <!-- Portfolio Section -->


    


  <!-- Contact Section -->
  <section class="page-section" id="contact">
    <div class="container">

      <!-- Contact Section Heading -->
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Profile</h2>

      <!-- Icon Divider -->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- Contact Section Form -->
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
        
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label><%= Name %></label>
                <input class="form-control" id="name" type="text" name="userName" placeholder="Name" value="<%= Name %>"  maxlength="20" required="required" >
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label><%= Email %></label>
                <input class="form-control" id="email" type="email" name="userEmail" placeholder="Email Address"  value="<%= Email %>" maxlength="50" required="required" >
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label><%= HP %></label>
                <input class="form-control" id="phone" type="tel"  name="userHP" placeholder="Phone Number" value="<%= HP %>"  maxlength="20" required="required" >
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Message</label>
                <textarea class="form-control" id="message" name="userContent" rows="5" placeholder="Message" maxlength="100" required="required"><%= Content %></textarea>
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <br>
            <div id="success"></div>
            <div class="form-group">
           <button type="submit" class="btn btn-primary btn-xl" id="sendMessageButton">프로필 저장</button>
            </div>
      
        </div>
      </div>

    </div>
  </section>

  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <div class="row">

        <!-- Footer Location -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          
          
          <p class="lead mb-0">
        
            <br></p>
        </div>
    </form>
        <!-- Footer Social Icons -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Around the Web</h4>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-facebook-f"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-twitter"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-linkedin-in"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-dribbble"></i>
          </a>
        </div>

        <!-- Footer About Text -->
    

      </div>
    </div>
  </footer>

  <!-- Copyright Section -->
  <section class="copyright py-4 text-center text-white">
    <div class="container">
      <small>Copyright &copy; 신희권</small>
    </div>
  </section>

  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
  <div class="scroll-to-top d-lg-none position-fixed ">
    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
      <i class="fa fa-chevron-up"></i>
    </a>
  </div>


<%
}
%>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/freelancer.min.js"></script>

</body>

</html>