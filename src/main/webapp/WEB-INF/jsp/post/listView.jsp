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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
	<section>
		<div class="d-flex justify-content-center">
			<div class="col-lg-7">
				<h1 class="text-center">타임라인</h1>
				<!-- 피드 -->
				<c:forEach var="PostDetail" items="${snsList }">
				<div class="card border rounded mt-3">
				<!-- 타이틀 -->
					<div class="d-flex justify-content-between p-2 border-bottom">
						<div>
							<img src="https://mblogthumb-phinf.pstatic.net/20150203_225/hkjwow_1422965971196EfkMV_JPEG/%C4%AB%C5%E5%C7%C1%BB%E7_31.jpg?type=w210" width="30">		
							${PostDetail.post.name }
						</div>
						<div class="more-icon" >
							<a class="text-dark moreBtn" href="#"> 
								<i class="bi bi-three-dots-vertical"></i> 
							</a>
						</div>
					</div>
				<!-- 이미지  -->
					<div>
						<img src="${PostDetail.post.imagePath }" class="w-100 imageClick">
					</div>
				<!-- 좋아요 -->
				
					<div class="m-2">
					<a href="#" class="likeBtn" data-post-id="${PostDetail.post.id }">
							<i class="bi bi-heart heart-icon text-dark"></i>
					</a>
						<span class="middle-size ml-1"> 좋아요 11개 </span>
					</div>
					
					
				<!-- content -->
					<div class="middle-size m-2">
						<b>${PostDetail.post.name }</b> ${PostDetail.post.content }
					</div>
				<!-- 댓글 -->
					<div class="mt-2">
						<div class=" border-bottom m-2">
							<!-- 댓글 타이틀 -->
							<div  class="middle-size">
								댓글
							</div>
					</div>
					<!-- 댓글 -->
					<div class="middle-size m-2">
					
						<!-- postDetail안에 commentList가 들어있음  -->
						<c:forEach var="comment" items="${PostDetail.commentList }">
							<div class="mt-1">
								<b>${comment.userName }</b> ${comment.content }
							</div>
						</c:forEach>
					
					</div>
					
					<div class="d-flex">
						<input type="text" id="commentInput-${PostDetail.post.id }" class="form-control" placeholder="댓글을 작성하세요">
						<button type="button" class="btn btn-success commentBtn" data-post-id="${PostDetail.post.id }">작성</button>
					</div>
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
			
			$.ajax({
				type:"post",
				url:"/post/comment/create",
				data:{"postId":postId, "content":content},
				success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("댓글 작성 실패")
					}
					
				},
				error:function(e) {
					alert("error");
				}
				
								
			});
		});
	
			$(".likeBtn").on("click", function(e) {
				e.preventDefault();
				<%--
				#태그가 다른곳으로 가지 않게끔 처리
				--%>
				
				var postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							alert("like 이용자 저장");
						} else {
							alert("이용자 저장 실패");
						}
						
					},
					error:function(e) {
						alert("error");
					}
				
			})
			
			
			
		});
	});
	
	</script>
</html>