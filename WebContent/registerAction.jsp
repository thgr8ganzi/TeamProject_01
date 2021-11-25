<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@ page import="project1.UserDAO" %>
   <%@ page import="java.io.PrintWriter" %>
   <% request.setCharacterEncoding("UTF-8"); %>
   <jsp:useBean id="user" class="project1.UserVO" scope="page">
   <jsp:setProperty name="user" property="userID"/>
   <jsp:setProperty name="user" property="userPassword"/>
   <jsp:setProperty name="user" property="userName"/>
   <jsp:setProperty name="user" property="userGender"/>
   <jsp:setProperty name="user" property="userEmail"/>
   </jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 시도</title>
</head>
<body>
	
<%
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('빈칸 없이 입력해 주세요.')");
		script.println("location.href = 'register.jsp'");
		script.println("</script>");
	}else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("location.href = 'register.jsp'");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'mainhome.jsp'");
 			script.println("</script>");
			
		}
	}
%>

</body>
</html>