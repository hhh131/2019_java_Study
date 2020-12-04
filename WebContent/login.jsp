<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.io.PrintWriter" %>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/loginCustom.css">
<link rel="stylesheet" href="./css/bootstrap.css">

<body>
		<%
			String userID=null;
	if(session.getAttribute("userID")!=null)
	{
		userID=(String) session.getAttribute("userID");
		
	}
	
	if(userID!=null)
	{
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;		
	}
	
	
	%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="index.jsp">JOB_SEARCH</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
		<sapn class="navbar-toggler-icon"></sapn>
		</button>
		
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					회원관리
					</a>
						<div class="dropdown-menu" aria-labelledby="dropdown">
				
						<a class="dropdown-item active" href="login.jsp">로그인</a>
						<a class="dropdown-item" href="join.jsp">회원가입</a>
												
						
					</div>
					</li>
			</ul>
			
		</div>
		
	</nav>
	
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">로그인</h5>
            <form class="form-signin" action="userloginAction.jsp" method="post">
              <div class="form-label-group">
                <input type="text" name="userID" class="form-control"  required autofocus>
                <label for="inputEmail">ID</label>
              </div>

              <div class="form-label-group">
                <input type="password" name="userPassword" class="form-control" required>
                <label for="inputPassword">Password</label>
              </div>

         <!--      <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div> -->
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
              <hr class="my-4">
             <a class="d-block text-center mt-2 small" href="join.jsp">회원가입</a>
       
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
	<script src="./js/jquery.min.js"></script>
	
	<script src="./js/jooper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	

  
</body>