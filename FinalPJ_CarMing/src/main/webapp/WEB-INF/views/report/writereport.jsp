<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 하기</title>
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



<link rel="stylesheet" href="resources/css/contactus.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 	<script src="resources/js/vendor/jquery-2.2.4.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script src="resources/js/vendor/bootstrap.min.js"></script>
<script src="resources/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/nouislider.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<!--gmaps Js-->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="resources/js/gmaps.min.js"></script>
<script src="resources/js/main.js"></script>

<script type="text/javascript">
	var sel_file;
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		$("#img").empty(); //empty, remove 구분! remove는 태그 자체를 지운다 오키?
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		/* if (files.name == null) {
		   resetInputFile();
		} */
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
				$("#img").attr("width", "90%");
				$("#img").attr("height", "440px");
			}
			reader.readAsDataURL(f);
		})
	}

	function resetInputFile() {
		$("#img").empty();
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
					<h1>신고 사항</h1>
					<nav class="d-flex align-items-center">
						<a href="tipAndRecipeMain.do">신고 사항<span
							class="lnr lnr-arrow-right"></span></a> <a href="category.html">작성하기</a>
					</nav>
				</div>
			</div>
			<div class="section-top-border text-right">
				<div class="button-group-area mt-40" style="padding-bottom: 5em">
					<a href="inquirylist.do"
						class="genric-btn danger-border e-large">목록으로</a> <a
						href="writeinquiryform.do"
						class="genric-btn danger-border e-large">새 글 작성하기</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->


	<!------ Include the above in your HEAD tag ---------->
	
	<form:form  action="writereport.do?targetNo=${target.targetNo}&targetTypeNo=${target.targetTypeNo }" method="POST" enctype="multipart/form-data"  modelAttribute="ReportDto"  >
	<div class="container contact">
		<div class="row">
				<div class="col-md-3">
					<div class="contact-info">
						<img src="resources/img/logo_chatbot.png" alt="image" />
						<h2>신고 하기</h2>
						<h4 style="color: #fdd9bd;">핑구에게 알려주세요~</h4>
					</div>
				</div>
				<div class="col-md-9">
					<div class="contact-form">
						<div class="form-group">
							<label class="control-label col-sm-2" for="writerNickname"> 제보자
								닉네임:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="writerNickname"
									value="${login.memnick}" readonly="readonly" name="reportWriter">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="category"> 카테고리:
							</label> <br> <select class="col-sm-10" id="category" name="categoryNo">
								<option selected>Open this select menu</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select> <br>
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content" style="">신고
								내용:</label>
							<div class="col-sm-10">
								<textarea rows="15" cols="100" class="form-control" name="reportContent"></textarea>

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="input_img">첨부
								이미지:</label>
							<div class="col-sm-10">

								<input type="file" id="input_img" name="reportFile"
									accept="image/*" value="파일"> <img id="img"
									class=" form-control" style="height: 440px";>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="date"> 작성일:</label>
						<div class="col-sm-10">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<input type="date" class="form-control" id="date"
								value=<fmt:formatDate pattern = "yyyy-MM-dd" 
         						value = "${now}" />
								readonly="readonly" >
						</div>
					</div>
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="genric-btn primary e-large px-10"
							style="font-weight: bold; margin-left: 40%; margin-top: 3%">보내기</button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<div style="padding-bottom: 20%"></div>
	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>