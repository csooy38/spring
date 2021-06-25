<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCTS 테이블 제품 상세 정보</title>
</head>
<body>

	<div align="center">
		<hr width="50%" color="gray">
			<h3>PRODUCTS 테이블 제품 상세 정보</h3>
		<hr width="50%" color="gray">
		<br><br>
		
		<table border="1" cellspacing="0" width="400">
		<c:set var="dto" value="${content }" />
		<c:if test="${!empty dto }">
			<tr>
				<th>카테고리 코드</th>
				<td>${dto.getCategory_fk() }</td>
			</tr>
			<tr>
				<th>제품명</th>
				<td>${dto.getProducts_name() }</td>
			</tr>
			<tr>
				<th>제품코드</th>
				<td>${dto.getEp_code_fk() }</td>
			</tr>
			<tr>
				<th>제품 입고가</th>
				<td><fmt:formatNumber value="${dto.getInput_price() }" />원</td>
			</tr>
			<tr>
				<th>제품 출고가</th>
				<td><fmt:formatNumber value="${dto.getOutput_price() }" />원</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td><fmt:formatNumber value="${dto.getTrans_cost() }" />원</td>
			</tr>
			<tr>
				<th>마일리지</th>
				<td><fmt:formatNumber value="${dto.getMileage() }" /></td>
			</tr>
			<tr>
				<th>제조사</th>
				<td>${dto.getCompany() }</td>
			</tr>
		</c:if>
		
		<c:if test="${empty dto }">
			<tr>
				<td colspan="2" align="center">
					<h3>등록된 제품 정보가 없습니다.</h3>
				</td>
			</tr>
		</c:if>
		
			<tr>
				<td colspan="2" align="center">
					<button onclick="location.href='product_modify.do?pnum=${dto.getPnum() }'">제품수정</button>
					<button onclick="location.href='product_delete.do?pnum=${dto.getPnum() }'">제품삭제</button>
					<button onclick="location.href='product_list.do'">제품목록</button>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>