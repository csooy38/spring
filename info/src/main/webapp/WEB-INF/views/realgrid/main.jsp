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
<style type="text/css">
.realgrid-pre-wrap{
  white-space: pre-wrap !important;
}

</style>
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
	<div id="realgrid" style="width:100%; height:500px;"></div>
	
	<hr>
	

</body>
<script src="resources/realgrid.2.4.1/realgrid-lic.js"></script>
<script src="resources/realgrid.2.4.1/realgrid.2.4.1.min.js"></script>
<script src="resources/realgrid.2.4.1/libs/jszip.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

var info;
var dataProvider, gridContainer, gridView;

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
				fillJsonData();
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
		container = document.getElementById('realgrid');
		dataProvider = new RealGrid.LocalDataProvider(true);
		gridView = new RealGrid.GridView(container);
		  gridView.setDataSource(dataProvider);
		  
		  dataProvider.setFields(fields);
		  gridView.setColumns(columns);
		  
		  gridView.displayOptions.rowHeight = -1;
	}
	
	function fillJsonData() {
		dataProvider.fillJsonData(info, { fillMode: "set" });
	}

	
	var fields = [
	 	{
			fieldName: "INFO_IDX",
			dataType: "number"
		},
		{
			fieldName: "NAME",
			dataType: "text"
		},
		{
			fieldName: "regist",
			dataType: "text"
		},
		{
			fieldName: "gender",
			dataType: "text"
		},
		{
			fieldName: "army",
			dataType: "text"
		},
		{
			fieldName: "company",
			dataType: "text"
		},
		{
			fieldName: "depart",
			dataType: "text"
		},
		{
			fieldName: "position",
			dataType: "text"
		},
		{
			fieldName: "phone",
			dataType: "text"
		},
		{
			fieldName: "email",
			dataType: "text"
		},
		{
			fieldName: "addr",
			dataType: "text"
		},
		{
			fieldName: "profile",
			dataType: "text"
		},
		{
			fieldName: "REGDATE",
			dataType: "datetime",
			datetimeFormat: "yyyy-MM-dd HH:mm:ss",
		}, 
	];

	var columns = [
		{
			name: "INFO_IDX",
			fieldName: "info_idx",
			type: "data",
			width: "100",
			header: {
				text: "번호"
			},
			styleName: "realgrid-pre-wrap"
		},
		{
			name: "NAME",
			fieldName: "name",
			type: "data",
			width: "100",
			header: {
				text: "이름",
			},
			styleName: "realgrid-pre-wrap",
			editor: {
				type: "multiline"
			}
		},
		{
			name: "REGDATE",
			fieldName: "REGDATE",
			type: "data",
			width: "200",
			header: {
				text: "등록일자"
			},
			editor: {
				type: "date",
				datetimeFormat: "yyyy-MM-dd HH:mm:ss"
			},
			dateFormat: "yyyy-MM-dd HH:mm:ss",
			styleName: "realgrid-pre-wrap"
		},
	];

	window.onload = realGrid;
</script>
</html>