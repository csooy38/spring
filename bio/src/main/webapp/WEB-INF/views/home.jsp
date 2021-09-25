<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:set var="path" value="<%=request.getContextPath() %>" scope="application" />
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<link href="resources/realgrid.2.4.1/realgrid-style.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<body>
	<h2>리얼 그리드 테스트</h2>
	
	<a href="${path }/realgrid_main">[리얼그리드 기능 테스트]</a>
	<a href="${path }/realgrid_import">[리얼그리드 import 테스트]</a>
	<a href="${path }/realgrid_create">[리얼그리드 필드&컬럼 일괄 생성 테스트]</a>
	<a href="${path }/info">[info database 테스트]</a>
	
</body>
<script src="resources/realgrid.2.4.1/realgrid-lic.js"></script>
<script src="resources/realgrid.2.4.1/realgrid.2.4.1.min.js"></script>
<script src="resources/realgrid.2.4.1/libs/jszip.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
</html>
