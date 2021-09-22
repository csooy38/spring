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
<h1>
	Hello world!  
</h1>
<a href="${path }/realgrid">[리얼그리드]</a>
<a href="${path }/test">[test]</a>
<a href="${path }/test2">[test]</a>
<P>  The time on the server is ${serverTime}. </P>

<hr>

	<h3>리얼 그리드</h3>
	
	<div class="button">
		<button onclick="getInfo()">info 데이터 가져오기</button>
		<a href="${page }/getInfo">[getInfo]</a>
		<a href="${page }/test">[test]</a>
		<div id="result"></div>
	</div>
	
	 <div class="toolbar">
      <button onclick="fillJsonData()">name: value형 JSON 데이터 로드</button>
      <button onclick="saveData()">저장</button>
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
		datetimeFormat: "yyyy-MM-dd",
		amText: "오전",
	    pmText: "오후"
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
		}
	},
	{
		name: "NAME",
		fieldName: "name",
		type: "data",
		width: "100",
		header: {
			text: "이름"
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
			datetimeFormat: "yyyy-MM-dd"
		}
	},
];


var httpRequest;

function setProvider(filename) {
  httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = loadData;
  httpRequest.open("GET", "/public/data/" + filename);
  httpRequest.send();
}

function loadData() {
  if (httpRequest.readyState === XMLHttpRequest.DONE) {
    if (httpRequest.status === 200) {
      var data = JSON.parse(httpRequest.responseText);
      dataProvider.setRows(info);
      gridView.refresh();
    }
  }
}

var dataProvider, gridContainer, gridView;

function createGrid(container) {
  dataProvider = new RealGrid.LocalDataProvider();
  gridView = new RealGrid.GridView(container);
  gridView.setDataSource(dataProvider);

  dataProvider.setFields(fields);
  gridView.setColumns(columns);

  gridView.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
  gridView.header.height = 40;
  gridView.displayOptions.rowHeight = 36;
  gridView.footer.height = 40;
  gridView.stateBar.width = 16;
  gridView.editOptions.insertable = true;
  gridView.editOptions.appendable = true;
}

function start() {
  createGrid("realgrid");
}

// $.document.ready(start);
window.onload = start;
// domloaded를 대신 써도 됩니다.

window.onunload = function() {
  dataProvider.clearRows();

  gridView.destroy();
  dataProvider.destroy();

  gridView = null;
  dataProvider = null;
}

function fillJsonData() {
	console.log("fillJsonData()");
	dataProvider.fillJsonData(info, { fillMode: "set" });
}


function getInfo() {
	var infoData;
	var no = 0
	
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

function saveData(){
	
	console.log("saveData");
	
	insertData();
	updateData();
	deleteData();
}

function insertData(state){
	
	console.log("insertData");

 	var rows = null;
	var rbRowState = document.getElementsByName("rbRowStateArray");
	var state;
	
	for(var i = 0; i < rbRowState.length; i ++){
	  if(document.getElementsByName("rbRowStateArray")[i].checked){
	    state = document.getElementsByName("rbRowStateArray")[i].value
	  }
	}

	if (!state || state == "updated") {
		rows = dataProvider.getStateRows("updated");
	  //rows = dataProvider.getAllStateRows(); // RowState.NONE은 포함되지 않는다.
	} else {
	  rows = dataProvider.getStateRows(state);
	}
	alert(JSON.stringify(rows)); 
	
	console.log("rows : ", rows);
	console.log("rows.length : ", rows.length);
	
	var jsonList = [];
	
	for(var i=0; i<rows.length; i++){
		var jsonData = dataProvider.getJsonRow(rows[i]);
		console.log(JSON.stringify(jsonData));
		console.log("jsonData : ", jsonData);
		
		jsonList.push(jsonData);
		console.log("jsonList: ", jsonList);
	}
	
	$.ajax({
		url: "${path }/updateInfo",
		method: "get",
		success: function(jsonList){
			info = data;
			console.log("info:", info);
			
			console.log("ajax 성공");
		},
		error: function(request,status,error) {
			alert("error : ", error);
		}
	});
}

function updateData(state){
	
	console.log("updateData");
	
}

function deleteData(state){
	
	console.log("deleteData");
	
}

</script>
</html>
