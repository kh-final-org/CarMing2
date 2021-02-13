/*******************************************************************************************************************************************************************/	
/* location-popup
/*******************************************************************************************************************************************************************/	
	function myFunction() {
		var x = document.getElementById("location-popup");
		
		if (x.style.display == "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		} 
	}  

	
	
/*******************************************************************************************************************************************************************/	
/* 사진 업로드(미리보기) 
/*******************************************************************************************************************************************************************/	
	var sel_file;
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		$("#img").empty(); //remove는 태그 자체를 지운다 
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
	
	
	
/*******************************************************************************************************************************************************************/	
/* 업로드한 파일명 추출
/*******************************************************************************************************************************************************************/	
	$(document).ready(function(){
		var img = $('#input_img');
		var vid = $('#video-file');
	
			img.change(function(){
			$('#emptyimg').hide();
			console.log(img.val())
			
			var filename = img.val().split('\\').pop();
		    $('#filename').text(filename); 
		    	
			});
		
			vid.change(function(){
			$('#emptyvideo').hide();
			console.log(vid.val())
			
			var videofilename = vid.val().split('\\').pop();
		    $('#videofilename').text(videofilename); 
			    	
			});
	});	

	 
	 
/*******************************************************************************************************************************************************************/	
/* 나만보기 체크여부
/*******************************************************************************************************************************************************************/	
	function YnCheck(obj) {
		$("#my").empty();
	    var checked = obj.checked;
	
	    if(checked){
	    	var value = obj.value = "Y";
    	    var Y = document.createElement("input");
		    Y.setAttribute("name", "brdprivate");
		    Y.setAttribute("type", "text");
		    Y.setAttribute("value", value);
		    
		    document.getElementById("my").appendChild(Y);	
	
	    }else{
	    	var value = obj.value = "N";
	       	var N = document.createElement("input");
	       	N.setAttribute("name", "brdprivate");
		    N.setAttribute("type", "text");
		    N.setAttribute("value", value);
		    
		    document.getElementById("my").appendChild(N);	
	    }
	    
	 };

	 
	 
/*******************************************************************************************************************************************************************/	
/* 차박명소 등록 체크여부 
/*******************************************************************************************************************************************************************/	
	function YnCheck2(obj) {
		$("#car").empty();
	    var checked = obj.checked;
	
	    if(checked){
	    	var value = obj.value = "Y";
	        var Y = document.createElement("input");
		    Y.setAttribute("name", "carmapchk");
		    Y.setAttribute("type", "text");
		    Y.setAttribute("value", value);
		    
		    document.getElementById("car").appendChild(Y);	
		    
	    }else{
	    	var value = obj.value = "N";
	    	var N = document.createElement("input");
	       	N.setAttribute("name", "carmapchk");
		    N.setAttribute("type", "text");
		    N.setAttribute("value", value);
		    
		    document.getElementById("car").appendChild(N);	
	       	
	    }
	 };

	 
	 
/*******************************************************************************************************************************************************************/	
/* 카테고리 차박이 아닐 경우 '차박 체크박스' 숨기기 
/*******************************************************************************************************************************************************************/	
	function carPlaceChk() {
	    var selectbox, filter, a, txtValue, list;
	    selectbox = document.getElementById("selectbox");
	    filter = selectbox.value
	
	    list = document.getElementsByClassName("chkcarplace-box");
	    
	    for(i=0; i<list.length; i++){
	        a = document.getElementsByClassName("chkcarplace-box")[i];
	        txtValue = a.textContent || a.innerText;
	        
	        
	        if (txtValue.indexOf(filter) > -1) {
	        	list[i].style.display = "";
	        	
	        } else {
	        	list[i].style.display = "none";
	        }
		}
	}
