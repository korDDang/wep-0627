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
	String sql="insert into bookinfo0627 values(?,?,?)";
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, request.getParameter("bookno"));
      pstmt.setString(2, request.getParameter("author"));
      pstmt.setString(3, request.getParameter("bookname"));
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