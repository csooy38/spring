<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

	<div align="center">
		<hr width="50%" color="lightgreen">
			<h3>PRODUCTS 테이블</h3>
		<hr width="50%" color="lightgreen">
		<br><br>
		
		<a href="<%=request.getContextPath() %>/products_list.do">[PRODUCTS 테이블 전체 리스트]</a>
	</div>
	
</body>
</html>
