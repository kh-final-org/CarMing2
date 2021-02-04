<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing | 신고하기</title>
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


<style type="text/css">
	#banner-text-2{position: absolute; top: 255px; right: 245px;}
	.banner-btn{width: 130px; padding: 8px 0 10px; line-height: 18px; border: 2px solid #fff5e9; border-radius: 3px;
				font-size: 1.1em; text-align: center; color: #fff5e9; background: transparent; opacity: 0.95;  
				position:relative; overflow: hidden; transition: 0.95s; cursor: pointer;}
	.banner-btn:hover{background: #fff5e9; color: #5f5f5f;}
	.banner-btn::before{content: ""; position: absolute; left:0; width:100%; height: 0%; background: #fff5e9; z-index: -1; 
						top:0; border-radius: 0 0 50% 50%; transition: 0.95s;}
	.banner-btn:hover::before{height: 180%;}
	
	.container-contact{margin: 50px 340px; box-shadow: 15px 5px 30px rgba(0, 0, 0, 0.14);}
	
	.col-md-3{background: #ff9b00; padding: 4%; border-top-left-radius: 0.5rem; border-bottom-left-radius: 0.5rem;}
	#pingu-img{width: 100px; height: 100%; margin: -16% 0 8% 25%; z-index: 1;}
	#pingu-siren{width: 80px; height: 100%; margin-left: 30.5%; z-index: 10;}
	.contact-info h3{margin-bottom: 1.8%; margin-top: -2%; margin-left: -1%; color: #fff; text-align: center; font-weight: bold;}
	.contact-info h5{ margin-left: 1.5%; color: #fff; text-align: center; margin-bottom: 8%; font-weight: bold;}
	.contact-info h6{ margin-left: 1.8%; color: #fff; text-align: center; opacity: 0.8;}
	
	.col-md-9{padding: 3% 5% 0; border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem; border: 1px solid #e2e2e2; background: #fff5e9;}
	.contact-form{width: 750px; height: 100%;}
	#report-name{float: left; width: 150px; padding: 0; margin: 5px 0 0 15px; font-size: 1.2em; font-weight: bold;}
	#writerNickname{float: right; width: 450px; margin-right: 10px;}
	.form-group-report-form{float: left; margin-bottom: 15px; width:100%;}
	#report-date{float: left; width: 150px; padding: 0; margin: 5px 0 0 15px; font-size: 1.2em; font-weight: bold;}
	#date{float: right; width: 450px; margin-right: 150px;}	
	.form-group-category-form{float: left; margin-bottom: 15px; width: 100%;}
	.report-category{display: inline-block; float: left; margin: 5px 0 0 15px; width: 10%; font-size: 1.2em; mar}
	.report-category-wrap{float: left; width: 72%; margin-left: 60px;}
	.report-target-category{display: inline-block; float: left; margin: 5px 0 0 15px; width: 10%; font-size: 1.2em;}
	.form-group-target-category-form{float: left; margin-bottom: 20px; width: 100%;}
	#categoryno{ width:100px;}
	.current{font-size: 1.1em;}
	textarea {padding: 10px 14px; border: 1px solid #e2e2e2; border-radius: 5px;}
    textarea::placeholder{color: silver; font-size: 1.1em;}
	#report-text{font-size: 1.2em; margin-bottom: 10px; font-weight: bold;}	
	.report-file{display: inline-block; font-size: 1.2em; margin-bottom: 10px; margin-left: 15px;}
	.uploadimg {width: 350px; height: 350px; border-radius: 10px;}
	.img_wrap {width: 350px; height: 350px; margin-top: 20px; }
	.img_wrap img {max-width: 100%; max-height: 95%;}
	.center-block {display: block; margin-left: auto; margin-right: auto; margin-left: 135px;}	
	.upload-img-form{position: relative; width: 590px; border: 1px solid #e2e2e2; margin-left: 15px; 
					 border-radius: 5px; margin-bottom: 60px; background: #fff;}
   	.upload-img-content{position: absolute; margin-top: 15px; width: 590px;}
   	#button-boardupload{width: 350px; height: 50px; margin: 25px 125px 0 135px; border-radius: 10px; 
   						background-color: #ffe6be; font-size:1.2em; color: #5f5f5f; margin-bottom: 5%;}
</style>


<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 	<script src="resources/js/vendor/jquery-2.2.4.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="resources/js/gmaps.min.js"></script>
 
<!-- ★★★위 스크립트로 상단바 위치가 깨짐★★★
<script src="resources/js/main.js"></script>-->
 

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

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
	   <div class="container">
	      <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end" >
	         <div class="col-first" id="banner-text-1">
	            <h1>The stars in the night sky</h1>
	            <nav class="d-flex align-items-center">
	               <a href="home.do">Home<span class="lnr lnr-arrow-right"></span></a>
	               <a href="writeinquiryform.do">문의하기</a>
	            </nav>
	         </div>
	      </div>
		  <div class="section-top-border text-right" id="banner-text-2">
	       	 <div class="button-group-area mt-40" style="padding-bottom: 5em">
	       	 	<button class="banner-btn" id="gowrite" type="button" onclick="location.href='writereportform.do'">신고하기</button>
	       	 	<button class="banner-btn" id="golist" type="button" onclick="location.href='reportlist.do'">신고 목록</button>
	         </div>
		  </div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!------ Include the above in your HEAD tag ---------->
	<form:form action="writereport.do?targetNo=${target.targetNo}&targetTypeNo=${target.targetTypeNo}&memNo=${login.memno}" 
				method="POST" enctype="multipart/form-data"  modelAttribute="ReportDto"  >
	<div class="container-contact">
		<div class="row">
			<div class="col-md-3">
				<div class="contact-info">
					<img id="pingu-siren" src="./resources/img/siren.png">
					<img id="pingu-img" src="resources/img/logo_chatbot.png" alt="image" /><br>
					<h3>신고하기</h3>
					<h5>핑구에게 알려주세요</h5>
					<h6>여러분의 제보로 더 깨끗한<br>서비스를 만들어가도록<br>노력하겠습니다</h6>
				</div>
			</div>

			<div class="col-md-9">
				<div class="contact-form">
					<!-- 제보자 닉네임 -->
					<div class="form-group-report-form">
						<label class="control-label col-sm-2" id="report-name"for="writerNickname">제보자 닉네임</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="writerNickname"
								   value="${login.memnick}" readonly="readonly" name="reportWriter">
						</div>
					</div>
					
					<!-- 작성일 -->
					<div class="form-group-report-form">
						<label class="control-label col-sm-2" id="report-date" for="date">신고 작성일</label>
						<div class="repot-date-form">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<input type="date" class="form-control" id="date"
								value=<fmt:formatDate pattern = "yyyy-MM-dd" 
         						value = "${now}" /> readonly="readonly" >
						</div>
					</div>
					
					<!-- 신고 대상 -->
					<div class="form-group-category-form">
						<span class="report-category"><strong>신고 대상</strong></span>
						<div class="report-category-wrap">
							<select class="col-sm-10" id="target" name="targetTypeNo">
								<c:choose>
								<c:when test="${target.targetTypeNo == 1}"><option value="1">게시글</option></c:when>
								<c:when test="${target.targetTypeNo == 2}"><option value="2">댓글</option></c:when>
								<c:when  test="${target.targetTypeNo == 3}"><option value="3">회원</option></c:when>
								</c:choose>
							</select>
						</div>
					</div>
					
					<!-- 신고 유형 -->
					<div class="form-group-target-category-form">
						<span class="report-target-category"><strong>신고 유형</strong></span>
						<div class="report-category-wrap">
							<select class="col-sm-10" id="categoryno" name="categoryNo">
								<option value="1" selected>지나친 광고성 게시물</option>
								<option value="2">욕설/비방이 심함</option>
								<option value="3">기타</option>
							</select>
						</div>
					</div>
					
					<!-- 신고내용 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="content" id="report-text">신고 내용</label>
						<div class="col-sm-10">
						   	<textarea rows="3" cols="75" id="content" name="reportContent" placeholder="신고 내용을 입력해주세요." 
						   			  style="resize: none;" required="required"></textarea>
						</div>	
					</div>
					
					<!-- 사진 업로드 -->
					<div class="report-file"><strong>첨부 파일</strong></div>
					<div class="upload-img-form">
						<div class="img_wrap center-block">
							<img id="img" src="">
			  			</div>
						<div class="upload-img-content">
							<input type="file" class="custom-file-input" id="input_img" name="reportFile" accept="image/*">
							<label class="custom-file-label" for="input_img" ></label>
						</div>
					</div>

					<div class="report-submit-form">
						<button type="submit" class="btn btn-light" id="button-boardupload">보내기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form:form>

	<!-- start footer Area -->
	<%@include file="../../views/common/footer.jsp"%>
	<!-- End footer Area -->

</body>
</html>