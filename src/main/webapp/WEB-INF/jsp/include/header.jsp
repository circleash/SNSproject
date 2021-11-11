<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<header class="mb-3 d-flex justify-content-between align-items-center">
			<h2 class="ml-3 pt-3">CircleClub</h2>
			<c:if test="${not empty userName }">
			<div class="mr-3">
				${userName } <a href="/user/sign_out"> [로그아웃] </a>
			</div>
			<div class="text-right">
			<a href="/post/create_view" class="btn btn-info">업로드 하러가기</a>
			</div>
			</c:if>
		</header>