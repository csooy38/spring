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
		<hr width="50%" color="green">
			<h3>EMP 테이블 사원 정보 수정 폼</h3>
		<hr width="50%" color="green">
		<br><br>
		
		<form method="post" action="<%=request.getContextPath() %>/emp_update_ok.do">
			<table border="1" cellspacing="0" width="350">
				<c:set var="dto" value="${content }" />
				<c:set var="mList" value="${mgrList }" />
				<c:set var="dList" value="${deptList }" />
				
				<c:if test="${!empty dto }">
					<tr>
						<th>사원번호</th>
						<td><input name="empno" value="${dto.getEmpno() }" readonly></td>
					</tr>
					<tr>
						<th>사원명</th>
						<td><input name="ename" value="${dto.getEname() }" readonly></td>
					</tr>
					<tr>
						<th>담당업무</th>
						<td><input name="job" value="${dto.getJob() }"></td>
					</tr>
					<tr>
						<th>관리자No.</th>
						<td>
							<select name="mgr">
								<c:if test="${empty mList }">
									<option value="">:::관리자 없음:::</option> 
								</c:if>
								
								<c:if test="${!empty mList }">
									<c:forEach items="${mList }" var="i">
										<c:if test="${dto.getMgr() eq i.getEmpno() }">
											<option value="${i.getEmpno() }" selected>${i.getEname() } [${i.getEmpno() }]</option>
										</c:if>
										
										<c:if test="${dto.getMgr() ne i.getEmpno() }">
											<option value="${i.getEmpno() }">${i.getEname() } [${i.getEmpno() }]</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<th>급  여</th>
						<td><input name="sal" value="${dto.getSal() }"></td>
					</tr>
					<tr>
						<th>보너스</th>
						<td><input name="comm" value="${dto.getComm() }"></td>
					</tr>
					<tr>
						<th>부서번호</th>
						<td>
							<select name="deptno">
								<c:if test="${empty dList }">
									<option value="">:::부서번호 없음:::</option> 
								</c:if>
								
								<c:if test="${!empty dList }">
									<c:forEach items="${dList }" var="i">
										<c:if test="${dto.getDeptno() eq i.getDeptno() }">
											<option value="${i.getDeptno() }" selected>${i.getDname() } [${i.getDeptno() }]</option>
										</c:if>
										
										<c:if test="${dto.getDeptno() ne i.getDeptno() }">
											<option value="${i.getDeptno() }">${i.getDname() } [${i.getDeptno() }]</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<th>입사일자</th>
						<td><input name="hiredate" value="${dto.getHiredate() }" readonly></td>
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