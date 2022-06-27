<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
try{
	String sql="insert into reservation0627 values(?,?,?,?,?,?,?)";
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, request.getParameter("lentno"));
      pstmt.setString(2, request.getParameter("custname"));
      pstmt.setString(3, request.getParameter("bookno"));
      pstmt.setString(4, request.getParameter("outdate"));
      pstmt.setString(5, request.getParameter("indate"));
      pstmt.setString(6, request.getParameter("status"));
      pstmt.setString(7, request.getParameter("class1"));
	pstmt.executeUpdate();
	%><script>
	alert("저장성공");
    history.back(-1);
	</script>
	<% 
}catch(SQLException e){
	
	e.printStackTrace();
	System.out.println("저장실패");
}


%>
</body>
</html>