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
		<hr width="50%" color="red">
			<h3>회원 목록</h3>
		<hr width="50%" color="red">
		<br><br>
		
		<table border="1" cellspacing="0" width="450">
			<tr>
				<th>회원No.</th>
				<th>회원이름</th>
				<th>회원직업</th>
				<th>가입일자</th>
			</tr>
			
			<c:set var="list" value="${List }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.getNum() }</td>
						<td><a href="<%=request.getContextPath() %>/member_cont.do?num=${dto.getNum() }">${dto.getMemname() }</a></td>
						<td>${dto.getJob() }</td>
						<td>${dto.getRegdate().substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>조회된 회원 목록이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="회원등록" onclick="location.href='member_insert.do'">
				</td>
			</tr>
		</table>
		<br><br>
		
		<form method="post" action="<%=request.getContextPath() %>/member_search.do">
			<select name="field">
				<option value="memname">이름</option>
				<option value="job">직업</option>
				<option value="addr">주소</option>
			</select>
			
			<input type="search" name="keyword">
			
			<input type="submit" value="검색">
		</form>
	</div>

</body>
</html>