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
	
	
	<div style="width: 500px; height: 1000px; display: inline-block; position: fixed; margin-left: 25px;">
		<h2>INFO 리얼 그리드 테스트</h2>
	
		<div>
		<p>데이터 로드</p>
			<button onclick="getInfo()">info 데이터 가져오기</button>
			<button onclick="getBio()">bio 데이터 가져오기</button>
			<button onclick="getSurvey()">survey 데이터 가져오기</button>
			<button onclick="fillJsonData()">name: value형 JSON 데이터 로드</button>
			<button onclick="saveData()">저장</button>
	</div>
	
		<div id="realgrid" style="width: 500px; height: 800px;"></div>
	</div>
	
	
	
	<div class="toolbar" style="width: 500px; height: 800px; display: inline-block; margin-left: 550px;">
		<div class="testBtn">
			<p>체크 & 라디오버튼</p>
      		<button onclick="btnSetVisibleTrue()">체크바 표시</button>
      		<button onclick="btnSetVisibleFalse()">체크바 표시 취소</button>
      		<button onclick="btnSetExclusiveTrue()">라디오버튼으로 변환</button>
     		<button onclick="btnSetExclusiveFalse()">체크바로 변환</button>
		</div>
		
		<hr>
		
		<div class="testBtn">
			<p>정렬 및 필터링</p>
			<button onclick="sortData()">컬럼 정렬(설문답변 마스터->식별번호순)</button>
			<button onclick="groupPanel()">그룹판넬 만들기</button>
			<button onclick="groupingPanel()">그룹핑(담당기관-성별)</button>
			<button onclick="setFiltering()">필터링</button>
			<button onclick="setFilteringOption()">필터링 옵션</button>
			<button onclick="dataFiltering()">데이터 필터링</button>
		</div>
		
		<hr>
		
		<div>
			<p>셀 선택</p>
			<button onclick="block()">block</button>
			<button onclick="selectRows()">row</button>
			<button onclick="rows()">복수 rows</button>
			<button onclick="selectColumns()">column</button>
			<button onclick="setColumns()">복수 columns</button>
			<button onclick="selectNone()">none</button>
		</div>
		
		<hr>
		
		<div>
			<p>행 편집</p>
			<button onclick="setEditOptions()">EditOptions 설정</button>
			<button onclick="insertRow()">행 삽입(지정행 이전)</button>
			<button onclick="insertRowShift()">행 삽입(지정행 이후)</button>
			<button onclick="appendRow()">행 추가</button>
			<button onclick="btnSetEditOptions()">삭제 설정</button>
		    <button onclick="btnSoftDeleting()">softDeleting 설정</button>
		    <button onclick="btnDeleteCreated()">deleteCreated 설정</button>
		    <button onclick="btnHideDeletedRows()">hideDeletedRows 설정</button>
		    <button onclick="btnDeleteSelection()">deleteSelection()</button>
		    <button onclick="btnRemoveRow()">removeRow()</button>
		</div>
		
		<hr>
		
		<div>
			<p>고정</p>
			<button onclick="btnSetColCount()">왼쪽 열 고정</button>
			<button onclick="btnSetLeftFixed()">왼쪽 열고정 위치 설정</button>
			<button onclick="btnSetRightColCount()">오른쪽 열 고정</button>
     		<button onclick="btnSetRightFixed()">오른쪽 열고정 위치 설정</button>
     		<button onclick="btnSetRowCount()">행 고정</button>
     		<button onclick="btnSetRowCount0()">행 고정 취소</button>
     	</div>
     	
		<hr>
		
		<div>
			<p>셀(성별 위주)</p>
			<button onclick="btnEqualBlankTrue()">성별 같은 값 생략</button>
     		<button onclick="btnEqualBlankFalse()">성별 같은 값 생략 해제</button>
     		<button onclick="row3()">3행씩 병합</button>
   		    <button onclick="row5()">5행씩 병합</button>
   		    <button onclick="btnSetValueMerge()">동일 행 병합</button>
			<button onclick="btnMergeRule()">머지룰 적용</button>
     		<button onclick="btnPrevMergeRule()">상위컬럼 참조하여 머지룰 적용</button>
     		<button onclick="">행 병합 그룹핑</button>
		</div>
		
		
		<hr>
		
		<div>
			<p>헤더&푸터</p>
			<button onclick="showFooter()">푸터 보이기</button>
			<button onclick="cancelFooter()">푸터 가리기</button>
		</div>
		
		<hr>
		<div class="toolbar">
      <div class="toolbar-group">
        <span class="toolbar-group-title">엑셀타입 설정</span>
        <label>
          <input type="radio" name="excelType" value=false />MS Excel 2007
        </label>
        <label>
          <input
            type="radio"
            name="excelType"
            value=true
            checked="checked"
          />MS Excel
        </label>
        <label>
          <input type="checkbox" id="chkShowProgress" /> 프로그래스 바 표시 여부
        </label>
      </div>

      <div class="toolbar-group">
        <span class="toolbar-group-title">indicator 영역</span>
        <label>
          <input
            type="radio"
            name="indicator"
            value="default"
            checked="checked"
          />default
        </label>
        <label>
          <input type="radio" name="indicator" value="visible" />visible
        </label>
        <label>
          <input type="radio" name="indicator" value="hidden" />hidden
        </label>
      </div>

      <div class="toolbar-group">
        <span class="toolbar-group-title">header 영역</span>
        <label>
          <input
            type="radio"
            name="header"
            value="default"
            checked="checked"
          />default
        </label>
        <label>
          <input type="radio" name="header" value="visible" />visible
        </label>
        <label>
          <input type="radio" name="header" value="hidden" />hidden
        </label>
      </div>

      <div class="toolbar-group">
        <span class="toolbar-group-title">footer 영역</span>
        <label>
          <input
            type="radio"
            name="footer"
            value="default"
            checked="checked"
          />default
        </label>
        <label>
          <input type="radio" name="footer" value="visible" />visible
        </label>
        <label>
          <input type="radio" name="footer" value="hidden" />hidden
        </label>
      </div>

      <div class="toolbar-group">
        <button onclick="excelExport()">엑셀 Export</button>
      </div>
      
      <hr>
      
      <div>엑셀 Import</div> <a href="${path }/realgrid_import">[리얼그리드 import 테스트]</a>
      <button onclick="gridClear()">그리드 Clear</button> <br/>
    </div>
    
    <hr>
    
    <div class="toolbar">
      <div class="toolbar-group">
        <div class="toolbar-group-title">
          <input
            type="text"
            name="txtSearch"
            id="txtSearch"
            value=""
            data-theme="a"
          />&nbsp;&nbsp;
          <button onclick="gridSearch()">검색하기</button>
        </div>
      </div>
      <div class="toolbar-group">
        <span class="toolbar-group-title">대소문자 구분 설정</span>
        <label>
          <input type="radio" name="case" value="case" />대소문자 구분
        </label>
        <label>
          <input type="radio" name="case" value="" checked="checked" />구분하지
          않음
        </label>
      </div>

      <div class="toolbar-group">
        <span class="toolbar-group-title">부분 일치 설정</span>
        <label>
          <input type="radio" name="partial" value="partial" />부분 일치
        </label>
        <label>
          <input type="radio" name="partial" value="" checked="checked" />모두
          일치
        </label>
      </div>

      <div class="toolbar-group">
        <span class="toolbar-group-title">처음부터 다시 검색</span>
        <label>
          <input
            type="radio"
            name="wrap"
            value="wrap"
            checked="checked"
          />처음부터 다시 검색
        </label>
        <label>
          <input type="radio" name="wrap" value="always" />검색을 종료
        </label>
      </div>
    </div>
    
    <hr>
    	
    	<!-- 페이징 처리 -->
    	<div id="paging" style="float: left; height: 100%; padding-top: 20px;"></div>
      <div id="wrapper" 
          style="
          float: left;
          height: 100%;
          padding-left: 20px;
          padding-top: 20px;
        ">
        <select name="selBox" id="selBox"></select>
        <label for="selBox">Page</label>
      </div>
      
      <button onclick="search()">검색</button>
		
	</div>
	
	<hr>
</body>
<script src="resources/realgrid.2.4.1/realgrid-lic.js"></script>
<script src="resources/realgrid.2.4.1/realgrid.2.4.1.min.js"></script>
<script src="resources/realgrid.2.4.1/libs/jszip.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
<script type="text/javascript">

var info;

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
  
  gridView.setEditOptions({	// 데이터 수정, 추가, 삭제 기본 설정 : false 지정
	insertable: false,
	appendable: false,
  	deletable: false
  });
  
  //행 삭제 - 실제 삭제가 아니라 삭제라고만 뜨게
  dataProvider.setOptions({
	  softDeleting : true
	  //softDeleting : $("#chkSoftDeleting").is(":checked")
  });
  
  //분산 값 표시
  //gridView.setOptions({ summaryMode: "statistical" });
  
  //표준편차 값 표시
  gridView.setOptions({ summaryMode: "aggregate" });
  
  // 토스트 뷰 설정
  btnSetToastView();
  
  //헤더 설정
  var headerHeight = gridView.header.height;
  gridView.header.height = headerHeight + 50;
  
  //행 드래그앤드롭 설정
  gridView.editOptions.movable = true;
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



//컬럼 정렬
function sortData() {
	  gridView.orderBy(
	      ["SURVEY_ANS_MST_SN", "SUFRER_PIN"],
	      ["ascending", "ascending"],
	      ["insensitive", "insensitive"]
	  );
}

// 그룹판넬 보이기
function groupPanel(){
	  gridView.setGroupPanel({visible:true});
}

// 그룹핑
function groupingPanel(){
	gridView.groupBy(['ORG_CD', 'SEXDSTN'], true, 'ascending');	// 오름차순:ascending 내림차순:descending
}

// 자동 필터링 옵션 생성
function setFiltering(){
	gridView.setColumnProperty("ORG_CD", "autoFilter", true);
	gridView.setColumnProperty("OPER_CD", "autoFilter", true);
	gridView.setColumnProperty("ASSIGN_SE", "autoFilter", true);
	gridView.setColumnProperty("SURVEY_SN", "autoFilter", true);
	gridView.setColumnProperty("SURVEY_CD", "autoFilter", true);
	gridView.setColumnProperty("SURVEY_NM", "autoFilter", true);
	gridView.setColumnProperty("HSPTL_ID", "autoFilter", true);
	gridView.setColumnProperty("SUFRER_PIN", "autoFilter", true);
	gridView.setColumnProperty("SUFRER_NM", "autoFilter", true);
	gridView.setColumnProperty("SEXDSTN", "autoFilter", true);
	gridView.setColumnProperty("BRTHDY", "autoFilter", true);
	gridView.setColumnProperty("SUFRER_RELATE", "autoFilter", true);
	gridView.setColumnProperty("SURVEY_DT", "autoFilter", true);
	gridView.setColumnProperty("ANS_NM", "autoFilter", true);
	gridView.setColumnProperty("USE_AT", "autoFilter", true);
	gridView.setColumnProperty("REG_DT", "autoFilter", true);
	gridView.setColumnProperty("REGUSR", "autoFilter", true);
	gridView.setColumnProperty("UPD_DT", "autoFilter", true);
	gridView.setColumnProperty("UPDUSR", "autoFilter", true);
	gridView.setColumnProperty("AGREE_SUFRER_NM", "autoFilter", true);
	gridView.setColumnProperty("AGREE_DEPUTY_NM", "autoFilter", true);
	gridView.setColumnProperty("SURVEY_VER", "autoFilter", true);
	
	//필터박스에 툴팁기능 추가
	gridView.filteringOptions.selector.textToTitle = true;
}

// 특정 필터링 옵션 생성
function setFilteringOption(){
	const filters = [
		  {
		    name: '강북삼성',
		    criteria: "value = '강북삼성'",
		  },
		  {
		    name: '국립중앙',
		    criteria: "value = '국립중앙'",
		  },
		];
		gridView.setColumnFilters('ORG_CD', filters);
	gridView.setFilteringOptions({ enabled: true });
}

// 데이터 조회 전 필터링
function dataFiltering(){
	dataProvider.setFilters({ criteria: "value['ORG_CD']='강북삼성'" });
}

// 셀 선택 - block
function block(){
	gridView.displayOptions.selectionStyle = "block";
}

//셀 선택 - rows
function selectRows(){
	gridView.displayOptions.selectionStyle = "singleRow";
}

//셀 선택 - 복수의 rows
function rows(){
	gridView.displayOptions.selectionStyle = "rows";
}

//셀 선택 - columns
function selectColumns(){
	gridView.displayOptions.selectionStyle = "singleColumn";
}

//셀 선택 - 복수의 columns
function setColumns(){
	gridView.displayOptions.selectionStyle = "columns";
}

//셀 선택 - 선택없음
function selectNone(){
	gridView.displayOptions.selectionStyle = "none";
}


//EditOptions 설정
function setEditOptions(){
	gridView.setEditOptions({
	    insertable: true,
	    appendable: true
	  });
}



/* 기능 버튼 */
//행 삽입(지정행 이전)
function insertRow(){
	var curr = gridView.getCurrent();
	gridView.beginInsertRow(Math.max(0, curr.itemIndex));
	gridView.showEditor();
	gridView.setFocus();
}

//행 삽입(지정행 이후)
function insertRowShift(){
	 var curr = gridView.getCurrent();
	 gridView.beginInsertRow(Math.max(0, curr.itemIndex), true);
	 gridView.showEditor();
	 gridView.setFocus();
}

//행 추가
function appendRow(){
	gridView.beginAppendRow();
	gridView.showEditor();
	gridView.setFocus();
}

function btnSetEditOptions () {
	  gridView.setEditOptions({
	    deletable: true  
	  });
	}

function btnSoftDeleting() {
	dataProvider.setOptions({
	softDeleting: true
	})
}

function btnDeleteCreated() {
	dataProvider.setOptions({
	deleteCreated: true
	})
}

function btnHideDeletedRows() {
	gridView.setOptions({
	hideDeletedRows: true
	})
}

function btnDeleteSelection() {
	gridView.deleteSelection(true);
}

function btnRemoveRow() {
	var curr = gridView.getCurrent();
	dataProvider.removeRow(curr.dataRow);
}

// 왼쪽 열 고정
function btnSetColCount() {
	var cnt = 5;
 	gridView.setFixedOptions({
   		colCount: cnt
  	});
}

//왼쪽 열 고정 위치설정
function btnSetLeftFixed() {
  var leftFixed = gridView.getFixedOptions().leftFixed;
  gridView.setFixedOptions({
    leftFixed:!leftFixed
  });
}

//오른쪽 열 고정
function btnSetRightColCount() {
	  gridView.setFixedOptions({
	    rightCount: 2
	 });
}

//오른쪽 열 고정 위치설정
function btnSetRightFixed() {
  var rightFixed = gridView.getFixedOptions().rightFixed;
  gridView.setFixedOptions({
    rightFixed:!rightFixed
  });
}

//행 고정
function btnSetRowCount() {
  gridView.setFixedOptions({
    rowCount: 2
  });
}

// 행 고정 취소
function btnSetRowCount0() {
	  gridView.setFixedOptions({
	    rowCount: 0
	  });
	}

// 토스트 뷰 설정
function btnSetToastView() {
	  gridView.sortingOptions.toast.visible = true;
	  gridView.sortingOptions.toast.message = "정렬 중입니다..."

	  gridView.filteringOptions.toast.visible = true;
	  gridView.filteringOptions.toast.message = "필터링 중입니다..."

	  gridView.groupingOptions.toast.visible = true;
	  gridView.groupingOptions.toast.message = "그룹핑 입니다..."

	  /*
	  gridView.setOptions({
	    sorting: {
	      toast: {
	        visible: true,
	        message: "정렬 중입니다..."
	      }
	    },
	    filtering: {
	      toast: {
	        visible: true,
	        message: "필터링 중입니다..."
	      }
	    },
	    grouping: {
	      toast: {
	        visible: true,
	        message: "그룹핑 중입니다..."
	      }
	    }
	  });
	  */
}

// 체크바 표시 취소
function btnSetVisibleFalse() {
  gridView.setCheckBar({
    visible: false
  });
}

// 체크바 표시
function btnSetVisibleTrue() {
  gridView.setCheckBar({
    visible: true
  });
}

// 라디오 버튼 표시 취소
function btnSetExclusiveFalse() {
  gridView.setCheckBar({
    exclusive: false
  });
}

// 라디오 버튼 표시
function btnSetExclusiveTrue() {
  gridView.setCheckBar({
    exclusive: true
  });
}

//같은 셀 값 생략
function btnEqualBlankTrue() {
  gridView.setColumnProperty("SEXDSTN", "equalBlank", true);
}

//같은 셀 값 생략 해제
function btnEqualBlankFalse() {
  gridView.setColumnProperty("SEXDSTN", "equalBlank", false);
}

//3행씩 병합
function row3() {
  gridView.setColumnProperty("SEXDSTN", "mergeRule", { criteria: "row div 3" });
}

//5행씩 병합
function row5() {
  gridView.setColumnProperty("SEXDSTN", "mergeRule", { criteria: "row div 5" });
}

//동일 행 병합
function btnSetValueMerge() {
  gridView.setColumnProperty("SEXDSTN", "mergeRule", { criteria: "value" });
}

//머지룰 적용
function btnMergeRule() {
  gridView.columnByName("ORG_CD").mergeRule = {criteria: "value"};
  gridView.columnByName("OPER_CD").mergeRule = {criteria: "value"};
  gridView.columnByName("ASSIGN_SE").mergeRule = {criteria: "value"};
}
	
//선행컬럼 참조하여 머지룰 적용1
function btnPrevMergeRule() {
  gridView.columnByName("ORG_CD").mergeRule = {criteria: "value"};
  gridView.columnByName("OPER_CD").mergeRule = {criteria: "values['ORG_CD'] + value"};
  gridView.columnByName("ASSIGN_SE").mergeRule = {criteria: "values['ORG_CD'] + values['ASSIGN_SE'] + value"};
}

//선행컬럼 참조하여 머지룰 적용2
function btnPrevMergeRule1() {
  gridView.columnByName("ORG_CD").mergeRule = {criteria: "value"};
  gridView.columnByName("OPER_CD").mergeRule = {criteria: "prevvalues + value"};
  gridView.columnByName("ASSIGN_SE").mergeRule = {criteria: "prevvalues + value"};
}

function showFooter(){
	 // 푸터 설정
	  gridView.setFooters({
		 visible: true,
	  	items:[
	  		{
	  			height: 40
	  		},
	  		{
	  			height: 40
	  		},
	  		{
	  			height: 40
	  		},
	  		{
	  			height: 40
	  		},
	  		{
	  			height: 40
	  		}
	  	]
	  });
}

//푸터 없애기
function cancelFooter(){
	 gridView.setFooters({
		 visible: false
	 })
}

//엑셀 export
function excelExport() {
    var excelType = Boolean(document.querySelector('input[name="excelType"]:checked').value);
    var showProgress = document.getElementById("chkShowProgress").checked;
    var indicator = document.querySelector('input[name="indicator"]:checked').value;
    var header = document.querySelector('input[name="header"]:checked').value;
    var footer = document.querySelector('input[name="footer"]:checked').value;
  
    var date = getToday();
    
    gridView.exportGrid({
        type: "excel",
        target: "local",
       /*  documentTitle: { //제목
            message: "리얼그리드 제목1",
            visible: true,
            spaceTop: 1,
            spaceBottom: 0,
            height: 60,
            //styles: { "text-align": "center", "vertical-align": "middle", "background-color": "yellow" }
          },
        documentSubtitle: { //부제
            message: "작성자 : 리얼그리드 테스트 \n 작성일 : "+date,
            visible: true,
            height: 60
          },
          documentTail: { //꼬릿말
            message: "리얼그리드 테스트 꼬릿말",
            visible: true,
            styles: { "text-align" : "right", "vertical-align": "middle" }
          }, */
        fileName: "SURVEY_ANS_MST.xlsx", 
        showProgress: showProgress,
        progressMessage: "엑셀 Export중입니다.",
        indicator: indicator,
        header: header,
        footer: footer,
        compatibility: excelType,
        done: function () {  //내보내기 완료 후 실행되는 함수
            alert("엑셀 Export가 완료되었습니다.")
        },
        pagingAllItems: true
    });
  }
  
//오늘 날짜
function getToday(){
	var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);

    var dateString = year + '-' + month  + '-' + day;
    
    return dateString;
}

//엑셀 import
$("#xlf").bind("change", handleXlsFile);

function fixdata(data) {
  var o = "", l = 0, w = 10240;
  for (; l < data.byteLength / w; ++l) o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w, l * w + w)));
  o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w)));
  return o;
}

function handleXlsFile(e) {
  var files = e.target.files;
  var i, f;
  for (i = 0, f = files[i]; i != files.length; ++i) {
      var reader = new FileReader();
      var name = f.name;
      reader.onload = function (e) {
          var data = e.target.result;

          //var workbook = XLSX.read(data, { type: 'binary' });
          var arr = fixdata(data);
          workbook = XLSX.read(btoa(arr), { type: 'base64' });

          process_wb(workbook);
          /* DO SOMETHING WITH workbook HERE */
      };
      //reader.readAsBinaryString(f);
      reader.readAsArrayBuffer(f);

  }
}

function process_wb(wb) {
  var output = "";

  output = to_json(wb);

  var sheetNames = Object.keys(output);

  if (sheetNames.length > 0) {
      var colsObj = output[sheetNames][0];

      if (colsObj) {
          dataProvider.fillJsonData(output, { rows: sheetNames[0] })
      }
  }
}

function to_json(workbook) {
  var result = {};
  workbook.SheetNames.forEach(function (sheetName) {
      var roa = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName], {});
      if (roa.length > 0) {
          result[sheetName] = roa;
      }
  });
  return result;
}
// 엑셀 import 끝


// 검색
function gridSearch(){
  var value = document.getElementById('txtSearch').value;
  var fields = dataProvider.getOrgFieldNames();
  var startFieldIndex = fields.indexOf(gridView.getCurrent().fieldName) + 1;
  var options = {
    fields : fields,
    value : value,
    startIndex : gridView.getCurrent().itemIndex,
    startFieldIndex : startFieldIndex,
    wrap : true,
    caseSensitive : false,
    partialMatch : true
  };

  var index = gridView.searchCell(options);
  gridView.setCurrent(index);
}

//페이징 처리
function setPaging(){
  var totalData = dataProvider.getRowCount();    // 총 데이터 수
  var dataPerPage = 8;    // 한 페이지에 나타낼 데이터 수
  var pageCount = 3;        // 한 화면에 나타낼 페이지 수

  setPageSelbox(totalData, dataPerPage);
  gridView.setPaging(true, dataPerPage);
  paging(totalData, dataPerPage, pageCount, 1);
}

function paging(totalData, dataPerPage, pageCount, currentPage){
  console.log("currentPage : " + currentPage);
  
  var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
  var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
  
  console.log("pageGroup : " + pageGroup);
  
  var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
  if(last > totalPage)
      last = totalPage;
  var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
  var next = last+1;
  var prev = first-1;
  
  console.log("last : " + last);
  console.log("first : " + first);
  console.log("next : " + next);
  console.log("prev : " + prev);

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

//검색
function search(){
	var searchData = "국립";
	dataProvider.setFilters([
		"value['ORG_CD'] = " + searchData
	]);
	dataProvider.setRows(info);
}

//저장
function saveData(){
	console.log("saveData");
	
	var dataRow;
	var stateArr = ["created", "updated", "deleted"];
	
	for(var i=0; i<stateArr.length; i++) {
		dataRow = dataProvider.getStateRows(stateArr[i]);
		if(dataRow.length > 0) setJsonList(dataRow, stateArr[i]);
		
		console.log("dataRow : ", dataRow);
		console.log("state : ", stateArr[i]);
	}
}

//추가, 수정, 삭제된 그리드 내용을 DB 저장
function setJsonList(dataRow, state){
	
	console.log(state);
	
	var rows = dataRow;
	var jsonList = [];
	
	if(rows.length > 0) {
		for(var i=0; i<rows.length; i++){
			//var ts = gridView.getValue(0, "OrderDate").getTime(); //타임스탬프 형식으로 바꾸기
			
			//var jsonData = dataProvider.getJsonRow(rows[i]);
			var jsonData = dataProvider.getOutputRow({datetimeFormat: "yyyy-MM-dd HH:mm:ss"}, rows[i]);
			jsonList.push(jsonData);	// 제이슨으로 추가, 수정, 삭제된 열 정보를 저장
		}
		
		console.log("json 처리 : ", JSON.stringify(jsonList));
		
		$.ajax({
			url: "${path }/"+state+"Info",
			type: "post",
			data: JSON.stringify(jsonList),
			dataType: "json",
			contentType: "application/json",
			success: function(data){
				if(data > 0){
					getInfo();	// 에이젝스 통신 성공시 데이터 재호출
					fillJsonData();	// 호출한 데이터 리얼그리드로
					console.log("ajax 성공");
				}else{
					console.log("ajax DB연동 실패");
				}
			},
			error: function(request,status,error) {
				alert("error : ", error, request, status);
			}
		}); 
	}
}


//json 데이터 리얼그리드 삽입
function fillJsonData() {
	console.log("fillJsonData()");
	dataProvider.fillJsonData(info, { fillMode: "set" });
	
	// 페이징 처리
	//setPaging();
}


/* 데이터 호출 */
//DB 데이터 json 타입으로 호출
function getInfo() {
	
	console.log("ajax 실행");
	
	$.ajax({
		url: "${path }/getInfo",
		method: "get",
		success: function(data){
			info = data;
			console.log("info:", info);
			console.log("ajax 성공");
			fillJsonData();
		},
		error: function(request,status,error) {
			alert("error : ", error);
		}
	});
}

//DB 데이터 json 타입으로 호출
function getBio() {
	
	console.log("ajax 실행");
	
	$.ajax({
		url: "${path }/selectBio",
		method: "get",
		success: function(data){
			info = data;
			console.log("bio:", info);
			
			console.log("ajax 성공");
		},
		error: function(request,status,error) {
			alert("error : ", error);
		}
	});
}

//DB 데이터 json 타입으로 호출
function getSurvey() {
	
	console.log("ajax 실행");
	
	$.ajax({
		url: "${path }/selectSurvey",
		method: "get",
		success: function(data){
			info = data;
			fillJsonData();	// 불러온 데이터로 리얼그리드 채우기
			console.log("ajax 성공");
		},
		error: function(request,status,error) {
			alert("error : ", error);
		}
	});
}

//필드 설정
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
		fieldName: "REGIST",
		dataType: "text"
	},
	{
		fieldName: "GENDER",
		dataType: "text"
	},
	{
		fieldName: "REGDATE",
		dataType:  "datetime",
		datetimeFormat: "yyyy-MM-dd HH:mm:ss",
	},
	{
		fieldName: "UPDDATE",
		dataType:  "datetime",
		datetimeFormat: "yyyy-MM-dd HH:mm:ss",
	},
];

//컬럼설정
var columns = [
	{
		name: "INFO_IDX",
		fieldName: "INFO_IDX",
		type: "data",
		width: "100",
		header: {
			text: "등록번호"
		},
		numberFormat: "#"
	},
	{
		name: "NAME",
		fieldName: "NAME",
		type: "data",
		width: "100",
		header: {
			text: "성명"
		},
	},
	{
		name: "REGIST",
		fieldName: "REGIST",
		type: "data",
		width: "100",
		header: {
			text: "주민등록번호"
		}
	},
	{
		name: "GENDER",
		fieldName: "GENDER",
		type: "data",
		width: "100",
		header: {
			text: "성별(m/f)"
		},
	},
	{
		name: "REGDATE",
		fieldName: "REGDATE",
		type: "data",
		width: "100",
		header: {
			text: "등록일자"
		},
		editor: {
			type: "date",
	        datetimeFormat: "yyyy-MM-dd",
	        mask: {
	        	"editMask": "9999-99-99",
	        	"includedFormat": true
	        }
	    },
	    datetimeFormat: "yyyy-MM-dd"
		},
		{
			name: "UPDDATE",
			fieldName: "UPDDATE",
			type: "data",
			width: "100",
			header: {
				text: "수정일자"
			},
			editor: {
				type: "date",
		        datetimeFormat: "yyyy-MM-dd",
		        mask: {
		        	"editMask": "9999-99-99",
		        	"includedFormat": true
		        }
		    },
		    datetimeFormat: "yyyy-MM-dd"
			},
];


</script>
</html>
