<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/realgrid.2.4.1/realgrid-style.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

	<h3>리얼 그리드</h3>
	
	<div class="button">
		<button onclick="getInfo()">info 데이터 가져오기</button>
		<a href="${path }/test">[test]</a>
		<div id="result"></div>
	</div>
	
	 <div class="toolbar">
      <button onclick="fillJsonData()">name: value형 JSON 데이터 로드</button>
    </div>
	<div id="realgrid"></div>
	
	<hr>
	

</body>
<script src="resources/realgrid.2.4.1/realgrid-lic.js"></script>
<script src="resources/realgrid.2.4.1/realgrid.2.4.1.min.js"></script>
<script src="resources/realgrid.2.4.1/libs/jszip.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

var info;
	
document.addEventListener('DOMContentLoaded', function () {
	  // 설치
	  const container = document.getElementById('realgrid');
	  const provider = new RealGrid.LocalDataProvider(false);
	  const gridView = new RealGrid.GridView(container);
	  gridView.setDataSource(provider);

	  // 필드 생성
	  provider.setFields([
	    {
	      fieldName: "KorName",
	      dataType: "text",
	    },
	    {
	      fieldName: "Age",
	      dataType: "number",
	    },
	  ]);

	  // 컬럼 생성
	  gridView.setColumns([
	    {
	      name: "KorNameColumn",
	      fieldName: "KorName",
	      type: "data",
	      width: "70",
	      header: {
	        text: "이름",
	      },
	    },
	  ]);
	});
	
	function getInfo() {
		console.log("ajax 실행");
		
		$.ajax({
			url: "${path }/getInfo",
			method: "get",
			success: function(data){
				/* $.each(data, function(key, value) {
					for(var i=0; i<value.length; i++){
						alert(value[i].name);
					}
				}); */
				
				info = data;
				console.log("info:", info);
				
				console.log("ajax 성공");
			},
			error: function(request,status,error) {
				alert("error : ", error);
			}
		});
	}
	
	function realGrid(){
		// 설치
		  const container = document.getElementById('realgrid');
		  const provider = new RealGrid.LocalDataProvider(false);
		  const gridView = new RealGrid.GridView(container);
		  gridView.setDataSource(provider);

		  // 필드 생성
		  provider.setFields([
		    {
		      fieldName: "KorName",
		      dataType: "text",
		    },
		    {
		      fieldName: "Age",
		      dataType: "number",
		    },
		  ]);

		  // 컬럼 생성
		  gridView.setColumns([
		    {
		      name: "KorNameColumn",
		      fieldName: "KorName",
		      type: "data",
		      width: "70",
		      header: {
		        text: "이름",
		      },
		    },
		  ]);
	}

</script>
</html>