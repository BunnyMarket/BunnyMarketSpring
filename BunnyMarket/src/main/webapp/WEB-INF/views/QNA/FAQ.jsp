<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
c:import url="../../views/common/header.jsp" />
<c:import url="../../views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 (FAQ)</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<style>
.accordionMenu {
	font-family: 'Noto Sans KR', sans-serif;
	color: #424242;
	background: #fff;
	padding: 10px;
	width: 1000px;
	margin: auto;
}

.accordionMenu h1 {
	margin: 0;
	font-size: 30px;
	text-shadow: 2px 2px 2px #aeaeae;
}

.accordionMenu h2 {
	margin: 5px 0;
	padding: 0;
}

.accordionMenu h2 a {
	font-size: 20px;
	display: block;
	font-weight: normal;
	color: #424242;
	text-shadow: 2px 2px 2px #aeaeae;
	text-decoration: none;
	margin: 0;
	padding: 10px;
	background: #8f8f8f;
}

.accordionMenu h2 a {
	font-size: 20px;
	display: block;
	font-weight: bold;
	color: #424242;
	text-shadow: 2px 2px 2px #aeaeae;
	text-decoration: none;
	margin: 0;
	padding: 10px;
	background: -moz-linear-gradient(top, #cecece, #8f8f8f);
	background: -webkit-gradient(linear, left top, left bottom, from(#cecece),
		to(#8f8f8f));
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.accordionMenu :target h2 a, .accordionMenu h2 a:focus, .accordionMenu h2 a:hover,
	.accordionMenu h2 :active {
	background: #b0fa02;
	background: -moz-linear-gradient(top, #a6fc56, #22dd28);
	background: -webkit-gradient(linear, left top, left bottom, from(#15c712),
		to(#08b005));
	color: #fafad4;
}

.accordionMenu p {
	padding: 0 10px;
	margin: 0;
	height: 0;
	overflow: hidden;
	-moz-transition: height 0.5s ease-in;
	-webkit-transition: height 0.5s ease-in;
	-o-transition: hegith 0.5s ease-in;
	transition: height 0.5s ease-in;
}

.accordionMenu :target p {
	overflow: auto;
	height: 300px;
}
</style>
</head>
<body>
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(img/bg-img/24.jpg);">
			<h2>자주 묻는 질문(FAQ)</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${ pageContext.request.contextPath }/index.jsp"><i
									class="fa fa-home"></i>홈화면</a></li>
							<li class="breadcrumb-item active" aria-current="page">Q&A</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!--  여기부터 -->
	<div class="accordionMenu">
		<div id="faq1" class="menuSection">
			<h2>
				<a href="#faq1">바니마켓의 뜻이 뭔가요? (왜 바니마켓인가요?)</a>
			</h2>
			<p>
				바니마켓은 '바로 당신의 니즈'의 줄임말이에요. <br /> 바니마켓을 이용하는 모든 분들의 니즈를 충족시키고 싶다는
				의지가 느껴지지않나요?😎
			</p>
		</div>
		<div id="faq2" class="menuSection">
			<h2>
				<a href="#faq2">바니마켓에서 지켜야 할 거래 매너</a>
			</h2>
			<p>
				바니마켓에서 따뜻한 거래 경험을 함께 나눠요😊 <br /> 여러분의 작은 친절이 바니 이웃에게 큰 감동을 줄 수
				있어요. <br /> <br /> 🥕 기본 매너 <br /> 기본적으로 지켜야 하는 매너에는 무엇이 있을까요? 기본
				매너인 만큼 꼭 지켜 주실 거라고 믿어요 :) <br /> • 서로 존중해요. 우리 존댓말로 대화해요. <br /> •
				모두의 시간은 소중합니다. 시간 약속을 꼭 지켜주세요.<br /> • 절대로 중간에 연락 끊기는 일이 없도록 해요.
				(잠수는 절대 안 돼요!)<br /> • 따뜻한 감사 인사로 마무리를 지어요.<br /> • 어떤 상황에서도 욕설,
				비방, 명예훼손 등의 언행은 지양해 주세요.<br />
				<br /> 🥕 구매자 매너 <br /> 이웃의 상품을 구매하는 구매자로서 따뜻함을 나눠주세요:)<br /> •
				신중하게 고민한 뒤 판매자와 확실하게 거래 약속을 잡아요.<br /> • 질문하기 전에 판매글을 꼼꼼히 읽어 주세요.<br />

				• 지나치게 가격을 깎지 말아 주세요. 가격제안 할 수 있는 경우에만 가격제안 해주세요. (정말 구매할 마음이 있을 때만
				해주실 거죠?)<br /> • 직거래할 땐 판매자에게 가까운 장소에서 만나요.<br /> • 물건 금액에 맞게 현금을
				미리 준비해 주세요.<br />
				<br /> 🥕 판매자 매너<br /> 개인 간의 거래인 만큼 신뢰할 수 있는 매너를 보여주세요:)<br /> •
				직접 촬영한 사진으로 판매글을 작성해 주세요.<br /> • 물품에 대한 설명을 자세하게 써주세요. 특히, 주요 하자에
				대한 내용은 꼭 명시해 주세요. (명시되지 않은 하자는 환불 사유가 돼요.)<br /> • 판매하기 전에 깨끗하게 세탁
				또는 관리해 주세요. 사용감이 있더라도 청결한 물건은 서로의 기분을 좋게 한답니다.<br /> • 물품의 시세를 알아보고
				가격을 정해주세요. 판매확률을 높일 수 있어요.<br /> • 거래 약속이 정해지면 게시글의 상태를 '판매중' 또는
				'낙찰중' 으로 바꿔주세요.<br /> • 예약한 분이 있다면 그분에게 판매해 주세요. <br /> • 바니마켓에서
				구매한 상품을 불가피한 사정 때문에 재판매하면 재판매하는 이유와 함께 구매한 가격과 동일하거나 더 싼 가격에 판매해
				주세요.<br />
				<br /> &nbsp;&nbsp;우리 모두 행복하고 아름다운 바니마켓을 만들어보아요😊
			</p>
		</div>
		<div id="faq3" class="menuSection">
			<h2>
				<a href="#faq3">바니마켓에서 물건을 구매하는 방법에 대해 알려주세요!</a>
			</h2>
			<p>
				바니마켓에서 사고 싶은 물건을 발견했나요? 구매하는 방법은 정말 쉬워요 :) <br />
				<br /> 상품거래의 경우 판매자에게 댓글로 구매 의사를 밝혀 보세요.<br /> 구매 전에 궁금한 것이 있다면
				판매자에게 직접 물어볼 수도 있어요.<br />
				<br /> 경매거래의 경우 상품을 구매하고 싶다면 '입찰하기'버튼을 클릭해서 경매에 입찰할 수 있어요.<br />
				경매 전에 당근 충전은 필수라는 사실 잊지마세요.😜<br />
				<br /> 거래하기로 했다면 거래 방법을 조율해 주세요. 중고거래인 만큼 거래 방법은 거래 당사자끼리 자유롭게 정할 수
				있어요.<br /> 거래 방법은 크게 두 가지가 있어요.<br />
				<br /> 첫 번째, 직거래🚗<br /> 직거래할 경우 거래 약속 시간과 장소를 정해야 해요. 장소는 보통 판매자와
				가까운 곳으로 정해요.<br /> 직접 만나서 물건의 상태를 확인한 뒤 거래가 성사되면 미리 준비한 현금을 전달하거나
				계좌이체 해주시면 돼요.<br />
				<br /> 두 번째, 택배 거래📦<br /> 택배로 거래시 구매자의 경우 물건 받을 주소, 수령인 이름, 수령인
				연락처 등을 적고 구매확인 버튼을 눌러주세요.<br /> 판매자의 경우 택배사와 송장번호를 적고 판매확인 버튼을
				눌러주세요. <br /> 판매자와 구매자 모두 판매확인, 구매확인을 한 것이 확인되면 거래가 성사된답니다! <br />
				<br /> 우리 모두 잘 지켜서 행복하고 아름다운 바니마켓을 만들어보아요🥰🥳
			</p>
		</div>
		<div id="faq4" class="menuSection">
			<h2>
				<a href="#faq4">어떤 경우에 바니마켓 사용이 제한될 수 있나요?</a>
			</h2>
			<p>
				아래와 같은 행위를 하면 바니마켓 운영원칙에 따라 이용정지 당할 수 있어요. <br />
				<br /> 🥕거래 불이행 (거래 물품 미발송 등)<br /> 🥕비매너 (거래 약속 파기, 거래 매너 위반, 신고
				누적 등)<br /> 🥕성희롱<br /> 🥕부적합한 서비스 (서비스 목적에 위반하는 서비스 사용)<br />
				🥕욕설 및 명예훼손<br /> 🥕스팸 및 어뷰징 활동<br /> 🥕홍보/광고<br /> 🥕기타 (바니마켓
				운영정책에 위배되는 행위를 한 경우)<br />
				<br /> 만약 거래 상대방이 이용정지 된 사용자라는 안내 문구가 떴다면 그 이유를 찾아 보세요.🧐<br />

				이용정지된 이유에 따라 거래를 즉시 중단해야 하는 경우일 수 있어요.<br /> 만약 거래 상대방이 안내 문구가 오류에
				의한 것이라거나 잘못 처리됐다는 등의 이야기를 한다면 주의하세요!🤔
			</p>
		</div>
		<div id="faq5" class="menuSection">
			<h2>
				<a href="#faq5">비매너 사용자를 만나면 어떻게 해야 하나요? (거래후기 남기기, 신고하기)</a>
			</h2>
			<p>
				바니마켓을 이용하면서 기분 좋지 않은 경험을 하셨나요? :(<br /> 비매너 사용자를 만났다면 이렇게 대응할 수
				있어요.<br />
				<br /> 🥕거래후기 남기기<br /> 거래한 상대방이라면 해당 상품게시글의 [추가 정보] 탭을 클릭해서
				판매자정보를 확인하고 [판매자 리뷰] 를 눌러서 거래 후기를 남길 수도 있어요.<br /> 부정 거래 후기는 상대방에게
				전달되지 않아요. (누가 남긴 것인지 상대방은 알 수 없어요.) 그러니 안심하세요.😉<br /> 일정 기간 내에 여러
				번 부정 거래 후기를 받았을 경우 당근마켓 서비스 이용이 제한됩니다.<br /> 그래서 부정 거래 후기를 남기는
				것만으로도 상대방에게 충분한 경고가 될 수 있어요.🤨<br />
				<br /> 🥕신고하기<br /> 거래한 상대방이라면 해당 상품게시글의 [신고하기]를 눌러서 알맞은 신고 카테고리
				항목으로 신고할 수 있어요.<br /> 상단의 [고객센터] 탭에서 [신고하기]를 눌러서 신고게시판으로 이동한 후
				[등록하기]를 눌러서 직접 신고하기 글을 쓰는 것도 가능해요!<br />
				<br /> 비매너 행위 뿐만 아니라 바니마켓의 운영정책을 벗어나는 행동을 하는 사용자가 있다면 그냥 지나치지 말고 꼭
				신고해 주세요.<br /> 상대방(신고를 당한 사람)은 누가 신고했는지 알 수 없습니다! <br /> 그러니 신고해야
				할 일이 생겼다면 안심하고 신고해주세요.🤗<br />
				<br /> 바니마켓은 따뜻한 거래 문화를 만들기 위해 노력하고 있어요. 여러분도 거래 후기로 동참해 주세요. :)<br />

				우리 함께 따뜻한 바니마켓을 만들어요! 🥕<br />

			</p>
		</div>
		<div id="faq6" class="menuSection">
			<h2>
				<a href="#faq6">탈퇴는 어떻게 하나요?</a>
			</h2>
			<p>
				로그인 후 상단의 '바니님, 안녕하세요' 를 눌러서 '마이페이지'로 이동합니다. <br /> [회원 정보 수정하기]를
				누르고 하단의 [회원 탈퇴]를 클릭해서 탈퇴할 수 있어요. <br /> 탈퇴하면 모든 게시글 내용이 삭제되고 복구할 수
				없으니 신중하게 탈퇴해 주세요.😢<br />
				<br /> 바니마켓은 따뜻한 거래 문화를 만들기 위해 노력하고 있어요. <br /> 우리 함께 따뜻한 바니마켓을
				만들어요! 🥕
			</p>
		</div>
		<div id="faq7" class="menuSection">
			<h2>
				<a href="#faq7">프로필 사진과 닉네임을 변경하고 싶어요.</a>
			</h2>
			<p>
				로그인 후 상단의 '바니님, 안녕하세요' 를 눌러서 '마이페이지'로 이동합니다. <br /> [회원 정보 수정하기]를
				누른 후 원하는 프로필 사진과 닉네임을 작성하고 비밀번호를 적은 후 [수정 완료]를 눌러서 변경할 수 있어요!😊 <br />

			</p>
		</div>
		<div id="faq8" class="menuSection">
			<h2>
				<a href="#faq8">관심있는 상품만 따로 모아보고 싶어요!</a>
			</h2>
			<p>관심이 가는 상품을 발견하면 찜하기 버튼을 꾸~욱 눌러보세요. 관심글은 마이페이지에서 볼 수 있답니다. 거래할지
				말지 고민된다면 더는 고민하지 말고 [찜하기]를 먼저 눌러보세요!</p>
			<div id="faq9" class="menuSection">
				<h2>
					<a href="#faq9">판매 잘하는 꿀팁을 알려드려요!</a>
				</h2>
				<p>
					1. 사진은 정말 중요해요. 📸 <br /> 첫인상이 중요한 것처럼 첫 사진도 중요하답니다. 물건의 특징을 살려서
					찍어보세요.<br /> 물건이 잘 보이도록 다양한 각도에서 여러장 찍어주시면 좋아요. 설명이 필요한 부분은 확대해서
					찍어주세요.<br />
					<br /> 2. 시세에 맞는 가격을 정해보세요.💰<br /> 중고 물품의 가격을 정하기 어려우시죠? 바니마켓
					검색을 통해 비슷한 물품의 시세를 먼저 알아보세요. 거래완료된 물품들의 가격을 보면 시세를 알 수 있어요. &nbsp;
					빨리 판매하고 싶다면, 시세보다 조금 저렴하게 책정하세요. <br />
					<br /> 3. 설명을 자세하게 적어주세요.📝<br /> 내가 올린 판매 물품을 한 문장으로 설명하긴 참
					어렵잖아요. <br /> 물건의 크기, 색상 등 기본적인 설명은 필수예요. 만약 내가 구매한다면 궁금할 것 같은
					내용들을 추가해보세요.<br /> 상품을 얼마나 사용했나요? 혹시 흠집이나 하자가 있지는 않나요? <br /> 결함이
					있더라도 물품 상태에 미리 알려준다면 그 상태를 감안하고 구매할 거예요. <br />
					<br /> 조금만 정성을 들이면 판매 확률이 올라가요! 지금 시도해보세요.<br /> 따뜻한 거래 문화를 함께
					만들어가요. 🥕
				</p>
			</div>
		</div>
		<div id="faq10" class="menuSection">
			<h2>
				<a href="#faq10">판매 금지 물품에 대해 알려주세요.</a>
			</h2>
			<p>
				🥕가품 ∙ 이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품) <br /> 🥕주류, 담배,
				전자담배, 모의총포 및 그 부속품 일체 (ex. 라이터, 비비탄 총알 등 청소년 유해물건)<br /> 🥕경유, LPG,
				휘발유 등의 유류 거래<br /> 🥕반려동물 (무료분양, 열대어 포함)<br /> 🥕한약∙ 의약품 ∙ 의료기기 ∙
				마약류 (청소년 유해약물∙유해화학물질)<br /> 🥕반영구화장 등 면허나 자격 없는 자의 불법 유사 의료 행위
				홍보/모집글<br /> 🥕수제 음식물 ∙ 건강기능식품 : 직접 만들거나 가공한 음식, 건강기능식품(지자체 및 영업
				신고를 한 사람만 판매할 수 있음)<br /> 🥕유통기한이 지난 제품<br /> 🥕도수 있는 안경 ∙ 도수 있는
				선글라스 (온라인 판매 불법)<br /> 🥕콘택트 렌즈, 써클 렌즈 (온라인 판매 불법)<br /> 🥕반복/다량
				판매하는 핸드메이드 제품<br /> 🥕음란물 (청소년 유해매체물)<br /> 🥕촬영 여부를 상대방이 알기 어려운
				카메라 혹은 그밖에 유사한 기능을 갖춘 기계장치(몰카 등)<br /> 🥕성생활용품<br /> 🥕개인정보 (게임 계정
				포함)<br /> 🥕조건부 무료나눔<br /> 🥕헌혈증<br /> 🥕렌탈 제품<br /> 🥕초대권
				(무료나눔만 가능)<br /> 🥕군용품 ∙ 도검 ∙ 화약류 ∙ 분사기 ∙ 전자충격기 ∙ 석궁 (안전인증표시 없는
				전기용품 또는 공산품)<br /> 🥕USD 1000달러 이상의 외환 거래나 매매차익을 목적으로 하는 반복적인 외환 거래
				(매매차익을 목적으로 하지 않는 1000달러 미만의 외환거래는 허용)<br /> 🥕나라미, 정부 지원 생필품,
				지역상품권 등 법률에 의해 재판매 할 수 없는 물품<br /> 🥕종량제봉투<br /> 🥕이윤추구를 목적으로
				적합성평가(적합인증)를 받지 않고 해외에서 구매한 전자기기를 국내에서 판매하는 행위<br /> 🥕낚시로 포획한 수산물
				거래 행위<br /> 🥕암표매매 행위<br /> 🥕이외 법률을 위반하는 모든 물품<br />
				<br /> *바니마켓은 현행법령상 판매가 허용되지 않는 불법상품 및 유해 상품을 판매하는 것은 제한하고 있어요. 판매
				자격을 갖췄더라도 개인 간 거래를 지향하는 바니마켓에서는 해당 물품을 판매할 수 없어요.<br /> *현행법을 위반할
				경우 처벌 받을 수 있습니다. 이점 유의해 주시길 바랍니다.<br />
				<br /> 다함께 공정하고 따뜻한 거래 문화를 만들어요. :)
			</p>
		</div>
	</div>
	<!-- 아코디언 닫는 div -->
	<!--  여기까지 -->
	<br />
	<br />

	<c:import url="../../views/common/footer.jsp" />
</body>
</html>
