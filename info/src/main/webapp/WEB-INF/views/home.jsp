<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:set var="path" value="<%=request.getContextPath() %>" scope="application" />
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Home</title>
<style type="text/css">
.realgrid-pre-wrap{
  white-space: pre-wrap !important;
}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="resources/realgrid.2.4.1/realgrid-style.css" rel="stylesheet" />
<script src="resources/realgrid.2.4.1/realgrid-lic.js"></script>
<script src="resources/realgrid.2.4.1/realgrid.2.4.1.min.js"></script>
<script src="resources/realgrid.2.4.1/libs/jszip.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>
	Hello world!  
</h1>
<a href="${path }/realgrid">[리얼그리드]</a>
<a href="${path }/pivot">[pivot]</a>
<a href="${path }/test">[test]</a>
<a href="${path }/test2">[test]</a>
<P>  The time on the server is ${serverTime}. </P>

<hr>

	<h3>리얼 그리드</h3>
	
	<div class="button">
		<button onclick="getInfo()">info 데이터 가져오기</button>
		<button onclick="getXml()">xml 데이터 가져오기</button>
		<a href="${page }/getInfo">[getInfo]</a>
		<a href="${page }/test">[test]</a>
		<div id="result"></div>
	</div>
	
	 <div class="toolbar">
      <button onclick="fillJsonData()">name: value형 JSON 데이터 로드</button>
      <button onclick="saveData()">저장</button>
    </div>
    
    <br>
    
    <div class="toolbar">
	    <input type="checkbox" id="chkStates" checked="checked">
	    체크시 현재 row의 RowState를 함께 저장합니다.<br/>
	    <input type="text" id="saveTitle" placeholder="저장이름">
	    <button onclick="btnSavePoint()">복원시점 만들기</button>
	    <select id="listPoints" style="min-width:80px">
	      <option value="0">savePoint_0</option>
	    </select>
	    <button onclick="btnRollBack()">복원하기</button>
	    <button onclick="btnClearPoints()">savePoint 초기화</button>
	    <button onclick="autoSave()">autoSave</button>
	    <button onclick="autoSaveDel()">autoSave지우기</button>
	    <button onclick="returnSave()">돌아가기</button>
	    <button onclick="setCookie()">쿠키저장</button>
	    <button onclick="getCookie()">쿠키복원</button>
	    
	  </div>
    
    <br>
    <hr>
    	<select id="filter" name="filter">
    		<option value="INFO_IDX">번호</option>
    		<option value="NAME">이름</option>
    		<option value="REGDATE">등록일자</option>
    	</select>
    	<input type="text" id="filterTxt" name="filterTxt">
    	<button type="button" onclick="setFilter()">필터추가</button>
    <hr>
    
    <hr>
    
    	<button type="button" onclick="setPre()">자동 행높이 조절</button>
    
    <hr>
    <br>
    
    <div id="paging" style="float: left; height: 100%; padding-top: 20px;" ></div>
      <div id="wrapper" style=" float: left; height: 100%; padding-left: 20px; padding-top: 20px; ">
        <select name="selBox" id="selBox"></select>
        <label for="selBox">Page</label>
     </div>
    
    <br>
    
    <button type="button" onclick="showRg()">리얼그리드</button>
    <button type="button" onclick="hideRg()">낙서장</button>

    
	<div  id="rg1">
	<div id="realgrid"  style="width: 100%; height: 440px;"></div>
	</div>
	<hr>
		<button type="button" onclick="fillJsonData2()">데이터 가져오기</button>

	<br>
	
	<div  id="rg2" style="display:none;">
		<div id="realgrid2"  style="width: 100%; height: 440px;" ></div>
	</div>
	
	
	<hr>
</body>
<script type="text/javascript">

var info;

/* var fieldNames = ["info_idx","name","regdate"];
var testList = [];

for(var i=0; i<fieldNames.length; i++){
	var data = new Object();
	
	data.fieldName = fieldNames[i];
	data.dataType = "text";
	
	testList.push(data);
}

var fields = JSON.stringify(testList);

console.log(fields); */

function showRg(){
	$("#rg1").show();
	$("#rg2").hide();
}

function hideRg(){
	$("#rg2").show();
	$("#rg1").hide();
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

var val = ["VINET", "HANAR", "SUPRD", "VICTE", "THREE", "SEVEN"];
var lab = ["<VINET>", "<HANAR>", "<SUPRD>", "<VICTE>", "<THREE>", "<SEVEN>"]; 

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
			text: "이름"
		},
		styleName: "realgrid-pre-wrap",
		  values: val,
		editor: {
			type: "dropdown",
			dropDownCount: 4
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


var dataProvider, gridContainer, gridView;
var dataProvider2, gridContainer2, gridView2;

function createGrid(container) {
  dataProvider = new RealGrid.LocalDataProvider(true);
  gridView = new RealGrid.GridView(container);
  gridView.setDataSource(dataProvider);

  dataProvider.setFields(fields);
  gridView.setColumns(columns);

  gridView.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
  gridView.header.height = 40;
  gridView.displayOptions.rowHeight = -1;
  gridView.displayOptions.minRowHeight = 36;
  gridView.footer.height = 40;
  gridView.stateBar.width = 16;
  
  gridView.pasteOptions.selectBlockPaste = true;
  gridView.editOptions.insertable = true;
  gridView.editOptions.appendable = true;
  gridView.setColumnProperty("INFO_IDX", "autoFilter", true);
  gridView.setColumnProperty("NAME", "autoFilter", true);
  gridView.setColumnProperty("REGDATE", "autoFilter", true);
  gridView.pasteOptions.enableAppend = true;
  gridView.pasteOptions.singleMode = false;
  gridView.pasteOptions.applyNumberFormat = true;
  
  // 행 삭제 - 실제 삭제가 아니라 삭제라고만 뜨게
  dataProvider.setOptions({
	  softDeleting : true
	  //softDeleting : $("#chkSoftDeleting").is(":checked")
  });
  
  // 행 삭제 가능하게 하는 옵션
   gridView.setEditOptions({
	  deletable: true
	}); 
  
  gridView.displayOptions.fitStyle = "evenFill"; 
}

var fields2 = [];

for(var i=0; i<10; i++){
	var data = new Object();
	data.name = "field"+i;
	data.type = "data";
	data.width = "100";
	
	var textt = new Object();
	textt.text = data.name;
	data.header = textt;
	
	fields2.push(data);
}



var info2 = [];
for(var j=0; j<12; j++){
	var data = new Object();
	for(var i=0; i<10; i++){
		data["field"+i] = "";
	}
	info2.push(data);
}
 
/* var info2 = [
	["1","2","3","4","5","6","7","8","9","10"],
	["1","2","3","4","5","6","7","8","9","10"]
	]; */

function createGrid2(container) {
	  dataProvider2 = new RealGrid.LocalDataProvider(true);
	  gridView2 = new RealGrid.GridView(container);
	  gridView2.setDataSource(dataProvider2);

	  gridView2.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
	  gridView2.header.height = 40;
	  gridView2.displayOptions.rowHeight = -1;
	  gridView2.displayOptions.minRowHeight = 36;
	  gridView2.footer.height = 40;
	  gridView2.stateBar.width = 16;
	  
	  gridView2.pasteOptions.selectBlockPaste = true;
	  gridView2.editOptions.insertable = true;
	  gridView2.editOptions.appendable = true;
	  gridView2.pasteOptions.enableAppend = true;
	  gridView2.pasteOptions.singleMode = false;
	  gridView2.pasteOptions.applyNumberFormat = true;
	  
	  // 행 삭제 - 실제 삭제가 아니라 삭제라고만 뜨게
	  dataProvider2.setOptions({
		  softDeleting : true
		  //softDeleting : $("#chkSoftDeleting").is(":checked")
	  });
	  
	  // 행 삭제 가능하게 하는 옵션
	   gridView2.setEditOptions({
		  deletable: true
		}); 
	  
	  gridView2.displayOptions.fitStyle = "evenFill"; 
	  
	  //dataProvider2.setRowCount(100);
	  setFieldsNColumns(dataProvider2, gridView2, fields2);
	}

//필드,컬럼 동적 생성
function setFieldsNColumns(provider, grid, columnInfo) {
    var fields22 = [];

    for (var key in columnInfo) {
        var col = columnInfo[key];

   if (!col.fieldName) col.fieldName = col.name;
              if (col && (!col.items)) {
                  //field 구성
                  var f = {};
                  f.fieldName = col.name;
                  if (col.tag && col.tag.dataType) f.dataType = col.tag.dataType;

                  fields22
                  fields22.push(f);
              };
    };

    provider.setFields(fields22);
    grid.setColumns(columnInfo);
   };

function start() {
  createGrid("realgrid");
  createGrid2("realgrid2");
}

// $.document.ready(start);
window.onload = start;


function setPre(){
	gridView.displayOptions.rowHeight = -1;
	gridView.displayOptions.minRowHeight = 36;
 }
 
function autoSave(){
	window.localStorage.clear();
	gridView.commit();
	
 	var rows = null;
	var state = ["created", "updated", "deleted", "none"];
	
	for(var i=0; i<state.length; i++){
		rows = dataProvider.getStateRows(state[i]);
		if(rows.length > 0) {
			setData(rows, state[i]);		
		}
	}
	window.localStorage.setItem("dataList", JSON.stringify(dataList));
 }
 
 var dataList = [];
 
function setData(rows, state){
	 for(var i=0; i<rows.length; i++){
		 var obj = dataProvider.getJsonRow(rows[i]);
		 obj.state = state;  
		 dataList.push(obj);
	 }
}
 
function setFilter(){
	var field = $('select[name="filter"]').val();
	var fieldTxt = $('input[name="filterTxt"]').val();
	
	fieldTxt = fieldTxt.toString();
	
	console.log(field);
	console.log(fieldTxt);
	
	var filters = [
		  {
		    name: filterTxt,
		    criteria: "value = "+filterTxt,
		    active: false
		  }
		];
	
	console.log(filters);
		var overwrite = true; // false면 기존에 같은 이름의 필터가 있을 때 예외 발생.

		gridView.addColumnFilters(field, filters, overwrite);
}
 
 
function returnSave(){
	gridView.cancel();
	dataProvider = window.localStorage.getItem("dataProvider");
	var point = window.localStorage.getItem("savePoints");
	dataProvider.rollback(point);
	console.log("point", point);
}
	    
function autoSaveDel(){
	dataProvider.clearSavePoints();
	window.localStorage.clear();
}	     
	

var titleArr = [];

function btnRollBack() {
	  var point = document.getElementById('listPoints').value;
		// var point = $("#listPoints").val();
	 
	  gridView.commit();
	  dataProvider.rollback(point); // point를 생략하면 최초 복제로 복원
	  
	  for(var i=0; i<titleArr.length; i++){
		  
	  }
	  
	  refreshPoints();
	}

function btnSavePoint() {
	
	var title = $("#saveTitle").val();
	titleArr.push(title); 
	
	  gridView.commit();
	  const isCheckState = document.getElementById('chkStates').checked;
	  console.log("isCheckState", isCheckState);
	  dataProvider.savePoint(isCheckState);
	  // dataProvider.savePoint($("#chkStates").is(":checked"));
	  
	  refreshPoints();
	}
	 
function btnClearPoints() {
	  dataProvider.clearSavePoints();
	  refreshPoints();
	}


function refreshPoints() {
	    var points = dataProvider.getSavePoints();
	    
	    console.log("points : ", points);
	    var list = $("#listPoints");
	 
	    list.empty();
	    
	    for(var i=0; i<points.length; i++){
	    	$("<option />", { value: points[i], text: titleArr[i]}).appendTo(list);
	    }
	    
	    
	   /*  $.map(points, function (c) {
	        $("<option />", { value: c, text: "savePoint_" + c + e}).appendTo(list);
	    }); */
	}





function fillJsonData() {
	console.log("fillJsonData()");
	dataProvider.fillJsonData(info, { fillMode: "set" });
	//setPaging();
}


function fillJsonData2() {
	console.log("fillJsonData2()");
	dataProvider2.setRows(info2);
	//dataProvider2.fillJsonData(info2, { fillMode: "set" });
	console.log("!1", info2);
	console.log("!2", fields2);
}


function getInfo() {
	
	var no = 0
	
	if(window.localStorage.getItem("dataList") != null){
		var list = JSON.parse(window.localStorage.getItem("dataList"));
		info = list;
		fillJsonData();
		
		for(var i=0; i<list.length; i++){
			dataProvider.setRowState(i, list[i].state, true);
		}
		
	}else {
	
	console.log("ajax 실행");
	
	$.ajax({
		url: "${path }/getInfo",
		method: "get",
		success: function(data){
			info = data;
			fillJsonData();
			console.log(info);
			console.log("ajax 성공");
		},
		error: function(request,status,error) {
			alert("error : ", error);
		}
	});
	
	}
}

function saveData(){
	
	console.log("saveData");
	
	//insertData();
	updateData();
	//deleteData();
}

function updateData(){
	
	console.log("updateData");

 	var rows = null;
	var state;
	
	rows = dataProvider.getStateRows("updated");
	
	alert(JSON.stringify(rows)); 
	
	console.log("rows : ", rows);
	console.log("rows.length : ", rows.length);
	
	var jsonList = [];
	
	for(var i=0; i<rows.length; i++){
		var jsonData = dataProvider.getJsonRow(rows[i]);
		jsonList.push(jsonData);
	}
	
		console.log("jsonList: ", JSON.stringify(jsonList));
	$.ajax({
		url: "${path }/updateInfo",
		type: "post",
		data: {jsonList : JSON.stringify(jsonList)},
		dataType: "json",
		contentType:'application/json',
		success: function(data){
			if(data > 1){
				console.log("ajax 성공");
				getInfo();
			}else {
				console.log("ajax 통신 실패");
			}
		},
		error: function(request,status,error) {
			alert("error : ", error, request, status);
		}
	});
}

function insertData(){
	
	console.log("insertData");
	
	var rows = null;
	var rbRowState = document.getElementsByName("rbRowStateArray");
	var state;
	
	for(var i = 0; i < rbRowState.length; i ++){
	  if(document.getElementsByName("rbRowStateArray")[i].checked){
	    state = document.getElementsByName("rbRowStateArray")[i].value
	  }
	}

	if (!state || state == "created") {
		rows = dataProvider.getStateRows("created");
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
		console.log("jsonList: ", JSON.stringify(jsonList));
	}
	
	$.ajax({
		url: "${path }/insertInfo",
		type: "post",
		data: JSON.stringify(jsonList),
		dataType: "json",
		contentType:'application/json',
		success: function(data){
			if(data > 1){
				console.log("ajax 성공");
				getInfo();
			}else {
				console.log("ajax 통신 실패");
			}
		},
		error: function(request,status,error) {
			alert("error : ", error, request, status);
		}
	});
}

function deleteData(){
	
	console.log("deleteData");
	
	var rows = null;
	var rbRowState = document.getElementsByName("rbRowStateArray");
	var state;
	
	for(var i = 0; i < rbRowState.length; i ++){
	  if(document.getElementsByName("rbRowStateArray")[i].checked){
	    state = document.getElementsByName("rbRowStateArray")[i].value
	  }
	}

	if (!state || state == "deleted") {
		rows = dataProvider.getStateRows("deleted");
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
		console.log("jsonList: ", JSON.stringify(jsonList));
	}
	
	$.ajax({
		url: "${path }/deleteInfo",
		type: "post",
		data: JSON.stringify(jsonList),
		dataType: "json",
		contentType:'application/json',
		success: function(data){
			if(data > 1){
				console.log("ajax 성공");
				getInfo();
			}else {
				console.log("ajax 통신 실패");
			}
		},
		error: function(request,status,error) {
			alert("error : ", error, request, status);
		}
	});
	
}

function setPaging(){
	  var totalData = dataProvider.getRowCount();    // 총 데이터 수
	  var dataPerPage = 5;    // 한 페이지에 나타낼 데이터 수
	  var pageCount = 10;        // 한 화면에 나타낼 페이지 수

	  setPageSelbox(totalData, dataPerPage);
	  gridView.setPaging(true, dataPerPage);
	  paging(totalData, dataPerPage, pageCount, 1);
	}

	function paging(totalData, dataPerPage, pageCount, currentPage){
	  
	  var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
	  var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
	  
	  var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
	  if(last > totalPage)
	      last = totalPage;
	  var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
	  var next = last+1;
	  var prev = first-1;
	  
	  var $pingingView = $("#paging");
	  
	  var html = "";

	  if(prev == 0) {
	      html += "<a href=# id='first' class='disabled'>|<</a> ";
	      html += "<a href=# id='prev' class='disabled'><</a> ";
	  } else {
	      html += "<a href=# id='first'>|<</a> ";
	      html += "<a href=# id='prev'><</a> ";         
	  }
	  
	  
	  for(var i=first; i <= last; i++){
	      html += "<a href='#' style='width: 50px' id=" + i + ">" + i + "</a> ";
	  }
	  
	  if(last < totalPage) {
	      html += "<a href=# id='next'>></a>";
	      html += "<a href=# id='last'>>|</a>";
	  } else {
	      html += "<a href=# id='next' class='disabled'>></a>";
	      html += "<a href=# id='last' class='disabled'>>|</a>";
	  }
	  
	  $("#paging").html(html);    // 페이지 목록 생성
	  
	  $("#paging a").css({"color": "black",
	                      "padding-left": "10px"});
	                      
	  $("#paging a#" + currentPage).css({"text-decoration":"none", 
	                                     "color":"red", 
	                                     "font-weight":"bold"});    // 현재 페이지 표시
	                                     
	  $("#paging a").click(function(event){
	      event.preventDefault();
	      
	      var $item = $(this);
	      var $id = $item.attr("id");
	      var selectedPage = $item.text();
	      

	      if($id == "first")   selectedPage = 1;
	      if($id == "next")    selectedPage = next;
	      if($id == "prev")    selectedPage = prev;
	      if($id == "last")    selectedPage = totalPage;
	      
	      gridView.setPage(selectedPage-1);
	      paging(totalData, dataPerPage, pageCount, selectedPage);
	  });
	                                     
	}

	function setPageSelbox(totalData, dataPerPage){
	  var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수

	  for (var i=1; i <= totalPage; i++) {
	      var optStr = "<option value=" + i + ">" + i + "</option>";
	      console.log(optStr);
	      $("#selBox").append(optStr);
	  }

	  $("#selBox").change(function() {
	      var totalData = dataProvider.getRowCount();    // 총 데이터 수
	      var dataPerPage = 8;    // 한 페이지에 나타낼 데이터 수
	      var pageCount = 3;        // 한 화면에 나타낼 페이지 수
	      var selectedPage = $(this).val();

	      gridView.setPage(selectedPage-1);
	      paging(totalData, dataPerPage, pageCount, selectedPage);
	  });
	}







</script>
</html>