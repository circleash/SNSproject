<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<header class="mb-3 d-flex justify-content-between align-items-center">
			<h2 class="ml-3 pt-3">CircleClub</h2>
			<c:if test="${not empty userName }">
			<div class="mr-3">
				${userName } [로그아웃]
			</div>
			</c:if>
		</header>