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
		<c:set var="dto" value="${cont }" />
		<hr width="50%" color="red">
			<h3>EMP 테이블 ${dto.getEname() } 사원 상세 내역</h3>
		<hr width="50%" color="red">
		<br><br>
		
		<table border="1" cellspacing="0" width="300">
			<tr>
				<th>사원번호</th>
				<td>${dto.getEmpno() }</td>
			</tr>
			<tr>
				<th>사원명</th>
				<td>${dto.getEname() }</td>
			</tr>
			<tr>
				<th>담당업무</th>
				<td>${dto.getJob() }</td>
			</tr>
			<tr>
				<th>관리자No.</th>
				<td>${dto.getMgr() }</td>
			</tr>
			<tr>
				<th>급  여</th>
				<td><fmt:formatNumber value="${dto.getSal() }" pattern="#,###,###,###,###.00" /></td>
			</tr>
			<tr>
				<th>보너스</th>
				<td><fmt:formatNumber value="${dto.getComm() }" pattern="#,###,###,###,###.00" /></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td>${dto.getDeptno() }</td>
			</tr>
			<tr>
				<th>입사일자</th>
				<td>${dto.getHiredate() }</td>
			</tr>
			
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>사원 정보가 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="location.href='emp_update.do?empno=${dto.getEmpno() }'">
						&nbsp;&nbsp;
					<input type="button" value="삭제" onclick="location.href='emp_delete.do?empno=${dto.getEmpno() }'">
						&nbsp;&nbsp;
					<input type="button" value="사원목록" onclick="location.href='emp_list.do'">
				</td>
			</tr>
			
		</table>
	</div>

</body>
</html>