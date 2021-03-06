<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		doc.bookno.focus();
	}else if(doc.author.value==""){
		alert("작가가 입력되지 않았습니다.");
			doc.author.focus();
		}else if(doc.bookname.value==""){
			alert("도서이름이 입력되지 않았습니다.");
			doc.bookname.focus();
		}else{
			alert("등록이 완료되었습니다");
			doc.submit();
		}
	
}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<br>
<h1>도서 정보 등록 화면</h1>
<form name="form" method="post" action="insert_bookProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>도서코드</th>
<td>
<input type="text" name="bookno" class="in1">
</td>
</tr>
<tr>
<th>저자</th>
<td>
<input type="text" name="author" class="in1">
</td>
</tr>
<tr>
<th>도서이름</th>
<td>
<input type="text" name="bookname" class="in1">
</td>
</tr>
<tr>
<td colspan="2" class="td1">
<input type="button" value="등록" onclick="check()" class="bt1">
<input type="button" value="취소" onclick="location.href='index.jsp'"  class="bt1">
</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>