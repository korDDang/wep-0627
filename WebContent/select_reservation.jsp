<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 정보 조히</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<br>
<h2>도서 예약정보 조회</h2>
<%
int cnt=0;
try{
	String sql="select count(*) from reservation0627";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}


%>
<div style="margin: 0 15%;">총  <%=cnt %>권의 도서 예약정보가 있습니다.</div>
<hr size="2px;">
<table border="1" id="tab1">
<tr>
<th>no</th>
<th>대출번<br>호</th>
<th>고객성명</th>
<th>도서코드</th>
<th>도서명</th>
<th>대출일자</th>
<th>반납일자</th>
<th>대출상태</th>
<th>등급</th>
</tr>
<%
int no=0;
try{
	String sql="select r.lentno,r.custname,r.bookno,b.bookname,to_char(r.outdate,'YYYY-MM-DD'),to_char(r.indate,'YYYY-MM-DD'),r.status,r.class1 from bookinfo0627 b,reservation0627 r where r.bookno=b.bookno order by bookno asc, lentno desc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String lentno=rs.getString(1);
		String custname=rs.getString(2);
		String bookno=rs.getString(3);
		String bookname=rs.getString(4);
		String outdate=rs.getString(5);
		String indate=rs.getString(6);
		String status=rs.getString(7);
		String class1=rs.getString(8);
		no++;


%>
<tr>
<td class="td3"><%=no %></td>
<td class="td4"><%=lentno %></td>
<td class="td3"><%=custname %></td>
<td class="td3"><%=bookno %></td>
<td class="td4"><%=bookname %></td>
<td class="td3"><%=outdate %></td>
<td class="td3"><%=indate %></td>
<td class="td4"><%=status %></td>
<td class="td3"><%=class1 %></td>
</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<br>
<div class="td2"><input type="button" value="도서 정보 추가" onclick="location.href='insert_book.jsp'" class="bt2"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>