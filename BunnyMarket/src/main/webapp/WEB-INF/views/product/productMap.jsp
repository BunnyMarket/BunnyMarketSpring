<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<style>
	#mapwrap{position:relative;overflow:hidden;}
	.category, .category *{margin:0;padding:0;color:#000;}   
	.category {position:absolute;overflow:hidden;top:10px;left:10px;width:202px;height:30px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
	.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
	.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
	/* .category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;}  */ 
	.category .ico_coffee {background-position:-10px 0;}  
	.category .ico_store {background-position:-10px -36px;}   
	.category .ico_carpark {background-position:-10px -72px;} 
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
			<input type="hidden" id = "mapJson" value = "${ mapJson }" />
			
			<div id="mapwrap"> 
			    <!-- 지도가 표시될 div -->
			    <div id="map" style="width:100%;height:700px;"></div>
			    	<!-- 지도 위에 표시될 마커 카테고리 -->
				    <div class="category">
				        <ul>
				            <li id="coffeeMenu" onclick="changeMarker('coffee')">
				                <span class="ico_comm ico_coffee"></span>
				                컴퓨터
				            </li>
				            <li id="storeMenu" onclick="changeMarker('store')">
				                <span class="ico_comm ico_store"></span>
				                옷
				            </li>
				            <li id="carparkMenu" onclick="changeMarker('carpark')">
				                <span class="ico_comm ico_carpark"></span>
				                책
				            </li>
				            <li id="anyMenu" onclick="changeMarker('any')">
				                <span class="ico_comm ico_carpark"></span>
				                가구
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
		
		
		var coffeePositions = [];
		var storePositions = [];
		var carparkPositions = [];
		

		// 커피숍 마커가 표시될 좌표 배열입니다
		/* coffeePositions = [ 
		    new kakao.maps.LatLng(37.499590490909185, 127.0263723554437),
		    new kakao.maps.LatLng(37.499427948430814, 127.02794423197847),
		    new kakao.maps.LatLng(37.498553760499505, 127.02882598822454),
		    new kakao.maps.LatLng(37.497625593121384, 127.02935713582038),
		    new kakao.maps.LatLng(37.49646391248451, 127.02675574250912),
		    new kakao.maps.LatLng(37.49629291770947, 127.02587362608637),
		    new kakao.maps.LatLng(37.49754540521486, 127.02546694890695)                
		]; */
		
		// 편의점 마커가 표시될 좌표 배열입니다
		storePositions = [
		    new kakao.maps.LatLng(37.497535461505684, 127.02948149502778),
		    new kakao.maps.LatLng(37.49671536281186, 127.03020491448352),
		    new kakao.maps.LatLng(37.496201943633714, 127.02959405469642),
		    new kakao.maps.LatLng(37.49640072567703, 127.02726459882308),
		    new kakao.maps.LatLng(37.49640098874988, 127.02609983175294),
		    new kakao.maps.LatLng(37.49932849491523, 127.02935780247945),
		    new kakao.maps.LatLng(37.49996818951873, 127.02943721562295)
		];
		
		
		// 주차장 마커가 표시될 좌표 배열입니다
		carparkPositions = [
		    new kakao.maps.LatLng(37.49966168796031, 127.03007039430118),
		    new kakao.maps.LatLng(37.499463762912974, 127.0288828824399),
		    new kakao.maps.LatLng(37.49896834100913, 127.02833986892401),
		    new kakao.maps.LatLng(37.49893267508434, 127.02673400572665),
		    new kakao.maps.LatLng(37.49872543597439, 127.02676785815386),
		    new kakao.maps.LatLng(37.49813096097184, 127.02591949495914),
		    new kakao.maps.LatLng(37.497680616783086, 127.02518427952202)                       
		];    
		
		// 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		var markerImageSrc = 'https://www.pngrepo.com/png/302636/79/map-marker.png';  
		    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
		    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
		    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다
		
		    
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var idx = 0;
		mapJson.forEach(function(item){
			console.log(item.paddress);
			geocoder.addressSearch(item.paddress, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			    if (status === kakao.maps.services.Status.OK) {
			    	/* var coords = new kakao.maps.LatLng(result[0].y, result[0].x); */
					console.log("위경도 확인 : " + new kakao.maps.LatLng(result[0].y, result[0].x))
			    	coffeePositions.push(new kakao.maps.LatLng(result[0].y, result[0].x));
					console.log("1배열 확인 : " + coffeePositions);
					if(idx == mapJson.length - 1){
						// 배열에 모두 넣으면 실행! 
						console.log("2배열 확인 : " + coffeePositions);
						
						

						
					    
						createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
						createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
						createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다
						
						changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    
						
						
						
					}
					idx++;
			    }
			    
			}); 
		});
		
		
		
		 
		
		mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
	        level: 3 // 지도의 확대 레벨 
	    }; 
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		
		
		
		
		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
		    var markerImage = new kakao.maps.MarkerImage(src, size, options);
		    return markerImage;            
		}
		
		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
		    var marker = new kakao.maps.Marker({
		        position: position,
		        image: image
		    });
		    
		    return marker;  
		}   
		   
		// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
		function createCoffeeMarkers() {
		    
		    for (var i = 0; i < coffeePositions.length; i++) {  
		        
		    	var imageSize = new kakao.maps.Size(35, 35),
	            imageOptions = {offset: new kakao.maps.Point(27, 69)};       
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(coffeePositions[i], markerImage);  
		        
		        // 생성된 마커를 커피숍 마커 배열에 추가합니다
		        coffeeMarkers.push(marker);
		    }     
		}
		
		// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCoffeeMarkers(map) {        
		    for (var i = 0; i < coffeeMarkers.length; i++) {  
		        coffeeMarkers[i].setMap(map);
		    }        
		}
		
		// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
		function createStoreMarkers() {
		    for (var i = 0; i < storePositions.length; i++) {
		        
		        var imageSize = new kakao.maps.Size(35, 35),
		            imageOptions = {offset: new kakao.maps.Point(27, 69)};       
		     
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(storePositions[i], markerImage);  
		
		        // 생성된 마커를 편의점 마커 배열에 추가합니다
		        storeMarkers.push(marker);    
		    }        
		}
		
		// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setStoreMarkers(map) {        
		    for (var i = 0; i < storeMarkers.length; i++) {  
		        storeMarkers[i].setMap(map);
		    }        
		}
		
		// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
		function createCarparkMarkers() {
		    for (var i = 0; i < carparkPositions.length; i++) {
		        
		    	var imageSize = new kakao.maps.Size(35, 35),
	            imageOptions = {offset: new kakao.maps.Point(27, 69)};           
		     
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(carparkPositions[i], markerImage);  
		
		        // 생성된 마커를 주차장 마커 배열에 추가합니다
		        carparkMarkers.push(marker);        
		    }                
		}
		
		// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCarparkMarkers(map) {        
		    for (var i = 0; i < carparkMarkers.length; i++) {  
		        carparkMarkers[i].setMap(map);
		    }        
		}
		
		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type){
		    
		    var coffeeMenu = document.getElementById('coffeeMenu');
		    var storeMenu = document.getElementById('storeMenu');
		    var carparkMenu = document.getElementById('carparkMenu');
		    var anyMenu = document.getElementById('anyMenu');
		    
		    // 커피숍 카테고리가 클릭됐을 때
		    if (type === 'coffee') {
		    
		        // 커피숍 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = 'menu_selected';
		        
		        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
		        storeMenu.className = '';
		        carparkMenu.className = '';
		        anyMenu.className = '';
		        
		        // 커피숍 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(map);
		        setStoreMarkers(null);
		        setCarparkMarkers(null);
		        setAnyMarkers(null);
		        
		    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
		    
		        // 편의점 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = '';
		        storeMenu.className = 'menu_selected';
		        carparkMenu.className = '';
		        anyMenu.className = '';
		        
		        // 편의점 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(null);
		        setStoreMarkers(map);
		        setCarparkMarkers(null);
		        
		        
		    } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
		     
		        // 주차장 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = '';
		        storeMenu.className = '';
		        carparkMenu.className = 'menu_selected';
		        anyMenu.className = '';
		        
		        // 주차장 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(null);
		        setStoreMarkers(null);
		        setCarparkMarkers(map);  
		        
		    }   else if (type === 'any') { // 주차장 카테고리가 클릭됐을 때
		     
		        // 주차장 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = '';
		        storeMenu.className = '';
		        carparkMenu.className = '';
		        anyMenu.className = 'menu_selected';
		        
		        // 주차장 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(null);
		        setStoreMarkers(null);
		        setCarparkMarkers(map);  
		    }   
		} 
		
	</script>


<!-- 
	다양한 이미지 마커 표시 : https://apis.map.kakao.com/web/sample/categoryMarker/
	마커 클러스터 사용 :  https://apis.map.kakao.com/web/sample/basicClusterer/

 -->

<%@ include file="../common/footer.jsp"%>