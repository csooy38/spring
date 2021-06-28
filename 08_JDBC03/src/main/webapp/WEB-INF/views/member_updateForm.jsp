<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<hr width="50%" color="gray">	
			<h3>MEMBER10 테이블 회원 상세 내역</h3>
		<hr width="50%" color="gray">	
		<br><br>
		
		<form method="post" action="<%=request.getContextPath()%>/member_updateOk.do">
		<table border="1" cellspacing="0" width="450">
			<c:set var="dto" value="${dto }" />
			<c:if test="${!empty dto }">
				<tr>
					<th>번  호</th>
					<td><input name="num" value="${dto.getNum() }" readonly></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name="memid" value="${dto.getMemid() }" readonly></td>
				</tr>
				<tr>
					<th>이  름</th>
					<td><input name="memname" value="${dto.getMemname() }" readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd"> 
					</td>
				</tr>
				<tr>
					<th>나  이</th>
					<td><input name="age" value="${dto.getAge() }"></td>
				</tr>
				<tr>
					<th>마일리지</th>
					<td><input name="mileage" value="${dto.getMileage() }"> 포인트</td>
				</tr>
				<tr>
					<th>직  업</th>
					<td><input name="job" value="${dto.getJob() }"></td>
				</tr>
				<tr>
					<th>주  소</th>
					<td><input name="addr" value="${dto.getAddr() }"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input name="regdate" value="${dto.getRegdate() }" readonly></td>
				</tr>
			</c:if>
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>조회된 회원이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<tr>	
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		</form>
		
	</div>

</body>
</html>