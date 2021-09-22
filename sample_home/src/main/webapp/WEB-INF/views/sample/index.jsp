<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>INDEX</h3>
	
	<table>
			<tr>
				<th>사원번호</th>
				<th>성명</th>
				<th>직업</th>
				<th>매니저</th>
				<th>고용일자</th>
			</tr>
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<tr>
					<td><c:out value="${dto.empno }" /> </td>
					<td><c:out value="${dto.ename }" /> </td>
					<td><c:out value="${dto.job }" /> </td>
					<td><c:out value="${dto.mgr }" /> </td>
					<td><c:out value="${dto.hiredate }" /> </td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<h3>조회된 사원이 없습니다.</h3>
		</c:if>
	</table>

</body>
</html>