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
		
		<form method="post" action="<%=request.getContextPath() %>/product_modifyOk.do">
			<c:set var="dto" value="${content }" />
			<c:set var="list" value="${cateList }" />
			<input type="hidden" name="pnum" value="${dto.getPnum() }">
			
			<table border="1" cellspacing="0" width="350">
			<c:if test="${!empty dto }">
				<tr>
					<th>카테고리 코드</th>
					<td>
						<select name="category_fk">
							<c:if test="${empty list }">
								<option value="">:::카테고리 없음:::</option>
							</c:if>
							
							<c:if test="${!empty list }">
								<c:forEach items="${list }" var="i">
									<c:if test="${dto.getCategory_fk() eq i.getCategory_code() }">
										<option value="${i.getCategory_code() }" selected>${i.getCategory_name() } [${i.getCategory_code() }]</option>
									</c:if>
									
									<c:if test="${dto.getCategory_fk() ne i.getCategory_code() }">
										<option value="${i.getCategory_code() }" disabled>${i.getCategory_name() } [${i.getCategory_code() }]</option>
									</c:if>
								</c:forEach>
							</c:if>
						</select>
					</td>
				</tr>
				<tr>
					<th>제품명</th>
					<td><input name="products_name" value="${dto.getProducts_name() }" disabled></td>
				</tr>
				<tr>
					<th>제품코드</th>
					<td><input name="ep_code_fk" value="${dto.getEp_code_fk() }" disabled></td>
				</tr>
				<tr>
					<th>제품 입고가</th>
					<td><input name="input_price" value="${dto.getInput_price() }">원</td>
				</tr>
				<tr>
					<th>제품 출고가</th>
					<td><input name="output_price" value="${dto.getOutput_price() }">원</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td><input name="trans_cost" value="${dto.getTrans_cost() }">원</td>
				</tr>
				<tr>
					<th>마일리지</th>
					<td><input name="mileage" value="${dto.getMileage() }"></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><input name="company" value="${dto.getCompany() }" disabled></td>
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
						<input type="submit" value="제품수정">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>