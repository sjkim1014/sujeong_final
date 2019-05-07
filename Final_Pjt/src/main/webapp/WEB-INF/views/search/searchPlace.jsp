<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	
	
	/* 관광지타입 SELECT BOX 변경 시 값에 맞는 서비스 대분류 호출 Ajax */
	function typeChange(obj) {
		
		var selectedType = $("#contentType option:selected").val();
		
		$.ajax({
			type: "post"
			, url: "/searchCategory"
			, data: {
				"selectedType":selectedType, 
				}
			, dataType: "text"
			, success: function(data){
				console.log(data)
			}
			, error: function(e) {
				console.log(e);
			}
		});
	};
	
	
	
	/* 지역선택 SELECT BOX 변경 시 값에 맞는 시군구 호출 Ajax */
	function areaChange(obj) {
		
		var areaSelect = $("#areaSelect option:selected").val();
		
		$.ajax({
			type: "post"
			, url: "/searchArea"
			, data: {
				"areaSelect":areaSelect, 
				}
			, dataType: "text"
			, success: function(data){
				console.log(data)
			}
			, error: function(e) {
				console.log(e);
			}
		});
	};
	
	$(document).ready(function() {
		
		$("#btnSearch").click(function() {
			$("form").submit();
		});
	});
	
</script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js">
	
</script>

</head>
<body>
	<div id="filter" style="padding: 40px 300px 0px 300px">
	<h2 style="font-weight: 700; line-height: 2.5;">지역별 관광정보</h2>
		<form name="searchPlace" id="search" method="post" action="/searchPlace">
			<div class="form-group">
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">관광타입</th>
						<td>
							<div class="col-xs-4">
							<select id="contentType" class="form-control" onchange="typeChange(this)">
									<option selected="selected">타입선택</option>
								<c:forEach var="contentType" items="${contentType}" varStatus="i">
									<option value="${contentType.CONTENT_TYPE}">${contentType.CONTENT_TYPE_NAME}</option>
								</c:forEach>
							</select>
							</div>
						</td>
					</tr>

					<tr>
						<th scope="row">서비스분류</th>
						<td >
							<div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
								<select class="form-control" name="birth_year" id="birth_year">
									<option value="" selected="selected">대분류</option>
								</select>
							</div>
							<div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
								<select class="form-control" name="birth_year" id="birth_year">
									<option value="" selected="selected">중분류</option>
								</select>
							</div>
							<div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
								<select class="form-control" name="birth_year" id="birth_year">
									<option value="" selected="selected">소분류</option>
								</select>
							</div>
						</td>				
					</tr>
					
					<tr>
						<th scope="row">지역</th>
						<td>
							<div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
								<select id="areaSelect" class="form-control" onchange="areaChange(this)">
										<option selected="selected">지역선택</option>
									<c:forEach var="areaList" items="${areaList}" varStatus="i">
										<option value="${areaList.AREA1}">${areaList.AREA1_NAME}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
								<select class="form-control" name="birth_year" id="birth_year">
									<option value="" selected="selected">시군구선택</option>
								</select>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			
			<div id="btnArea" style="text-align:center;">
				<button type="button" id="btnSearch" class="btn btn-primary btn-mm">검색하기</button>
				<button type="button" id="btnClear" class="btn btn-warning btn-mm">필터 초기화</button>
			</div>
		</form>
	</div>
	
	
	<div id="content" style="padding: 40px 300px 0px 300px">
		<c:forEach items="${result }" var="result">
			${result }
		</c:forEach>
	</div>
</body>
</html>