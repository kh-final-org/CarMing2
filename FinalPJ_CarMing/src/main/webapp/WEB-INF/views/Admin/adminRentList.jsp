<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>렌트 목록</title>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="resources/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">


<link rel="stylesheet" href="resources/css/adminList.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue, tbody;
    input = document.getElementById("input");
    filter = input.value

    tbody = document.getElementsByTagName("tbody");
    
    for(i=0; i<tbody.length; i++){
        a = document.getElementsByClassName("cartNo")[i];
        txtValue = a.textContent || a.innerText;
        
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
        	tbody[i].style.display = "";
        } else {
        	tbody[i].style.display = "none";
        }
	}
}
</script>
</head>
<body>
	<!-- Start Header Area -->
	<%@include file="../../views/common/header.jsp"%>
	<!-- End Header Area -->
	<br>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<br>
					<h1>렌트</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">렌트<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">목록</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="tipAndRecipeMain.do"
						class="genric-btn danger-border e-large">목록으로</a> <a
						href="writeinquiryform.do"
						class="genric-btn danger-border e-large">새 글 작성하기</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<div class="blog_right_sidebar"
		style="width: 30%; float: right; background-color: white; border: 0px;">
		<aside class="single_sidebar_widget search_widget">
			<div class="input-group">
				<input type="text" id="input" onkeyup="myFunction()"
					class="form-control" placeholder="상품 검색하기"
					onfocus="this.placeholder = ''"
					onblur="this.placeholder = '상품 검색하기'"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="button">
						<i class="lnr lnr-magnifier"></i>
					</button>
				</span>
			</div>
		</aside>
	</div>

	<div class="container-xl">
		<div class="table-responsive">
			<table class="table table-striped table-hover"
				style="text-align: center;" width="100%">
				<col style="width: 10%">
				<col style="width: 15%">
				<col style="width: 20%">
				<col style="width: 5%">
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 20%">
				<thead>
					<tr>
						<th>NO.</th>
						<th>닉네임</th>
						<th>카테고리</th>
						<th>결제번호</th>
						<th>렌트 시작날짜</th>
						<th>렌트 종료날짜</th>
						<th>렌탈현황</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${list}">
					<tbody>
						<tr>
							<td class="cartNo" ><a href="adminRentDetail.do?cartNo=${list.cartNo}">${list.cartNo}</a></td>
							<td><a href="#"><img
									src="resources/img/tipandrecipe/honey.jpg" class="avatar"
									alt="Avatar">${list.memNick }</a></td>
							<td>${list.pCategoryName }</td>
							<td>#${list.payNo }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${list.startDate}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${list.endDate}" /></td>
							<td><c:set var="status" value="${list.stateNo}" /> <c:choose>
									<c:when test="${ status == 3}">
										<span class="status text-warning">&bull;</span>
									</c:when>
									<c:when test="${ status == 5}">
										<span class="status text-success">&bull;</span>
									</c:when>
									<c:when test="${ status == 6}">
										<span class="status text-danger">&bull;</span>
									</c:when>
								</c:choose> ${list.stateName }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<div class="clearfix">
				<div class="hint-text" style="margin-left: 2%;">
					Showing <b>5</b> out of <b>25</b> entries
				</div>
				<ul class="pagination">
					<li class="page-item"><a href="#" class="page-link"
						aria-label="Previous"> <span aria-hidden="true"> <span
								class="lnr lnr-chevron-left"></span>
						</span>
					</a></li>
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item active"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link"
						aria-label="Next"> <span aria-hidden="true"> <span
								class="lnr lnr-chevron-right"></span>
						</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->
</body>
</html>