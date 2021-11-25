<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>스트릿 우먼 파이터</title>
<link rel="stylesheet" href="./css/js.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<link rel="stylesheet" href="./css/customSample2.css">
<link rel="icon" href="./p1/favicon1.ico">
<style type="text/css">
 a, a:hover {
 	color : #000000;
 	text-decoration: none;
 }
 .carousel-inner {
		background-image: url('./p1/bg.jpg'); 
		background-size: auto; 
		background-repeat: no-repeat; 
		background-position: center top;"
		
	}
 

</style>
<!-- jQuery CDN과 bootstrap.js 파일의 스크립트를 사용해서 내비게이션 바가 동작한다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>

</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
</nav>
<br><br>
	<div class="container">

		<h1>게시판</h1>

		<div class="row">
			<table class="table table-bordered table-white"
				style="text-align: center; border: 1px slild #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; color: red; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; color: red; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; color: red; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; color: red; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for (int i = 0; i <list.size(); i++) {
					%>	
					<tr>
						<td style="background-color: white; color: black;"><%=list.get(i).getBbsID() %></td>
						<td style="background-color: white; color: black;"><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td style="background-color: white; color: black;"><%=list.get(i).getUserID() %></td>
						<td style="background-color: white; color: black;"><%= list.get(i).getBbsDate()  %></td>
					</tr>
					<% 	
						}
						
					%>
					
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
				<a href="boardPage.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>			
			<% 
				} if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="boardPage.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<% 		
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>	
		</div>
	</div>
	<br><br>
<!--
	풋터
	풋터는 홈페이지의 기타 정보를 보여주는 역할을 하는 일반적으로 홈페이지 가장 아래쪽에 위치한 저작권, 개발자, 내비게이션 등을 포함한다.
-->


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

</body>

</html>