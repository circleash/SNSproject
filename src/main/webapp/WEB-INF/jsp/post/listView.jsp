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
	<div id="wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
	<section>
		<div class="d-flex justify-content-center">
			<div class="w-50 my-5">
				<h1 class="text-center">타임라인</h1>
				<c:forEach var="sns" items="${snsList }">
				<div class="jumbotron jumbotron-fluid justify-content-center align-item-center">
					<div>		
						${sns.name }
					</div>
					<div>
						<a href="/post/detail_view?id=${sns.id }"><img src="${sns.imagePath }" class="w-100"></a>
					</div>
					<div>
						${sns.content }
					</div>
					<div class="mt-1 mb-4">
						<button type="button" class="btn btn-success" id="likeBtn">좋아요</button>
					</div>
					<div>
					댓글
					
					</div>
					<div class="d-flex">
						<input type="text" id="commentInput-${sns.id }" class="form-control" placeholder="댓글을 작성하세요">
						<button type="button" class="btn btn-success commentBtn" data-post-id="${sns.id }">작성</button>
					</div>
				</div>	
				</c:forEach>
			</div>		
		</div>
		<div class="text-right">
						<a href="/post/create_view" class="btn btn-info">업로드 하러가기</a>
		</div>
	</section>
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

</body>
	<script>
	$(document).ready(function() {
		$(".commentBtn").on("click", function() {
			var postId = $(this).data("post-id");
			// postId, content
			
			//대응되는 input의 value
			//ex) postId = 5;
			//"#commentInput-5"
			//매칭이 되는 방법
			var content = $("#commentInput-" + postId).val();
		})
	});
	
	</script>
</html>