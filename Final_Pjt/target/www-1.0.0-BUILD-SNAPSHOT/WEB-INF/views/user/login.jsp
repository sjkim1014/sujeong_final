<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="/js/bootstrap.js">
<link rel="stylesheet" href="/js/bootstrap.min.js">
<link rel="stylesheet" href="/js/login.js">
<link rel="stylesheet" href="/css/main.css">

</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-t-90">
				<form action="/login" method="post" class="login100-form validate-form flex-sb flex-w">
				
					<span class="login100-form-title p-b-51">LOGIN</span>
					<br>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate="id를 입력하세요!">
						<input class="input100" type = "text" name = "user_id" id="user_id" size="10" placeholder="아이디 입력" />
					</div>
					<br>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate="pw를 입력하세요!">
						<input class="input100" type="password" id ="user_pw" name="user_pw" placeholder="패스워드입력" />
					</div>	
					<br>
					
					<div class="container-login100-form-btn m-t-17">		
						<button class="login100-form-btn">LOGIN</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>