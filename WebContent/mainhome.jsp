<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스트릿 우먼 파이터</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom1.css">
<link rel="icon" href="./p1/favicon1.ico">

<style type="text/css">
/* 부모 요소를 사용할 수 없고 이미지만 스타일링이 가능하다면, img 요소를 block 요소로 만든 후 margin 속성을 이용해서 가운데에 위치시킵니다. */	
	img {
		vertical-align: top;
		max-width: 100%;
		width: auto; 
		height: auto; 
		display: block;
		margin: 0px auto;
	}
	
	.carousel-inner {
		background-image: url('./p1/bg.jpg'); 
		background-size: auto; 
		background-repeat: no-repeat; 
		background-position: center top;"
	}
	
	h1 {		 
		font-family: Spoqa Han Sans;
		font-weight: bold;
		font-size: 50px;
	}
	
	.dropdown {
		font-weight: bold;
		font-family: Spoqa Han Sans;
	}
	
	.dropdown-menu {
		font-weight: bold;
		font-family: Spoqa Han Sans;
	}
	
	.navbar-header {
		font-size: 20px;
		font-weight: bold;
		font-family: Spoqa Han Sans;	
	}
	
	h5 {
		font-family: Spoqa Han Sans;
	}
	
	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
</head>
<body style="background-color: black;">

<!-- ================================================================================================================================== -->
<!-- 내비게이션 바 -->
<% 
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
				aria-expanded="false">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="mainhome.jsp">스트릿 우먼 파이터</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						프로그램 소개<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#program">프로그램 소개</a></li>
					</ul>
				</li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						크루 소개<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="crewView.jsp?crew=cocan">CocaNButter</a></li>
						<li><a href="crewView.jsp?crew=ygx">YGX</a></li>
						<li><a href="crewView.jsp?crew=lachica">LACHICA</a></li>
						<li><a href="crewView.jsp?crew=want">WANT</a></li>
						<li><a href="crewView.jsp?crew=wayb">WAYB</a></li>
						<li><a href="crewView.jsp?crew=hook">HOOK</a></li>
						<li><a href="crewView.jsp?crew=holybang">HolyBang</a></li>
						<li><a href="crewView.jsp?crew=prowdmon">PROWDMON</a></li>
					</ul>
				</li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						게시판<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="boardPage.jsp">게시판</a></li>
					</ul>
				</li>

			</ul>
 			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색 내용을 입력하세요."/>
				<button type="button" class="btn btn-default">검색</button>
				</div>
			</form>
			<%
			 // 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
				if(userID == null) {
			%>
		
			<div class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						접속하기<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="mainlogin.jsp">로그인</a></li>
						<li><a href="register.jsp">회원가입</a></li>
					</ul>
					
				</li>
			</div>
			<%
			 // 로그인이 되어있는 사람만 볼수 있는 화면
				} else {
			%>
			<div class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						회원관리<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
					
				</li>
			</div>
			<%
				}
			%>
			
		</div>
	</div>
</nav><!-- ================================================================================================================================== -->

<!-- 시작 -->
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
      <!-- Wrapper for slides -->
      <div class="carousel-inner" >
 
        <div class="item active" >
          <img src="./p1/img01.png" >
           <div class="carousel-caption"></div>
        </div><!-- End Item -->
 
         <div class="item" >
          <img src="./p1/img02.png" >
           <div class="carousel-caption" ></div>
        </div><!-- End Item -->
        
        <div class="item">
          <img src="./p1/img03.png">
           <div class="carousel-caption"></div>
        </div><!-- End Item -->
        
        <div class="item">
          <img src="./p1/img04.png">
           <div class="carousel-caption"></div>
        </div><!-- End Item -->
        
        <div class="item">
          <img src="./p1/img05.png">
           <div class="carousel-caption"></div>
        </div><!-- End Item -->
        
        <div class="item">
          <img src="./p1/img06.png">
           <div class="carousel-caption"></div>
        </div><!-- End Item -->     
             
        <div class="item">
          <img src="./p1/img07.png">
           <div class="carousel-caption"></div>
        </div><!-- End Item --> 
                 
        <div class="item">
          <img src="./p1/img08.png">
           <div class="carousel-caption"></div>
        </div><!-- End Item -->          
                
      </div><!-- End Carousel Inner -->
      
    	<ul class="nav nav-pills nav-justified">
  
          <li data-target="#myCarousel" data-slide-to="0" >
          	<a href="#"><small>PROWDMON</small></a></li>
          	
          <li data-target="#myCarousel" data-slide-to="1" >
          	<a href="#"><small>La Chica</small></a></li>
          	
          <li data-target="#myCarousel" data-slide-to="2" >
          	<a href="#"><small>YGX</small></a></li>
          	
          <li data-target="#myCarousel" data-slide-to="3" >
          	<a href="#"><small>HolyBang</small></a></li>
          	
          <li data-target="#myCarousel" data-slide-to="4" >
          <a href="#"><small>HOOK</small></a></li>
          
          <li data-target="#myCarousel" data-slide-to="5" >
          <a href="#"><small>WANT</small></a></li>
          
          <li data-target="#myCarousel" data-slide-to="6" >
          <a href="#"><small>WAYB</small></a></li>
          
          <li data-target="#myCarousel" data-slide-to="7" >
          <a href="#"><small>CocaNButter</small></a></li>
          
        </ul>
    </div><!-- End Carousel -->
<!-- 끝 -->

<!-- ================================================================================================================================== -->
<div class="container">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4"></div>
		<div class="col-md-4">
	</div>
	<hr style="border-width: medium;"/>
	
<!-- ================================================================================================================================== -->
		<!-- 미디어(media) -->
		<div id="program" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-tags"></span>
					&nbsp;&nbsp;&nbsp;프로그램 소개
				</h3>
			</div>
		
			<!-- 미디어 -->
			<div class="panel-body" style="text-align: center;">
				<!-- 미디어 1 -->
				<div class="media" >
					<div class="media-center" >
						<div class="media-body" >
							<a href="#"></a>
							<img class="center-aligned media" src="./p1/programinfo.jpg"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- ================================================================================================================================== -->
	<div style="
		border: 5px solid silver; 
		background: white;
		color: black;
		text-align: center;
		letter-spacing: 3px;
		border-radius: 2em;">
		 <h1>매주 화요일 밤 10시 20분 방송</h1>
		 <!-- <img src="./p1/programtime.png"> -->
	</div>
</div>
<hr style="border-width: medium;"/>

<!-- ================================================================================================================================== -->

<footer style="background-color: #000000; color: #ffffff">
	<div class="container">
		<br/>
		<div class="row">
			<div class="col-sm-2" style="text-align: center;">
				<h5>개발자</h5>
				<h5>강은혜</h5>
				<h5>김민준</h5>
				<h5>이지수</h5>
				<h5>전상욱</h5>
			</div>
			
			<div class="col-sm-4">
				<h5>E-mail</h5>
				<h5>강은혜 : dmsgp8772@naver.com</h5>
				<h5>김민준 : alswns6327@naver.com</h5>
				<h5>이지수 : q33as@naver.com</h5>
				<h5>전상욱 : sangwook0217@gmail.com</h5>
			</div>
			
			<div class="col-sm-4" style="text-align: center;">
				<h5>입금 계좌</h5>
				<h5>SC제일은행 77520135729</h5>
				<h5>국민은행 950002-00-114062</h5>
				<h5>신한은행 110-373-743352</h5>
				<h5>카카오 뱅크 3333-12-4618614</h5>
			</div>
			
			<div class="col-sm-2" style="text-align: center;">
				<h5>스우파 공식 SNS</h5>
				<div class="list-group">
					<a href="https://program.genie.co.kr/swf/main" class="list-group-item">공식 홈페이지</a>
					<a href="https://www.instagram.com/mnet_dance/" class="list-group-item">공식 인스타그램</a>
					<a href="https://program.naver.com/p/18923570" class="list-group-item">공식 네이버TV</a>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- ================================================================================================================================== -->

</body>
</html>


