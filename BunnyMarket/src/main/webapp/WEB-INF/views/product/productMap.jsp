<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<style>
	#mapwrap{position:relative;overflow:hidden;}
	.category, .category *{margin:0;padding:0;color:#000;}   
	.category {position:absolute;overflow:hidden;top:10px;left:10px;width:355px;height:30px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
	.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
	.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
	/* .category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;}  */ 
	.category .ico_elec {background-position:-10px 0;}  
	.category .ico_furniture {background-position:-10px -36px;}   
	.category .ico_accessory {background-position:-10px -144px;}
	.category .ico_clothing {background-position:-10px -288px;} 
	.category .ico_toy {background-position:-10px -1152px;} 
	.category .ico_book {background-position:-10px -2304px;} 
	.category .ico_etc {background-position:-10px -4608px;}  
	
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	
	
</style>

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>상품 지도로 보기</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }"><i
								class="fa fa-home"></i> 홈화면</a></li>
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }/views/product/productList.jsp">상품</a></li>
						<li class="breadcrumb-item active" aria-current="page">상품 지도로 보기</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->

<!-- ##### Single Product Details Area Start ##### -->
<section class="single_product_details_area mb-50">
	<div class="produts-details--content mb-50">
		<div class="container">
		<div class="col-12">
			<br /> <br />
			
			<div id="mapwrap"> 
			    <!-- 지도가 표시될 div -->
			    <div id="map" style="width:100%;height:700px;"></div>
			    	<!-- 지도 위에 표시될 마커 카테고리 -->
				    <div class="category">
				        <ul>
				            <li id="elecMenu" onclick="changeMarker('elec')">
				                <span class="ico_comm ico_elec"></span>
				                전자기기
				            </li>
				            <li id="furnitureMenu" onclick="changeMarker('furniture')">
				                <span class="ico_comm ico_furniture"></span>
				                가구
				            </li>
				            <li id="accessoryMenu" onclick="changeMarker('accessory')">
				                <span class="ico_comm ico_accessory"></span>
				                악세서리
				            </li>
				            <li id="clothingMenu" onclick="changeMarker('clothing')">
				                <span class="ico_comm ico_clothing"></span>
				                의류
				            </li>
				            <li id="toyMenu" onclick="changeMarker('toy')">
				                <span class="ico_comm ico_toy"></span>
				                장난감
				            </li>
				            <li id="bookMenu" onclick="changeMarker('book')">
				                <span class="ico_comm ico_book"></span>
				                책
				            </li>
				            <li id="etcMenu" onclick="changeMarker('etc')">
				                <span class="ico_comm ico_etc"></span>
				                기타
				            </li> 
				            
				        </ul>
				    </div>
			</div>
			<br /><br /><br /><br /><br /><br />
		</div>
		</div>
	</div>


</section>
<!-- ##### Single Product Details Area End ##### -->

	<script>
	

		console.log('hello');
		var mapJson = JSON.parse('${ mapJson }'); // json 잘 가져오는거 확인 완료 
		console.log(mapJson); 
		
		// 마커 클러스터러를 생성합니다 
	    /* var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    }); */
		
		
		var elecPositions = [];
		var furniturePositions = [];
		var accessoryPositions = [];
		var clothingPositions = [];
		var toyPositions = [];
		var bookPositions = [];
		var etcPositions = [];
		

		
		// 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		var markerImageSrc = 'https://www.pngrepo.com/png/264372/79/easter-bunny-rabbit.png';  
		    elecMarkers = [], //  마커 객체를 가지고 있을 배열입니다
		    furnitureMarkers = [], 
		    accessoryMarkers = [], 
		    clothingMarkers = [],
		    toyMarkers = [],
		    bookMarkers = [],
		    etcMarkers = []; 
		    
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var idx = 0;
		mapJson.forEach(function(item){
			console.log(item.paddress);
			geocoder.addressSearch(item.paddress, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			    if (status === kakao.maps.services.Status.OK) {
			    	
					var product = {
							'latlng' : new kakao.maps.LatLng(result[0].y, result[0].x),
							'pno' : item.pno,
							'title' : item.ptitle,
							'img' : item.pimg,
							'text' : item.pcontent
					};
					
					/* 일반상품과 경매상품 구분 */
					if(item.ptype == 1){
						product.ptype = 'product';
					} else {
						product.ptype = 'auction';
					}
					
			    	
		    		console.log('-----------------');
		    		console.log("latlng : " + product.latlng);
		    		console.log("pno : " + product.pno);
		    		console.log("title : " + product.title);
		    		console.log("ptype : " + product.ptype);
		    		console.log('-----------------');
			    	
		    		
					if(item.pcno == 1){
						console.log('1들어옴');
				    	elecPositions.push(product);
					
					} else if (item.pcno == 2){
						console.log('2들어옴');
						furniturePositions.push(product);
					
					} else if (item.pcno == 3){
						console.log('3들어옴');
						accessoryPositions.push(product);
					
					}  else if (item.pcno == 4){
						console.log('4들어옴');
						clothingPositions.push(product);
					
					} else if (item.pcno == 5){
						console.log('5들어옴');
						toyPositions.push(product);
					
					} else if (item.pcno == 6){
						console.log('6들어옴');
						bookPositions.push(product);
					
					} else if (item.pcno == 7){
						console.log('7들어옴');
						etcPositions.push(product);
					
					}
					
					

					
					
					if(idx == mapJson.length - 1){
						// 배열에 모두 넣으면 실행! 
						console.log("elec확인 : " + elecPositions);
						console.log("furniture확인 : " + furniturePositions);
						console.log("accessory확인 : " + accessoryPositions);
						console.log("clothing확인 : " + clothingPositions);
						console.log("toy확인 : " + toyPositions);
						console.log("book확인 : " + bookPositions);
						console.log("etc확인 : " + etcPositions.to);
						
						createElecMarkers(); // 마커를 생성하고 마커 배열에 추가합니다
						createFurnitureMarkers(); 
						createAccessoryMarkers(); 
						createClothingMarkers();
						createToyMarkers();
						createBookMarkers();
						createEtcMarkers(); 
						
						changeMarker('elec'); // 지도에 elec 마커가 보이도록 설정합니다    
						
						
					}
					
					idx++;
			    }
			    
			}); 
		});
		
		
		
		 
		
		mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
	        level: 9 // 지도의 확대 레벨 
	    }; 
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
		
		
		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
		    var markerImage = new kakao.maps.MarkerImage(src, size, options);
		    return markerImage;            
		}
		
		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
			var maker;
	        marker = new kakao.maps.Marker({
	        position: position,
	        image: image,
	        clickable : true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정 
		        
		        
		 });
		        
		    return marker;  
		}
		
		
		// 카테고리1(전자기기_elec) ------------------------------------------------------------------------------------------------
		var overlayArray_elec = [];
		// 마커를 생성하고 마커 배열에 추가하는 함수입니다
		function createElecMarkers() {
		    
		    for (var i = 0; i < elecPositions.length; i++) {  
		        
		    	var imageSize = new kakao.maps.Size(40, 40),
	            imageOptions = {offset: new kakao.maps.Point(20, 40)};       
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(elecPositions[i]['latlng'], markerImage);  
		        
		        
		        
		        // 생성된 마커를 마커 배열에 추가합니다
		        elecMarkers.push(marker);
		        
		     	// 클러스터러에 마커들을 추가합니다
		        /* clusterer.addMarkers(markers); */
		      
		         var iwContent ='<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            			 elecPositions[i]['title'] + 
					        	'            <div class="close" onclick="closeOverlay_elec(' + i + ')" title="닫기"></div>' + 
					        	'        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="${ pageContext.request.contextPath }/resources/upload/product/' + elecPositions[i]['img'] +
						        '"width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div>' + elecPositions[i]['text'].substr(0, 25) + '...<br/>' +  
						        '					<a href="/bunny/' + elecPositions[i]['ptype'] + '/' + elecPositions[i]['ptype'] + 'Detail.do?pno=' + elecPositions[i]['pno'] +
						        '					  "target="_blank" class="link">상품 보러 가기</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
			        
						        
		      // 마커 위에 커스텀오버레이를 표시합니다
		      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		      overlayArray_elec[i] = new kakao.maps.CustomOverlay({
		    	  clickable : true, // true이면 컨텐츠 영역을 클릭했을 경우 지도 이벤트를 막아준다. 
		          content: iwContent,
		          position: marker.getPosition(),
		          xAnchor: 0.5,
		          yAnchor: 1,
		          zIndex: 3
		      });
		         
				  var overlay = overlayArray_elec[i];  
		       (function(marker, overlay) {
		        	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        	kakao.maps.event.addListener(marker, 'click', function() {
		        		overlay.setMap(map);
		        	});
		        	
		        })(marker, overlay); 
		        
		        
		    }     
		}
		
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay_elec(idx) {
			
		    console.log(idx);
		    overlayArray_elec[idx].setMap(null);  
	    } 
		
		
		// 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setElecMarkers(map) {        
		    for (var i = 0; i < elecMarkers.length; i++) {  
		        elecMarkers[i].setMap(map);
		    }        
		}
		
		
		// 카테고리2(가구_furniture)  ------------------------------------------------------------------------------------------------
		var overlayArray_furniture = [];

		function createFurnitureMarkers() {
		    
		    for (var i = 0; i < furniturePositions.length; i++) {  
		        
		    	var imageSize = new kakao.maps.Size(40, 40),
	            imageOptions = {offset: new kakao.maps.Point(20, 40)};       
		        
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(furniturePositions[i]['latlng'], markerImage);  
		        
		        
		        
		        furnitureMarkers.push(marker);
		        
		      
		         var iwContent ='<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            			 furniturePositions[i]['title'] + 
					        	'            <div class="close" onclick="closeOverlay_furniture(' + i + ')" title="닫기"></div>' + 
					        	'        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="${ pageContext.request.contextPath }/resources/upload/product/' + furniturePositions[i]['img'] +
						        '"width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div>' + furniturePositions[i]['text'].substr(0, 25) + '...<br/>' +  
						        '					<a href="/bunny/' + furniturePositions[i]['ptype'] + '/' + furniturePositions[i]['ptype'] + 'Detail.do?pno=' +  furniturePositions[i]['pno'] +
						        '					  "target="_blank" class="link">상품 보러 가기</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
			        
						        
		      // 마커 위에 커스텀오버레이를 표시합니다
		      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		      overlayArray_furniture[i] = new kakao.maps.CustomOverlay({
		    	  clickable : true, // true이면 컨텐츠 영역을 클릭했을 경우 지도 이벤트를 막아준다. 
		          content: iwContent,
		          position: marker.getPosition(),
		          xAnchor: 0.5,
		          yAnchor: 1,
		          zIndex: 3
		      });
		         
				  var overlay = overlayArray_furniture[i];  
		       (function(marker, overlay) {
		        	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        	kakao.maps.event.addListener(marker, 'click', function() {
		        		overlay.setMap(map);
		        	});
		        	
		        })(marker, overlay); 
		        
		        
		    }     
		}
		
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay_furniture(idx) {
			
		    console.log(idx);
		    overlayArray_furniture[idx].setMap(null);  
	    } 
		
		
		// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setFurnitureMarkers(map) {        
		    for (var i = 0; i < furnitureMarkers.length; i++) {  
		        furnitureMarkers[i].setMap(map);
		    }        
		}
		
		// 카테고리3(accessory) ------------------------------------------------------------------------------------------------
		var overlayArray_accessory = [];

		function createAccessoryMarkers() {
		    
		    for (var i = 0; i < accessoryPositions.length; i++) {  
		        
		    	var imageSize = new kakao.maps.Size(40, 40),
	            imageOptions = {offset: new kakao.maps.Point(20, 40)};       
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(accessoryPositions[i]['latlng'], markerImage);  
		        
		        
		        console.log('이미지? : ' +  accessoryPositions[i]['img']);
		        accessoryMarkers.push(marker);
		        
		      
		         var iwContent ='<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            			 accessoryPositions[i]['title'] + 
					        	'            <div class="close" onclick="closeOverlay_accessory(' + i + ')" title="닫기"></div>' + 
					        	'        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="${ pageContext.request.contextPath }/resources/upload/product/' + accessoryPositions[i]['img'] +
						        '"width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div>' + accessoryPositions[i]['text'].substr(0, 25) + '...<br/>' +  
						        '					<a href="/bunny/' + accessoryPositions[i]['ptype'] + '/' + accessoryPositions[i]['ptype'] + 'Detail.do?pno=' + accessoryPositions[i]['pno'] +
						        '					  "target="_blank" class="link">상품 보러 가기</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
			        
						        
		      // 마커 위에 커스텀오버레이를 표시합니다
		      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		      overlayArray_accessory[i] = new kakao.maps.CustomOverlay({
		    	  clickable : true, // true이면 컨텐츠 영역을 클릭했을 경우 지도 이벤트를 막아준다. 
		          content: iwContent,
		          position: marker.getPosition(),
		          xAnchor: 0.5,
		          yAnchor: 1,
		          zIndex: 3
		      });
		         
				  var overlay = overlayArray_accessory[i];  
		       (function(marker, overlay) {
		        	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        	kakao.maps.event.addListener(marker, 'click', function() {
		        		overlay.setMap(map);
		        	});
		        	
		        })(marker, overlay); 
		        
		        
		    }     
		}
		
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay_accessory(idx) {
			
		    console.log(idx);
		    overlayArray_accessory[idx].setMap(null);  
	    } 
		
		
		function setAccessoryMarkers(map) {        
		    for (var i = 0; i < accessoryMarkers.length; i++) {  
		        accessoryMarkers[i].setMap(map);
		    }        
		}
		
		// 카테고리4(의류_clothing) ------------------------------------------------------------------------------------------------
		
		var overlayArray_clothing = [];
		function createClothingMarkers() {
		    
		    for (var i = 0; i < clothingPositions.length; i++) {  
		        
		    	var imageSize = new kakao.maps.Size(40, 40),
	            imageOptions = {offset: new kakao.maps.Point(20, 40)};       
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(clothingPositions[i]['latlng'], markerImage);  
		        
		        
		        
		        // 생성된 마커를 마커 배열에 추가합니다
		        clothingMarkers.push(marker);
		        
		      
		         var iwContent ='<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            			 clothingPositions[i]['title'] + 
					        	'            <div class="close" onclick="closeOverlay_clothing(' + i + ')" title="닫기"></div>' + 
					        	'        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="${ pageContext.request.contextPath }/resources/upload/product/' + clothingPositions[i]['img'] +
						        '"width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div>' + clothingPositions[i]['text'].substr(0, 25) + '...<br/>' +  
						        '					<a href="/bunny/' + clothingPositions[i]['ptype'] + '/' + clothingPositions[i]['ptype'] + 'Detail.do?pno=' +  clothingPositions[i]['pno'] +
						        '					  "target="_blank" class="link">상품 보러 가기</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
			        
						        
		      // 마커 위에 커스텀오버레이를 표시합니다
		      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		      overlayArray_clothing[i] = new kakao.maps.CustomOverlay({
		    	  clickable : true, // true이면 컨텐츠 영역을 클릭했을 경우 지도 이벤트를 막아준다. 
		          content: iwContent,
		          position: marker.getPosition(),
		          xAnchor: 0.5,
		          yAnchor: 1,
		          zIndex: 3
		      });
		         
				  var overlay = overlayArray_clothing[i];  
		       (function(marker, overlay) {
		        	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        	kakao.maps.event.addListener(marker, 'click', function() {
		        		overlay.setMap(map);
		        	});
		        	
		        })(marker, overlay); 
		        
		        
		    }     
		}
		
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay_clothing(idx) {
			
		    console.log(idx);
		    overlayArray_clothing[idx].setMap(null);  
	    } 
		
		
		function setClothingMarkers(map) {        
		    for (var i = 0; i < clothingMarkers.length; i++) {  
		        clothingMarkers[i].setMap(map);
		    }        
		}


		// 카테고리5(장난감_toy) ------------------------------------------------------------------------------------------------
		
		var overlayArray_toy = [];
		function createToyMarkers() {
		    
		    for (var i = 0; i < toyPositions.length; i++) {  
		        
		    	var imageSize = new kakao.maps.Size(40, 40),
	            imageOptions = {offset: new kakao.maps.Point(20, 40)};       
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(toyPositions[i]['latlng'], markerImage);  
		        
		        
		        toyMarkers.push(marker);
		        
		      
		         var iwContent ='<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            			 toyPositions[i]['title'] + 
					        	'            <div class="close" onclick="closeOverlay_toy(' + i + ')" title="닫기"></div>' + 
					        	'        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="${ pageContext.request.contextPath }/resources/upload/product/' + toyPositions[i]['img'] +
						        '"width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div>' + toyPositions[i]['text'].substr(0, 25) + '...<br/>' +  
						        '					<a href="/bunny/' + toyPositions[i]['ptype'] + '/' + toyPositions[i]['ptype'] + 'Detail.do?pno=' + toyPositions[i]['pno'] +
						        '					  "target="_blank" class="link">상품 보러 가기</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
			        
						        
		      // 마커 위에 커스텀오버레이를 표시합니다
		      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		      overlayArray_toy[i] = new kakao.maps.CustomOverlay({
		    	  clickable : true, // true이면 컨텐츠 영역을 클릭했을 경우 지도 이벤트를 막아준다. 
		          content: iwContent,
		          position: marker.getPosition(),
		          xAnchor: 0.5,
		          yAnchor: 1,
		          zIndex: 3
		      });
		         
				  var overlay = overlayArray_toy[i];  
		       (function(marker, overlay) {
		        	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        	kakao.maps.event.addListener(marker, 'click', function() {
		        		overlay.setMap(map);
		        	});
		        	
		        })(marker, overlay); 
		        
		        
		    }     
		}
		
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay_toy(idx) {
			
		    console.log(idx);
		    overlayArray_toy[idx].setMap(null);  
	    } 
		
		
		function setToyMarkers(map) {        
		    for (var i = 0; i < toyMarkers.length; i++) {  
		        toyMarkers[i].setMap(map);
		    }        
		}


		// 카테고리6(책_book) ------------------------------------------------------------------------------------------------
		
		var overlayArray_book = [];
		function createBookMarkers() {
		    
		    for (var i = 0; i < bookPositions.length; i++) {  
		        
		    	var imageSize = new kakao.maps.Size(40, 40),
	            imageOptions = {offset: new kakao.maps.Point(20, 40)};       
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(bookPositions[i]['latlng'], markerImage);  
		        
		        
		        
		        bookMarkers.push(marker);
		        
		      
		         var iwContent ='<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            			 bookPositions[i]['title'] + 
					        	'            <div class="close" onclick="closeOverlay_book(' + i + ')" title="닫기"></div>' + 
					        	'        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="${ pageContext.request.contextPath }/resources/upload/product/' + bookPositions[i]['img'] +
						        '"width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div>' + bookPositions[i]['text'].substr(0, 25) + '...<br/>' +  
						        '					<a href="/bunny/' + bookPositions[i]['ptype'] + '/' + bookPositions[i]['ptype'] + 'Detail.do?pno=' + bookPositions[i]['pno'] +
						        '					  "target="_blank" class="link">상품 보러 가기</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
			        
						        
		      // 마커 위에 커스텀오버레이를 표시합니다
		      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		      overlayArray_book[i] = new kakao.maps.CustomOverlay({
		    	  clickable : true, // true이면 컨텐츠 영역을 클릭했을 경우 지도 이벤트를 막아준다. 
		          content: iwContent,
		          position: marker.getPosition(),
		          xAnchor: 0.5,
		          yAnchor: 1,
		          zIndex: 3
		      });
		         
				  var overlay = overlayArray_book[i];  
		       (function(marker, overlay) {
		        	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        	kakao.maps.event.addListener(marker, 'click', function() {
		        		overlay.setMap(map);
		        	});
		        	
		        })(marker, overlay); 
		        
		        
		    }     
		}
		
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay_book(idx) {
			
		    console.log(idx);
		    overlayArray_book[idx].setMap(null);  
	    } 
		
		
		function setBookMarkers(map) {        
		    for (var i = 0; i < bookMarkers.length; i++) {  
		        bookMarkers[i].setMap(map);
		    }        
		}


		// 카테고리7(기타_etc) ------------------------------------------------------------------------------------------------
		
		var overlayArray_etc = [];

		function createEtcMarkers() {
		    
		    for (var i = 0; i < etcPositions.length; i++) {  
		        
		    	var imageSize = new kakao.maps.Size(40, 40),
	            imageOptions = {offset: new kakao.maps.Point(20, 40)};       
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(etcPositions[i]['latlng'], markerImage);  
		        
		        etcMarkers.push(marker);
		        
		      
		         var iwContent ='<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            			 etcPositions[i]['title'] + 
					        	'            <div class="close" onclick="closeOverlay_etc(' + i + ')" title="닫기"></div>' + 
					        	'        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="${ pageContext.request.contextPath }/resources/upload/product/' + etcPositions[i]['img'] +
						        '"width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div>' + etcPositions[i]['text'].substr(0, 25) + '...<br/>' +  
						        '					<a href="/bunny/' + etcPositions[i]['ptype'] + '/' + etcPositions[i]['ptype'] + 'Detail.do?pno=' + etcPositions[i]['pno'] +
						        '					  "target="_blank" class="link">상품 보러 가기</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
			        
						        
		      // 마커 위에 커스텀오버레이를 표시합니다
		      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		      overlayArray_etc[i] = new kakao.maps.CustomOverlay({
		    	  clickable : true, // true이면 컨텐츠 영역을 클릭했을 경우 지도 이벤트를 막아준다. 
		          content: iwContent,
		          position: marker.getPosition(),
		          xAnchor: 0.5,
		          yAnchor: 1,
		          zIndex: 3
		      });
		         
				  var overlay = overlayArray_etc[i];  
		       (function(marker, overlay) {
		        	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        	kakao.maps.event.addListener(marker, 'click', function() {
		        		overlay.setMap(map);
		        	});
		        	
		        })(marker, overlay); 
		        
		        
		    }     
		}
		
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay_etc(idx) {
			
		    console.log(idx);
		    overlayArray_etc[idx].setMap(null);  
	    } 
		
		
		function setEtcMarkers(map) {        
		    for (var i = 0; i < etcMarkers.length; i++) {  
		        etcMarkers[i].setMap(map);
		    }        
		}

 
		
		
		// ----------------------------------------------------------------------------------------------------------------
		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type){
		    
		    var elecMenu = document.getElementById('elecMenu');
		    var furnitureMenu = document.getElementById('furnitureMenu');
		    var accessoryMenu = document.getElementById('accessoryMenu');
		    var clothingMenu = document.getElementById('clothingMenu');
		    var toyMenu = document.getElementById('toyMenu');
		    var bookMenu = document.getElementById('bookMenu');
		    var etcMenu = document.getElementById('etcMenu');  
		    
		    if (type === 'elec') {
		    
		        elecMenu.className = 'menu_selected';
		        
		        furnitureMenu.className = '';
		        accessoryMenu.className = '';
		        clothingMenu.className = '';
		        toyMenu.className = '';
		        etcMenu.className = ''; 
		        
		        setElecMarkers(map);
		        setFurnitureMarkers(null);
		        setAccessoryMarkers(null);
		        setClothingMarkers(null);
		        setToyMarkers(null);
		        setBookMarkers(null);
		        setEtcMarkers(null); 
		        
		    } else if (type === 'furniture') { 
		    
		        elecMenu.className = '';
		        furnitureMenu.className = 'menu_selected';
		        accessoryMenu.className = '';
		        clothingMenu.className = '';
		        toyMenu.className = ''; 
		        bookMenu.className = ''; 
		        etcMenu.className = '';  
		        
		        setElecMarkers(null);
		        setFurnitureMarkers(map);
		        setAccessoryMarkers(null);
		        setClothingMarkers(null);
		        setToyMarkers(null);
		        setBookMarkers(null);
		        setEtcMarkers(null); 
		        
		        
		    } else if (type === 'accessory') { 
		     
		        elecMenu.className = '';
		        furnitureMenu.className = '';
		        accessoryMenu.className = 'menu_selected';
		        clothingMenu.className = '';
		        toyMenu.className = ''; 
		        bookMenu.className = ''; 
		        etcMenu.className = '';  
		        
		        setElecMarkers(null);
		        setFurnitureMarkers(null);
		        setAccessoryMarkers(map);
		        setClothingMarkers(null);
		        setToyMarkers(null);
		        setBookMarkers(null);
		        setEtcMarkers(null); 
		        
		    }   else if (type === 'clothing') { 
		    	
		        elecMenu.className = '';
		        furnitureMenu.className = '';
		        accessoryMenu.className = '';
		        clothingMenu.className = 'menu_selected';
		        toyMenu.className = ''; 
		        bookMenu.className = ''; 
		        etcMenu.className = ''; 
		        
		        setElecMarkers(null);
		        setFurnitureMarkers(null);
		        setAccessoryMarkers(null);
		        setClothingMarkers(map);
		        setToyMarkers(null);
		        setBookMarkers(null);
		        setEtcMarkers(null);
		     
		    }   else if (type === 'toy') { 
		    	
		        elecMenu.className = '';
		        furnitureMenu.className = '';
		        accessoryMenu.className = '';
		        clothingMenu.className = '';
		        toyMenu.className = 'menu_selected'; 
		        bookMenu.className = ''; 
		        etcMenu.className = ''; 
		        
		        setElecMarkers(null);
		        setFurnitureMarkers(null);
		        setAccessoryMarkers(null);
		        setClothingMarkers(null);
		        setToyMarkers(map);
		        setBookMarkers(null);
		        setEtcMarkers(null);
		     
		    }   else if (type === 'book') { 
		        elecMenu.className = '';
		        furnitureMenu.className = '';
		        accessoryMenu.className = '';
		        clothingMenu.className = '';
		        toyMenu.className = ''; 
		        bookMenu.className = 'menu_selected'; 
		        etcMenu.className = ''; 
		        
		        setElecMarkers(null);
		        setFurnitureMarkers(null);
		        setAccessoryMarkers(null);
		        setClothingMarkers(null);
		        setToyMarkers(null);
		        setBookMarkers(map);
		        setEtcMarkers(null);
		     
		    }   else if (type === 'etc') { 
		        elecMenu.className = '';
		        furnitureMenu.className = '';
		        accessoryMenu.className = '';
		        clothingMenu.className = '';
		        toyMenu.className = ''; 
		        bookMenu.className = ''; 
		        etcMenu.className = 'menu_selected'; 
		        
		        setElecMarkers(null);
		        setFurnitureMarkers(null);
		        setAccessoryMarkers(null);
		        setClothingMarkers(null);
		        setToyMarkers(null);
		        setBookMarkers(null);
		        setEtcMarkers(map);
		     
		    }  
		} 
		
	</script>


<!-- 
	다양한 이미지 마커 표시 : https://apis.map.kakao.com/web/sample/categoryMarker/
	마커 클러스터 사용 :  https://apis.map.kakao.com/web/sample/basicClusterer/

 -->

<%@ include file="../common/footer.jsp"%>