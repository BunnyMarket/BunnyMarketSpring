<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>
<style>
/* 커스텀 오버레이  */
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

/* 좌표로 주소 띄우기위한 css */
.map_wrap {position:relative;width:100%;height:350px;}
.title {font-weight:bold;display:block;}
.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
#centerAddr {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

.contents {font-weight:bold;display:block;}


/* 지도 영역 밖의 마커위치 추적 */
	.node {
	    position: absolute;
	    background-image: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/sign-info-64.png);
	    cursor: pointer;
	    width: 64px;
	    height: 64px;
	}
	
	.tooltip {
	    background-color: #fff;
	    position: absolute;
	    border: 2px solid #333;
	    font-size: 25px;
	    font-weight: bold;
	    padding: 3px 5px 0;
	    left: 65px;
	    top: 14px;
	    border-radius: 5px;
	    white-space: nowrap;
	    display: none;
	}
	
	.tracker {
	    position: absolute;
	    margin: -35px 0 0 -30px;
	    display: none;
	    cursor: pointer;
	    z-index: 3;
	}
	
	.icon {
	    position: absolute;
	    left: 6px;
	    top: 9px;
	    width: 48px;
	    height: 48px;
	    background-image: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/sign-info-48.png);
	}
	
	.balloon {
	    position: absolute;
	    width: 60px;
	    height: 60px;
	    background-image: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/balloon.png);
	    -ms-transform-origin: 50% 34px;
	    -webkit-transform-origin: 50% 34px;
	    transform-origin: 50% 34px;
}

</style>
<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>상품 상세보기</h2>
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
						<li class="breadcrumb-item active" aria-current="page">상품
							상세보기</li>
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
			<div class="row justify-content-between">
				<div class="col-12 col-md-6 col-lg-5">
					<div class="single_product_thumb">
						<div>
							<div id="pImgArea">
								<img id="titleImg" src="${ pageContext.request.contextPath }/resources/upload/product/${ product.PImg }" class="d-block w-100" width="344.8px"
									height="357.56px">
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-md-6">
					<div class="single_product_desc">
						<h4 class="title">${ product.PTitle }</h4>
						<button type="button" class="btn alazea-btn mt-15"
							style="float: right"
							onclick="location.href='${ pageContext.request.contextPath }/product/productView.do?pno=${ product.pno }'">수정하기</button>
						<br />

						<h4 class="price">${ product.PPrice } won</h4>
						<br />

						<h5>글 작성날짜</h5>
						<p>${ product.PDate }</p>
						<br />

					</div>
				</div>
			</div>
			<br /><br />
			<div class="row justify-content-between">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item">
								<a href="#description" class="nav-link active" data-toggle="tab" role="tab">상세 설명</a>
							</li>
							<li class="nav-item">
								<a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">추가 정보</a>
							</li>
							<li class="nav-item">
								<a href="#reviews" class="nav-link" data-toggle="tab" role="tab">
									댓글<span class="text-muted">(1)</span>
								</a>
							</li>
						</ul>
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active"
								id="description">
								<div class="description_area">
									<!-- 썸머노트 -->
									<div class="col-12 col-md-12">
										<br /> <br />
										<p>${ product.PContent }</p>
									</div>
									<br /><br />
									<hr />
									<div class="col-12">
										<br /> <br />
										<h4>판매자의 직거래 선호 지역</h4>
										<div class="map_wrap">
											<div id="map" style="width:100%; height: 460px; position:relative;overflow:hidden;"></div>
										</div>
										<br /><br /><br /><br /><br /><br />
									</div>

								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="addi-info">
								<div class="additional_info_area">
									<div class="col-12 col-md-6">
										<br /> <br />
										<h4>판매자 정보</h4>
										<!-- 여기다가 판매자 정보 적어주기 -->
									</div>
									<div class="col-12 col-md-12">
										<br /> <br />
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="reviews">
								<!-- Comment Area Start -->
								<div class="comment_area clearfix">
									<h4 class="headline">2 Comments</h4>

									<ol>
										<!-- Single Comment Area -->
										<li class="single_comment_area">
											<div class="comment-wrapper d-flex">
												<!-- Comment Meta -->
												<div class="comment-author">
													<img src="${ pageContext.request.contextPath }/resources/img/bg-img/37.jpg" alt="">
												</div>
												<!-- Comment Content -->
												<div class="comment-content">
													<div
														class="d-flex align-items-center justify-content-between">
														<h5>Simona Halep</h5>
														<span class="comment-date">09:00 AM, 20 Jun 2018</span>
													</div>
													<p>Neque porro quisquam est, qui dolorem ipsum quia
														dolor sit amet, consectetu adipisci velit, sed quia non
														numquam eius modi</p>
													<a class="active" href="#">Reply</a>
												</div>
											</div>
											<ol class="children">
												<li class="single_comment_area">
													<div class="comment-wrapper d-flex">
														<!-- Comment Meta -->
														<div class="comment-author">
															<img src="${ pageContext.request.contextPath }/resources/img/bg-img/38.jpg" alt="">
														</div>
														<!-- Comment Content -->
														<div class="comment-content">
															<div
																class="d-flex align-items-center justify-content-between">
																<h5>Rafael Nadal</h5>
																<span class="comment-date">09:30 AM, 20 Jun 2018</span>
															</div>
															<p>Neque porro quisquam est, qui dolorem ipsum quia
																dolor sit amet, consectetu adipisci velit, sed quia non
																numquam eius modi</p>
															<a class="active" href="#">Reply</a>
														</div>
													</div>
												</li>
											</ol>
										</li>
										<li class="single_comment_area">
											<div class="comment-wrapper d-flex">
												<!-- Comment Meta -->
												<div class="comment-author">
													<img src="${ pageContext.request.contextPath }/resources/img/bg-img/39.jpg" alt="">
												</div>
												<!-- Comment Content -->
												<div class="comment-content">
													<div
														class="d-flex align-items-center justify-content-between">
														<h5>Maria Sharapova</h5>
														<span class="comment-date">02:20 PM, 20 Jun 2018</span>
													</div>
													<p>Neque porro quisquam est, qui dolorem ipsum quia
														dolor sit amet, consectetu adipisci velit, sed quia non
														numquam eius modi</p>
													<a class="active" href="#">Reply</a>
												</div>
											</div>
										</li>
									</ol>
								</div>
								<!-- Comment Area End -->

								<!-- Leave A Comment -->
								<div class="leave-comment-area clearfix">
									<div class="comment-form">
										<h4 class="headline">Leave A Comment</h4>

										<div class="contact-form-area">
											<!-- Comment Form -->
											<form action="#" method="post">
												<div class="col-12">
													<div class="form-group">
														<textarea class="form-control" name="message"
															id="message" cols="30" rows="10" placeholder="Comment"></textarea>
													</div>
												</div>
												<div class="col-12">
													<button type="submit" class="btn alazea-btn">
														Post Comment
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- Leave A Comment End -->
							</div>
						</div>
						<!-- Tab Content End -->
					</div>
				</div>
			</div>
			<!-- Row and -->
		</div>
	</div>


</section>
<!-- ##### Single Product Details Area End ##### -->

<script>

	// 지도 영역 밖의 마커 위치 추적하기 =========================================
		/**
		 * AbstractOverlay를 상속받을 객체를 선언합니다.
		 */
		function TooltipMarker(position, tooltipText) {
		    this.position = position;
		    var node = this.node = document.createElement('div');
		    node.className = 'node';
		
		    var tooltip = document.createElement('div');
		    tooltip.className = 'tooltip',
		
		    tooltip.appendChild(document.createTextNode(tooltipText));
		    node.appendChild(tooltip);
		    
		    // 툴팁 엘리먼트에 마우스 인터렉션에 따라 보임/숨김 기능을 하도록 이벤트를 등록합니다.
		    node.onmouseover = function() {
		        tooltip.style.display = 'block';
		    };
		    node.onmouseout = function() {
		        tooltip.style.display = 'none';
		    };
		}
		
		// AbstractOverlay 상속. 프로토타입 체인을 연결합니다.
		TooltipMarker.prototype = new kakao.maps.AbstractOverlay;
		
		// AbstractOverlay의 필수 구현 메소드.
		// setMap(map)을 호출했을 경우에 수행됩니다.
		// AbstractOverlay의 getPanels() 메소드로 MapPanel 객체를 가져오고
		// 거기에서 오버레이 레이어를 얻어 생성자에서 만든 엘리먼트를 자식 노드로 넣어줍니다.
		TooltipMarker.prototype.onAdd = function() {
		    var panel = this.getPanels().overlayLayer;
		    panel.appendChild(this.node);
		};
		
		// AbstractOverlay의 필수 구현 메소드.
		// setMap(null)을 호출했을 경우에 수행됩니다.
		// 생성자에서 만든 엘리먼트를 오버레이 레이어에서 제거합니다.
		TooltipMarker.prototype.onRemove = function() {
		    this.node.parentNode.removeChild(this.node);
		};
		
		// AbstractOverlay의 필수 구현 메소드.
		// 지도의 속성 값들이 변화할 때마다 호출됩니다. (zoom, center, mapType)
		// 엘리먼트의 위치를 재조정 해 주어야 합니다.
		TooltipMarker.prototype.draw = function() {
		    // 화면 좌표와 지도의 좌표를 매핑시켜주는 projection객체
		    var projection = this.getProjection();
		    
		    // overlayLayer는 지도와 함께 움직이는 layer이므로
		    // 지도 내부의 위치를 반영해주는 pointFromCoords를 사용합니다.
		    var point = projection.pointFromCoords(this.position);
		
		    // 내부 엘리먼트의 크기를 얻어서
		    var width = this.node.offsetWidth;
		    var height = this.node.offsetHeight;
		
		    // 해당 위치의 정중앙에 위치하도록 top, left를 지정합니다.
		    this.node.style.left = (point.x - width/2) + "px";
		    this.node.style.top = (point.y - height/2) + "px";
		};
		
		// 좌표를 반환하는 메소드
		TooltipMarker.prototype.getPosition = function() {
		    return this.position;
		};
		
		/**
		 * 지도 영역 외부에 존재하는 마커를 추적하는 기능을 가진 객체입니다.
		 * 클리핑 알고리즘을 사용하여 tracker의 좌표를 구하고 있습니다.
		 */
		function MarkerTracker(map, target) {
		    // 클리핑을 위한 outcode
		    var OUTCODE = {
		        INSIDE: 0, // 0b0000
		        TOP: 8, //0b1000
		        RIGHT: 2, // 0b0010
		        BOTTOM: 4, // 0b0100
		        LEFT: 1 // 0b0001
		    };
		    
		    // viewport 영역을 구하기 위한 buffer값
		    // target의 크기가 60x60 이므로 
		    // 여기서는 지도 bounds에서 상하좌우 30px의 여분을 가진 bounds를 구하기 위해 사용합니다.
		    var BOUNDS_BUFFER = 30;
		    
		    // 클리핑 알고리즘으로 tracker의 좌표를 구하기 위한 buffer값
		    // 지도 bounds를 기준으로 상하좌우 buffer값 만큼 축소한 내부 사각형을 구하게 됩니다.
		    // 그리고 그 사각형으로 target위치와 지도 중심 사이의 선을 클리핑 합니다.
		    // 여기서는 tracker의 크기를 고려하여 40px로 잡습니다.
		    var CLIP_BUFFER = 40;
		
		    // trakcer 엘리먼트
		    var tracker = document.createElement('div');
		    tracker.className = 'tracker';
		
		    // 내부 아이콘
		    var icon = document.createElement('div');
		    icon.className = 'icon';
		
		    // 외부에 있는 target의 위치에 따라 회전하는 말풍선 모양의 엘리먼트
		    var balloon = document.createElement('div');
		    balloon.className = 'balloon';
		
		    tracker.appendChild(balloon);
		    tracker.appendChild(icon);
		
		    map.getNode().appendChild(tracker);
		
		    // traker를 클릭하면 target의 위치를 지도 중심으로 지정합니다.
		    tracker.onclick = function() {
		        map.setCenter(target.getPosition());
		        setVisible(false);
		    };
		
		    // target의 위치를 추적하는 함수
		    function tracking() {
		        var proj = map.getProjection();
		        
		        // 지도의 영역을 구합니다.
		        var bounds = map.getBounds();
		        
		        // 지도의 영역을 기준으로 확장된 영역을 구합니다.
		        var extBounds = extendBounds(bounds, proj);
		
		        // target이 확장된 영역에 속하는지 판단하고
		        if (extBounds.contain(target.getPosition())) {
		            // 속하면 tracker를 숨깁니다.
		            setVisible(false);
		        } else {
		            // target이 영역 밖에 있으면 계산을 시작합니다.
		            
		
		            // 지도 bounds를 기준으로 클리핑할 top, right, bottom, left를 재계산합니다.
		            //
		            //  +-------------------------+
		            //  | Map Bounds              |
		            //  |   +-----------------+   |
		            //  |   | Clipping Rect   |   |
		            //  |   |                 |   |
		            //  |   |        *       (A)  |     A
		            //  |   |                 |   |
		            //  |   |                 |   |
		            //  |   +----(B)---------(C)  |
		            //  |                         |
		            //  +-------------------------+
		            //
		            //        B
		            //
		            //                                       C
		            // * 은 지도의 중심,
		            // A, B, C가 TooltipMarker의 위치,
		            // (A), (B), (C)는 각 TooltipMarker에 대응하는 tracker입니다.
		            // 지도 중심과 각 TooltipMarker를 연결하는 선분이 있다고 가정할 때,
		            // 그 선분과 Clipping Rect와 만나는 지점의 좌표를 구해서
		            // tracker의 위치(top, left)값을 지정해주려고 합니다.
		            // tracker 자체의 크기가 있기 때문에 원래 지도 영역보다 안쪽의 가상 영역을 그려
		            // 클리핑된 지점을 tracker의 위치로 사용합니다.
		            // 실제 tracker의 position은 화면 좌표가 될 것이므로 
		            // 계산을 위해 좌표 변환 메소드를 사용하여 모두 화면 좌표로 변환시킵니다.
		            
		            // TooltipMarker의 위치
		            var pos = proj.containerPointFromCoords(target.getPosition());
		            
		            // 지도 중심의 위치
		            var center = proj.containerPointFromCoords(map.getCenter());
		
		            // 현재 보이는 지도의 영역의 남서쪽 화면 좌표
		            var sw = proj.containerPointFromCoords(bounds.getSouthWest());
		            
		            // 현재 보이는 지도의 영역의 북동쪽 화면 좌표
		            var ne = proj.containerPointFromCoords(bounds.getNorthEast());
		            
		            // 클리핑할 가상의 내부 영역을 만듭니다.
		            var top = ne.y + CLIP_BUFFER;
		            var right = ne.x - CLIP_BUFFER;
		            var bottom = sw.y - CLIP_BUFFER;
		            var left = sw.x + CLIP_BUFFER;
		
		            // 계산된 모든 좌표를 클리핑 로직에 넣어 좌표를 얻습니다.
		            var clipPosition = getClipPosition(top, right, bottom, left, center, pos);
		            
		            // 클리핑된 좌표를 tracker의 위치로 사용합니다.
		            tracker.style.top = clipPosition.y + 'px';
		            tracker.style.left = clipPosition.x + 'px';
		
		            // 말풍선의 회전각을 얻습니다.
		            var angle = getAngle(center, pos);
		            
		            // 회전각을 CSS transform을 사용하여 지정합니다.
		            // 브라우저 종류에따라 표현되지 않을 수도 있습니다.
		            // https://caniuse.com/#feat=transforms2d
		            balloon.style.cssText +=
		                '-ms-transform: rotate(' + angle + 'deg);' +
		                '-webkit-transform: rotate(' + angle + 'deg);' +
		                'transform: rotate(' + angle + 'deg);';
		
		            // target이 영역 밖에 있을 경우 tracker를 노출합니다.
		            setVisible(true);
		        }
		    }
		
		    // 상하좌우로 BOUNDS_BUFFER(30px)만큼 bounds를 확장 하는 함수
		    //
		    //  +-----------------------------+
		    //  |              ^              |
		    //  |              |              |
		    //  |     +-----------------+     |
		    //  |     |                 |     |
		    //  |     |                 |     |
		    //  |  <- |    Map Bounds   | ->  |
		    //  |     |                 |     |
		    //  |     |                 |     |
		    //  |     +-----------------+     |
		    //  |              |              |
		    //  |              v              |
		    //  +-----------------------------+
		    //  
		    // 여기서는 TooltipMaker가 완전히 안보이게 되는 시점의 영역을 구하기 위해서 사용됩니다.
		    // TooltipMarker는 60x60 의 크기를 가지고 있기 때문에 
		    // 지도에서 완전히 사라지려면 지도 영역을 상하좌우 30px만큼 더 드래그해야 합니다.
		    // 이 함수는 현재 보이는 지도 bounds에서 상하좌우 30px만큼 확장한 bounds를 리턴합니다.
		    // 이 확장된 영역은 TooltipMarker가 화면에서 보이는지를 판단하는 영역으로 사용됩니다.
		    function extendBounds(bounds, proj) {
		        // 주어진 bounds는 지도 좌표 정보로 표현되어 있습니다.
		        // 이것을 BOUNDS_BUFFER 픽셀 만큼 확장하기 위해서는
		        // 픽셀 단위인 화면 좌표로 변환해야 합니다.
		        var sw = proj.pointFromCoords(bounds.getSouthWest());
		        var ne = proj.pointFromCoords(bounds.getNorthEast());
		
		        // 확장을 위해 각 좌표에 BOUNDS_BUFFER가 가진 수치만큼 더하거나 빼줍니다.
		        sw.x -= BOUNDS_BUFFER;
		        sw.y += BOUNDS_BUFFER;
		
		        ne.x += BOUNDS_BUFFER;
		        ne.y -= BOUNDS_BUFFER;
		
		        // 그리고나서 다시 지도 좌표로 변환한 extBounds를 리턴합니다.
		        // extBounds는 기존의 bounds에서 상하좌우 30px만큼 확장된 영역 객체입니다.  
		        return new kakao.maps.LatLngBounds(
		                        proj.coordsFromPoint(sw),proj.coordsFromPoint(ne));
		        
		    }
		
		
		    // Cohen–Sutherland clipping algorithm
		    // 자세한 내용은 아래 위키에서...
		    // https://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland_algorithm
		    function getClipPosition(top, right, bottom, left, inner, outer) {
		        function calcOutcode(x, y) {
		            var outcode = OUTCODE.INSIDE;
		
		            if (x < left) {
		                outcode |= OUTCODE.LEFT;
		            } else if (x > right) {
		                outcode |= OUTCODE.RIGHT;
		            }
		
		            if (y < top) {
		                outcode |= OUTCODE.TOP;
		            } else if (y > bottom) {
		                outcode |= OUTCODE.BOTTOM;
		            }
		
		            return outcode;
		        }
		
		        var ix = inner.x;
		        var iy = inner.y;
		        var ox = outer.x;
		        var oy = outer.y;
		
		        var code = calcOutcode(ox, oy);
		
		        while(true) {
		            if (!code) {
		                break;
		            }
		
		            if (code & OUTCODE.TOP) {
		                ox = ox + (ix - ox) / (iy - oy) * (top - oy);
		                oy = top;
		            } else if (code & OUTCODE.RIGHT) {
		                oy = oy + (iy - oy) / (ix - ox) * (right - ox);        
		                ox = right;
		            } else if (code & OUTCODE.BOTTOM) {
		                ox = ox + (ix - ox) / (iy - oy) * (bottom - oy);
		                oy = bottom;
		            } else if (code & OUTCODE.LEFT) {
		                oy = oy + (iy - oy) / (ix - ox) * (left - ox);     
		                ox = left;
		            }
		
		            code = calcOutcode(ox, oy);
		        }
		
		        return {x: ox, y: oy};
		    }
		
		    // 말풍선의 회전각을 구하기 위한 함수
		    // 말풍선의 anchor가 TooltipMarker가 있는 방향을 바라보도록 회전시킬 각을 구합니다.
		    function getAngle(center, target) {
		        var dx = target.x - center.x;
		        var dy = center.y - target.y ;
		        var deg = Math.atan2( dy , dx ) * 180 / Math.PI; 
		
		        return ((-deg + 360) % 360 | 0) + 90;
		    }
		    
		    // tracker의 보임/숨김을 지정하는 함수
		    function setVisible(visible) {
		        tracker.style.display = visible ? 'block' : 'none';
		    }
		    
		    // Map 객체의 'zoom_start' 이벤트 핸들러
		    function hideTracker() {
		        setVisible(false);
		    }
		    
		    // target의 추적을 실행합니다.
		    this.run = function() {
		        kakao.maps.event.addListener(map, 'zoom_start', hideTracker);
		        kakao.maps.event.addListener(map, 'zoom_changed', tracking);
		        kakao.maps.event.addListener(map, 'center_changed', tracking);
		        tracking();
		    };
		    
		    // target의 추적을 중지합니다.
		    this.stop = function() {
		        kakao.maps.event.removeListener(map, 'zoom_start', hideTracker);
		        kakao.maps.event.removeListener(map, 'zoom_changed', tracking);
		        kakao.maps.event.removeListener(map, 'center_changed', tracking);
		        setVisible(false);
		    };
		}
		
	// ====================================================================
		
	// 지도 넣기 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	
	var Sellercoords; // 주소로 좌표를 받을 변수 선언 (판매자의 위치를 넣을 변수 선언)
	
	var imageSrc = 'https://www.pngrepo.com/png/264372/79/easter-bunny-rabbit.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

	
	// 주소로 좌표를 검색합니다
	var sellerMarker;
	geocoder.addressSearch('${product.PAddress}', function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {
	    	Sellercoords = new kakao.maps.LatLng(result[0].y, result[0].x);
		}
	    
	    
	    // 결과값으로 받은 위치를 마커로 표시합니다
	        sellerMarker = new kakao.maps.Marker({
	        map: map,
	        position: Sellercoords,
	        image: markerImage
	        
	    });
	    
	 	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    var content = '<div class="customoverlay">' +
	        		  '  <a href="https://map.kakao.com/?q=${product.PAddress}" target="_blank">' +
	       			  '    <span class="title">판매자가 거래를 원하는 지역</span>' +
	       			  '  </a>' +
	       			  '</div>';

	    // 커스텀 오버레이가 표시될 위치입니다 
	    var position = Sellercoords;  

	    // 커스텀 오버레이를 생성합니다
	    var customOverlay = new kakao.maps.CustomOverlay({
	        map: map,
	        position: position,
	        content: content,
	        yAnchor: 1 
	    });
	
	    /* // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        				content: '<div style="width:180px;text-align:center;padding:6px 0;">거래자가 원하는 거래 지역</div>'
		});
		infowindow.open(map, marker);  */
	
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(Sellercoords);
		
	    
	});
	    
	// 사용자 위치 표시 
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	
	var BuyerCoords;
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var BuyerCoords = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            // 인포윈도우에 표시될 내용 
	            message = '<div class = "contents" style="width : 200px; padding:5px;">당신은 지금 여기에 있나요..?</div>'; 
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(BuyerCoords, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    //var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
	    var BuyerCoords = Sellercoords, // GeoLocation을 사용할 수 없을 때 사용자의 위치를 판매자가 거래하고싶은 위치로 설정해주기 
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(BuyerCoords, message);
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	var buyerMarker;
	function displayMarker(BuyerCoords, message) {
	
	    // 마커를 생성합니다
	        buyerMarker = new kakao.maps.Marker({  
	        map: map, 
	        position: BuyerCoords
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, buyerMarker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(BuyerCoords);      
	} 
	
	// 상대 마커 추적하기
	// 툴팁을 노출하는 마커를 생성합니다.
	var marker1 = new TooltipMarker(sellerCoords, '판매자가 원하는 위치');
	var marker2 = new TooltipMarker(buyerCoords, '당신의 현재 위치');
	marker1.setMap(map);
	marker2.setMap(map);
	
	// MarkerTracker를 생성합니다.
	var markerTracker1 = new MarkerTracker(map, marker1);
	var markerTracker2 = new MarkerTracker(map, marker2);
	
	// marker의 추적을 시작합니다.
	markerTracker1.run();
	markerTracker2.run();
	
	
</script>


<%@ include file="../common/footer.jsp"%>