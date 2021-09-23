<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>     
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div class="wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
	<section>
		<div class="d-flex justify-content-center">
			<div class="w-75 my-5">
				<h1 class="text-center">SNS 리스트</h1>
					<table class="table text-center">
						<thead>
							<tr>
								<th>No.</th>
								<th>이미지</th>
								<th>내용</th>
							</tr>
						
						</thead>
						<tbody>
							<c:forEach var="sns" items="${snsList }">
							<tr>
								<td>${sns.id }</td>
								<td><a href="/post/detail_view?id=${sns.id }"><img src="${sns.imagePath }"></a></td>
								<td>${sns.content }</td>
							</tr>
							</c:forEach>
						</tbody>
						
					</table>
					<div class="text-right">
					<a href="/post/create_view" class="btn btn-info">업로드 하러가기</a>
					</div>
				</div>
			</div>
	</section>
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

</body>
</html>