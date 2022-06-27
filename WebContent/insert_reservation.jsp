<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function ch() {
	var doc=document.form;
	doc.submit();
}
function ch1(){
	var doc=document.form;
	if(document.form.indate.value!=""){
		document.form.status[1].checked=true;
	}else{
		document.form.status[0].checked=true;
	}
}
function check() {
	var doc=document.form;
	if(doc.lentno.value==""){
		alert("대출번호가 입력되지 않았습니다.");
		doc.lentno.focus();
	}else if(doc.custname.value==""){
		alert("고객성명이 입력되지 않았습니다.");
			doc.custname.focus();
		}else if(doc.bookno.value==""){
			alert("도서코드가 입력되지 않았습니다.");
			doc.bookno.focus();
		}else{
			form.action="insert_reservationProcess.jsp";
		}
	
}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<%
String lentno=request.getParameter("lentno");
if(lentno==null){
	lentno="";
}
String custname=request.getParameter("custname");
if(custname==null){
	custname="";
}
String outdate=request.getParameter("outdate");
if(outdate==null){
	outdate="";
}
String indate=request.getParameter("indate");
if(indate==null){
	indate="";
}
String bookname=request.getParameter("bookname");
if(bookname==null){
	bookname="";
}
String bookno=request.getParameter("bookno");
if(bookno==null){
	bookno="";
}else{
try{
	String sql="select bookname from bookinfo0627 where bookno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, bookno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		bookname=rs.getString(1);
	}else{
		%><script>
		alert("등록되어 있지 않는 도서코드 입니다");
		</script>
		<% 
	}

}catch(Exception e){
	e.printStackTrace();
	
}
}

%>
<section id="sec1">
<br>
<h1>도서 대출 예약 정보 등록 화면</h1>
<form name="form" method="post" action="insert_reservation.jsp">
<table border="1" id="tab1">
<tr>
<th>대출번호</th>
<td>
<input type="text" name="lentno" class="in1" value="<%=lentno %>">
</td>
<th>고객성명</th>
<td>
<input type="text" name="custname" class="in1" value="<%=custname %>">
</td>
</tr>
<tr>
<th>도서코드</th>
<td>
<input type="text" name="bookno" class="in1" onchange="ch()" value="<%=bookno %>">
</td>
<th>도서이름</th>
<td>
<input type="text" name="bookname" class="in1" value="<%=bookname %>">
</td>
</tr>
<tr>
<th>대출일자</th>
<td>
<input type="text" name="outdate" class="in1" value="<%=outdate %>">
</td>
<th>반납일자</th>
<td>
<input type="text" name="indate" class="in1" value="<%=indate %>" onclick="ch1()">
</td>
<tr>
<th>대출상태</th>
<td>
<input type="radio" name="status" value="1" checked>대출
<input type="radio" name="status" value="2">반납
</td>
<th>등급</th>
<td>
<select name="class1">
<option value="S">S</option>
<option value="A">A</option>
<option value="B">B</option>
<option value="C">C</option>
</select>
</td>
</tr>
<tr>
<td colspan="4" class="td1">
<input type="submit" value="저장" onclick="check()" class="bt2">
<input type="button" value="취소" onclick="location.href='index.jsp'"  class="bt2">
</td>
</tr>

</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>