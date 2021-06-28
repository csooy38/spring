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
		
		<table border="1" cellspacing="0" width="450">
			<c:set var="dto" value="${dto }" />
			<c:if test="${!empty dto }">
				<tr>
					<th>번  호</th>
					<td>${dto.getNum() }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${dto.getMemid() }</td>
				</tr>
				<tr>
					<th>이  름</th>
					<td>${dto.getMemname() }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<c:if test="${dto.getPwd().length() != 0 }">
							<c:forEach begin="1" end="${dto.getPwd().length() }">*</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>나  이</th>
					<td>${dto.getAge() }</td>
				</tr>
				<tr>
					<th>마일리지</th>
					<td><fmt:formatNumber value="${dto.getMileage() }" /> 포인트</td>
				</tr>
				<tr>
					<th>직  업</th>
					<td>${dto.getJob() }</td>
				</tr>
				<tr>
					<th>주  소</th>
					<td>${dto.getAddr() }</td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td>${dto.getRegdate() }</td>
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
					<input type="button" value="회원수정" onclick="location.href='member_update.do?num=${dto.getNum()}'">
					<input type="button" value="회원삭제" onclick="if(confirm('회원을 삭제하시겠습니까?')){location.href='member_delete.do?num=${dto.getNum()}'}">
					<input type="button" value="목록으로" onclick="location.href='member_list.do'">
				</td>
			</tr>
		</table>
		
	</div>

</body>
</html>