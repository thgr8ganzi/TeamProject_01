<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>스트릿 우먼 파이터</title>
<link rel="stylesheet" href="./css/bootstrap.css">

<link rel="stylesheet" href="./css/customSample.css">

<link rel="icon" href="./p1/favicon1.ico">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
</head>
<body>


<!--
	여기부터는 내비게이션 바
-->
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
						<li><a href="mainhome.jsp#program">프로그램 소개</a></li>
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
<%
request.setCharacterEncoding("UTF-8");
String crew=(String)request.getParameter("crew");
if(crew==null||crew.trim().equals("")){out.println("<script>location.href='mainhome.jsp'</script>");}else{
if(crew.equals("cocan")){
	String[] instar={"","","https://www.instagram.com/rihey__/","https://www.instagram.com/_gagaloca/","https://www.instagram.com/justasbicki/","https://www.instagram.com/zsunbless/","https://www.instagram.com/jillin.ee/"};
	String[] namu={"","https://namu.wiki/w/CocaNButter?from=코카앤버터","https://namu.wiki/w/리헤이","https://namu.wiki/w/가가(댄서)","#","https://namu.wiki/w/제트썬","#"};
	request.setAttribute("instar", instar);
	request.setAttribute("namu", namu);
}else if(crew.equals("holybang")){
	String[] instar={"","","https://www.instagram.com/__honey.j__/","https://www.instagram.com/_lo_aaa_/","https://www.instagram.com/mull_holybang/","https://www.instagram.com/gaeun_belle/","https://www.instagram.com/ee__vee/","https://www.instagram.com/janefromhb/","https://www.instagram.com/_t.a.r.o_/","https://www.instagram.com/blossomy_hertz/"};
	String[] namu={"","https://namu.wiki/w/홀리뱅","https://namu.wiki/w/허니제이","#","#","#","#","#","#","#"};
	request.setAttribute("instar", instar);
	request.setAttribute("namu", namu);
}else if(crew.equals("hook")){
	String[] instar={"","","https://www.instagram.com/aiki_kr/","https://www.instagram.com/rageonlegend/","https://www.instagram.com/SEON.YK_/","https://www.instagram.com/jiyeon127and/","https://www.instagram.com/yebonnana/","https://www.instagram.com/moonlight_odd_/","https://www.instagram.com/hyowoo.__/"};
	String[] namu={"","https://namu.wiki/jump/CDGUaEnaHWXow2bSV8t0ZZoeSBsnqRiaxxZx%2F3zveyycMlJC8uZq80JZt20swS4RaQDkoEmnjd%2FuMItgqK7jxA%3D%3D","https://namu.wiki/w/아이키","https://namu.wiki/w/뤠이젼","https://namu.wiki/w/선윤경","https://namu.wiki/w/성지연(댄서)","https://namu.wiki/w/예본(댄서)","https://namu.wiki/w/오드(댄서)","https://namu.wiki/w/효우(댄서)"};
	request.setAttribute("instar", instar);
	request.setAttribute("namu", namu);
}else if(crew.equals("lachica")){
	String[] instar={"","","https://www.instagram.com/gabeegal/","https://www.instagram.com/_simeez/","https://www.instagram.com/_rianess/","https://www.instagram.com/h__1won/","https://www.instagram.com/__peanutgirl/"};
	String[] namu={"","https://namu.wiki/w/라치카","https://namu.wiki/w/가비(댄서)","https://namu.wiki/w/시미즈(댄서)","https://namu.wiki/w/리안(댄서)","https://namu.wiki/w/에이치원","https://namu.wiki/w/피넛(댄서)"};
	request.setAttribute("instar", instar);
	request.setAttribute("namu", namu);
}else if(crew.equals("prowdmon")){
	String[] instar={"","","https://www.instagram.com/monika_shin/","https://www.instagram.com/ham_ggg/","https://www.instagram.com/kayda.y/","https://www.instagram.com/_rosy_life/","https://www.instagram.com/lipjmolip/","https://www.instagram.com/_dia_kim_/","https://www.instagram.com/hyeily.___/"};
	String[] namu={"","https://namu.wiki/w/프라우드먼","https://namu.wiki/w/모니카(댄서)","https://namu.wiki/w/함지(댄서)","https://namu.wiki/w/케이데이","https://namu.wiki/w/로지(댄서)","https://namu.wiki/w/립제이","https://namu.wiki/w/다이아(댄서)","https://namu.wiki/w/헤일리(댄서)"};
	request.setAttribute("instar", instar);
	request.setAttribute("namu", namu);
}else if(crew.equals("want")){
	String[] instar={"","","https://www.instagram.com/hyojin__choi__/","https://www.instagram.com/chaestival_/","https://www.instagram.com/eemmasong/","https://www.instagram.com/_k.moana/","https://www.instagram.com/Rozallllll/"};
	String[] namu={"","https://namu.wiki/w/원트(크루)","https://namu.wiki/w/효진초이","https://namu.wiki/w/이채연(2000)","https://namu.wiki/w/엠마(댄서)","https://namu.wiki/w/모아나(댄서)","https://namu.wiki/w/로잘린"};
	request.setAttribute("instar", instar);
	request.setAttribute("namu", namu);
}else if(crew.equals("wayb")){
	String[] instar={"","","https://www.instagram.com/noze_wayb/","https://www.instagram.com/gyuriannn/","https://www.instagram.com/dolla_wayb/","https://www.instagram.com/withleesu/","https://www.instagram.com/ansso_wayb/"};
	String[] namu={"","https://namu.wiki/w/WAYB(웨이비)","https://namu.wiki/w/no:ze","#","#","https://namu.wiki/w/리수(댄서)","https://namu.wiki/w/안쏘(댄서)"};
	request.setAttribute("instar", instar);
	request.setAttribute("namu", namu);
}else if(crew.equals("ygx")){
	String[] instar={"","","https://www.instagram.com/leejung_lee/","https://www.instagram.com/yeojin1009/","https://www.instagram.com/yell_yeri_kim/","https://www.instagram.com/isakkk_woo/","https://www.instagram.com/ji_hyo_f/"};
	String[] namu={"","https://namu.wiki/w/YGX","https://namu.wiki/w/리정","https://namu.wiki/w/여진(댄서)","https://namu.wiki/w/옐(비걸)","https://namu.wiki/w/이삭(댄서)","https://namu.wiki/w/지효(댄서)"};
	request.setAttribute("instar", instar);
	request.setAttribute("namu", namu);
}else{
	out.println("<script>");
	out.println("alert('크루를 선택해주세요.')");
	out.println("location.herf='history.back()'");
	out.println("</script>");
}
String[] files=new File(application.getRealPath("./crew/"+crew)).list();
Arrays.sort(files);
request.setAttribute("crew", crew);
request.setAttribute("files", files);
%>
<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<img alt="" src="./crew/${crew}/${files[0]}"/>
			</h3>
		</div>
		<div class="panel-body">
			<div class="media">
				<div class="media-left">
					<a href="#">
						<img alt="a" src="./crew/${crew}/${files[1]}"/>
					</a>
				</div>
				<div class="media-right">
					<h4 class="media-heading">
						<h5>${crew}</h5>
						<p><a class="btn btn-default" href="${namu[1]}">나무위키</a></p>
						<p><a class="btn btn-default" data-target="#${crew}" data-toggle="modal">영상보기</a></p>
					</h4>
				</div>
			</div>
			<c:forEach var="i" begin="2" end="<%=files.length-1%>" step="1">
				<div class="media">
					<div class="media-left">
						<a href="#">
							<img alt="a" src="./crew/${crew}/${files[i]}"/>
						</a>
					</div>
					<div class="media-right">
						<h4 class="media-heading">
							<c:set var="name" value="${fn:substring(files[i],1,fn:indexOf(files[i],'.'))}"></c:set>
							<h5>${name}</h5>
						</h4>
						<c:if test="${namu[i]!='#'}">
							<p><a class="btn btn-default" href="${namu[i]}">나무위키</a></p>
						</c:if>
						<p><a class="btn btn-default" href="${instar[i]}">인스타그램</a></p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="modal" id="cocan">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				CocaNButter 크루 영상 모음집
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/ZXXKvE3p_As"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/aLWZDJ2csDM"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/RICkHXBrrgQ"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/-20PCGUw_wA"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="holybang">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				HolyBang 크루 영상 모음집
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/NVdnbioSbWE"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/q6qQbLqw3dQ"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/TpLgU7XwXwI"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/zw7I0T-DmMY"></iframe>
					</div>
				</div><br/>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="hook">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				Hook 크루 영상 모음집
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/bd_Oy6yhv3A"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/f-faMvy1o-U"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/Lfio4-U_WO4"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/tvYXDC9oQRs"></iframe>
					</div>
				</div><br/>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="lachica">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				Lachica 크루 영상 모음집
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/pq4jzR7S7oY"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/wtL4wrs6YDQ"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/7pNXlKPnbyY"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/C0aJvIuO1js"></iframe>
					</div>
				</div><br/>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="prowdmon">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				Prowdmon 크루 영상 모음집
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/VTdTo2vCJ3g"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/tR_c0fiEPBM"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/MM5m1yLAfOs"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/EvVzDMBjDyg"></iframe>
					</div>
				</div><br/>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="want">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				Want 크루 영상 모음집
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/zw7I0T-DmMY"></iframe>
					</div>
				</div><br/>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="wayb">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				WayB 크루 영상 모음집
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/4y_L6Emtsxw"></iframe>
					</div>
				</div><br/>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="ygx">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				YGX 크루 영상 모음집
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" align="center">
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/AmsM8W6PoIw"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/T3y9R-RANbY"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/iS9UqrqYlok"></iframe>
					</div>
				</div><br/>
				<div class="row">
					<div class="embed-responsive embed-responsive-16by9 col-lg-12">
						<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/i2UZTtkE_Ec"></iframe>
					</div>
				</div><br/>
			</div>
		</div>
	</div>
</div>

<!--
	여기부터는 풋터	
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
</div>
<%} %>


</body>
</html>

















