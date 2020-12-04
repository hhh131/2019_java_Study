<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.io.PrintWriter" %>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/joinCustom.css">
<link rel="stylesheet" href="./css/bootstrap.css">
		<%
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

	
	
	%>

<body>
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
				
						<a class="dropdown-item" href="login.jsp">로그인</a>
						<a class="dropdown-item active" href="join.jsp">회원가입</a>
												
						
				</div>
					</li>
					
			</ul>
		</div>	
	</nav>
	
	
  <div class="container">
    <div class="row">
      <div class="col-lg-5 col-xl-5 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
            
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">회원가입</h5>
            <form class="form-signin" action="userRegisterAction.jsp" method="post">
              <div class="form-label-group">
                <input type="text" id="inputUserame" name="userID" class="form-control" placeholder="UserID"  data-validation-required-message="id를 입력 해 주세요" required autofocus>
                <label for="inputUserame">ID</label>
              </div>



              <div class="form-label-group">
                <input type="email" id="inputEmail" name="userEmail" class="form-control" placeholder="Email address"  required>
                <label for="inputEmail">Email address</label>
              </div>
              
              <hr>

              <div class="form-label-group">
                <input type="password" id="inputPassword" name="userPassword" class="form-control" placeholder="Password"  required>
                <label for="inputPassword">Password</label>
              </div>
            
              <div class="btn-group btn-group-toggle" data-toggle="buttons">



  <input type="radio" name="options"  value="user"> 개인
  	&nbsp;
  <input type="radio" name="options" value="com" > 기업
 				 
    				
   						 
 								
</div>
  <hr>
<p>
<p>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">회원가입</button>
              
             
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>