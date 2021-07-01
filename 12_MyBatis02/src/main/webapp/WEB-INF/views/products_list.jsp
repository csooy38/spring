<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<hr width="50%" color="orange">
			<h3>PRODUCTS LIST</h3>
		<hr width="50%" color="orange">
		<br><br>
		
		<c:set var="list" value="list" />
		<table border="1" cellspacing="0" width="350">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
			</tr>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.get }
					</tr>
				</c:forEach>
			</c:if>
		</table>
				
	</div>

</body>
</html>