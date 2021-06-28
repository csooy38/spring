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
		<hr width="50%" color="gray">	
			<h3>MEMBER10 테이블 회원 전체 리스트</h3>
		<hr width="50%" color="gray">	
		<br><br>
		
		<table border="1" cellspacing="0" width="450">
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>회원명</th>
				<th>가입일자</th>
			</tr>
			<c:set var="list" value="${searchList }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.getNum() }</td>
						<td><a href="<%=request.getContextPath() %>/member_cont.do?num=${dto.getNum() }">${dto.getMemid() }</a></td>
						<td>${dto.getMemname() }</td>
						<td>${dto.getRegdate().substring(0,10) }</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>회원 목록이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="회원추가" onclick="location.href='member_add.do'">
				</td>
			</tr>
		</table>
		<br><br>
		
		<form method="post" action="<%=request.getContextPath()%>/member_search.do">
			<select name="field">
				<option value="id">아이디</option>
				<option value="name">이  름</option>
				<option value="job">직  업</option>
			</select>
			<input type="search" name="keyword">
			<input type="submit" value="검색">
		</form>
		
	</div>

</body>
</html>