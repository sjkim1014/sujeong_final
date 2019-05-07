<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"> </script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"> </script> 


</head>
<body>
${ result}
	<div id="content" style="padding:100px 300px 0px 300px">
		<form name="searchPlace" id="search" method="post" action="/searchPlace">
			<div class="form-group">
			<label>분류를 선택해주세요</label>
				<div class="col-xs-2" class="row">
					<select class="form-control">
						<option>공연</option>
						<option>전시</option>
						<option>어쩌고</option>
						<option>저쩌고</option>
						<option>ㅋㅋ</option>
					</select>
				</div>
			</div>
		</form>
	</div>



</body>
</html>