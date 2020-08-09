package com.kh.bunny.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bunny.auction.model.service.AuctionService;
import com.kh.bunny.common.util.AdminUtils;
import com.kh.bunny.common.util.SearchUtils;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.exception.MemberException;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.review.model.service.ReviewService;

@SessionAttributes(value = { "member", "enrollMember" })
@Controller
public class MemberController {
	// 사용 기록을 남기기 위한 로그 객체 등록
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MemberService memberService;
	@Autowired
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
	@Autowired
	ReviewService reviewService;
	@Autowired
	AuctionService auctionService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	// 회원 가입 페이지 이동하기
	@RequestMapping("login.do")
	public String memberEnroll() {
		logger.debug("회원 등록 페이지 이동~!");

		return "login";
	}
	
	@RequestMapping("/member/tradeView.do")
	public String tradeView( @RequestParam(value = "aPage", required = false, defaultValue = "1") int aPage
			,Model model, HttpServletRequest request, HttpSession session) {
		
		int numPerPage = 100;
		
		String nickName = ((Member)session.getAttribute("member")).getNickName();
		
		List<Map<String, String>> tlist = auctionService.selectTradeList(aPage, numPerPage,nickName);
		
		int totalContents = auctionService.selectTradeTotalContents(nickName);
		
		String pageBar = Utils.getPageBar(totalContents, aPage, numPerPage, "/auction/auctionTradeList.do?PWRITER="+nickName);
		
		model.addAttribute("list", tlist)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "member/trade";
	}
	
	@RequestMapping("/member/sellerTradeView.do")
	public String sellerTradeView(@RequestParam String nickName, Model model) {
		Map<String, Object> map = new HashMap<>();

		ArrayList<Member> seList = memberService.findSeller(nickName);
		
		Member m = memberService.findSeller2(nickName);
		
		System.out.println("seList : "+seList);
		// 신고횟수 자기소개, 닉네임, 이미지, 판매중인 상품 개수
		// map.put("seList",seList);
		model.addAttribute("seller", m);
		
		return "member/sellerTrade";
		
	}

	// 아이디 찾기 비밀번호 찾기 이동하기.
	@RequestMapping("findIdView.do")
	public String findId() {
		return "member/findId";
	}

	// 회원 가입 기능 실행하기
	@RequestMapping("memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {
		logger.debug("회원 가입 처리 메소드");
		
		String plainPassword = member.getUserPwd();
		System.out.println("비밀번호 암호화 전 : " + plainPassword);

		/************* 암호화 Start ! ***************/

		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		// $2a$10$ju.7JAGrQR9RUmYVuWtNQO6S/RUoGEWhtu8ryznONhwCheROJkSm.
		// $2a$ : 암호 알고리즘 (모드)
		// 10$ : 4-31 회 중 10번 반복 횟수를 거침
		// ju.7JAGrQR9RUmYVuWtNQO : 랜덤 Salt (임의의 문자열 22글자)
		// 6S/RUoGEWhtu8ryznONhwCheROJkSm. : 실제 암호화된 결과 (31글자)

		/*************** 암호화 End ! ***************/

		System.out.println("비밀번호 암호화 후 : " + encryptPassword);

		member.setUserPwd(encryptPassword);

		// 서비스 로직을 수행
		int result = memberService.insertMember(member);

		String loc = "/";
		String msg = "";

		// 수행한 결과에 따라 화면 분기 처리
		if (result > 0)
			msg = "회원 가입 성공!";
		else
			msg = "회원 가입 실패!";

		model.addAttribute("loc", loc); // like request.setAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";

	}

	@RequestMapping(value = "memberLogin.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam("userId") String userId, @RequestParam("userPwd") String password) {

		logger.debug("로그인 화면 접근!");

		// 1. 결과를 돌려 줄 ModelAndView 객체 생성하기
		ModelAndView mav = new ModelAndView();

		try { // 로그인 에러 시 에러 페이지 이동용 try-catch

			Member m = memberService.selectOne(userId);

			// 직접 만든 예외 발생 구문
			// if(true) throw new RuntimeException("내가 던진 에러 구문!");

			// 2. view 처리
			String msg = "";
			String loc = "/";

			if (m == null) {
				msg = "존재하지 않은 아이디입니다.";
			}else if(m.getmStatus() == 0) {
				msg = "관리자에 의해 활동 정지된 아이디입니다. \\n관리자에게 문의해주세요 \\n전화번호 : 010-1111-1234.";
			}else {
			

				// ** 비밀번호 암호화 검증
				// 똑같은 비밀번호라도 암호화된 결과가 다르기 때문에
				// bcrypt 객체를 사용하여 matches 함수로
				// 둘 간의 값이 동일한 지 검증하는 수학적 계산을 수행한다.
				if (bcryptPasswordEncoder.matches(password, m.getUserPwd())) {
					msg = "로그인 성공!";
					mav.addObject("member", m); // setAttribute();
				} else {
					msg = "비밀번호가 틀렸습니다!";
				}
			}

			// Model 객체에 담기는 값은 기본 request 영역에 저장된다.
			mav.addObject("loc", loc);
			mav.addObject("msg", msg);

			mav.setViewName("common/msg");
		} catch (Exception e) {
			// log 기록
			logger.error("로그인 에러 : " + e.getMessage());

			throw new MemberException(e.getMessage());
		}

		return mav;
	}

	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status) {
		// SessionStatus 는 현재 사용자가 접속한 웹 브라우저와
		// 서버 사이의 세션의 설정을 가지는 객체

		// 세션이 아직 완료되지 않았다면 세션을 종료시켜라!
		if (!status.isComplete())
			status.setComplete();

		return "redirect:/";
	}

	// 마이페이지 이동
	@RequestMapping(value = "/member/memberMyPage.do", method = RequestMethod.POST)
	public String memberMyPage(@RequestParam ("userId") String userId, Model model) {
		System.out.println(userId);
		List<Map<String, String>> slist = reviewService.selectSellerReview(userId);
		model.addAttribute("memberReviewList", slist);
		model.addAttribute("member", memberService.selectOne(userId));
		System.out.println("member slist"+slist);
		return "member/myPage";
	}
	
	// 프로필 보여주기(상대방)
	@RequestMapping("/member/profileAfter.do")
	public String profileAfter(@RequestParam String userId, Model model) {
		model.addAttribute("member", memberService.selectOne(userId));
		
		return "member/profileAfter";
	}

	// 회원정보 정보 페이지 이동
	@RequestMapping(value = "/member/memberView.do", method = RequestMethod.POST)
	public String memberView(@RequestParam String userId, Model model) {
		
		logger.debug("[" + userId + "] : 회원 정보 페이지 접근!");

		model.addAttribute("member", memberService.selectOne(userId));

		return "member/profileUpdate";
	}

	// 회원 정보 수정 기능 메소드
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model,
			@RequestParam(value = "userPhoto", required = false) MultipartFile userPhoto, HttpSession session) {
		logger.debug("회원 정보 수정 발생!");

		String plainPassword = member.getUserPwd();

		/************* 암호화 Start ! ***************/

		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		// $2a$10$ju.7JAGrQR9RUmYVuWtNQO6S/RUoGEWhtu8ryznONhwCheROJkSm.
		// $2a$ : 암호 알고리즘 (모드)
		// 10$ : 4-31 회 중 10번 반복 횟수를 거침
		// ju.7JAGrQR9RUmYVuWtNQO : 랜덤 Salt (임의의 문자열 22글자)
		// 6S/RUoGEWhtu8ryznONhwCheROJkSm. : 실제 암호화된 결과 (31글자)

		/*************** 암호화 End ! ***************/

		member.setUserPwd(encryptPassword);

		String saveDir = session.getServletContext().getRealPath("resources/member/profile");

		File dir = new File(saveDir);
		if (dir.exists() == false)
			dir.mkdirs();

		String originName = userPhoto.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

		int rndNum = (int) (Math.random() * 1000); // 이름바꾸기 수행. 랜덤번호..

		// 서버에서 저장 후 관리할 파일 명
		String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
		System.out.println("renamedName : " + renamedName);
		// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
		try {
			userPhoto.transferTo(new File(saveDir + "/" + renamedName));
			// transferTo는 우리가 원래 받은 원본 파일 이름을 변경된 파일 이름으로 바꾸어서 해당 경로에 저장해달라는 것.
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		member.setPhoto(renamedName);
//	      member.setUserPwd(encryptPassword);

		int result;
		try {
			result = memberService.updateMember(member);

		} catch (Exception e) {
			throw new MemberException("게시글 등록 오류" + e.getMessage());
		}

		String loc = "/";
		String msg = "";

		if (result > 0) {
			msg = "프로필 수정 성공함";
			System.out.println("프로필 수정 성공");
		} else {
			msg = "프로필 수정 실패함";
			System.out.println("프로필 수정 실패");
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";

	}

	// 회원 탈퇴 기능 메소드
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(SessionStatus status, Model model, Member member) {
		logger.debug("회원 탈퇴 기능 확인!");

		try {
			int result = memberService.deleteMember(member.getUserId());

			String loc = "/";
			String msg = "";

			if (result > 0) {
				msg = "회원 탈퇴 성공!";
				status.setComplete(); // 세션 완료(만료) 처리
			} else
				msg = "회원 탈퇴 실패!";

			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);

		} catch (Exception e) {
			logger.error("회원 탈퇴 에러 : " + e.getMessage());

			// 받은 에러를 서버 개발자가 의도한 형식으로 보내기
			throw new MemberException(e.getMessage());
		}

		return "common/msg";
	}

	/*************** Spring & json ******************/

	/**
	 * 스프링으로 json 처리하기 1. jsonView 사용하기
	 */
	/*
	 * @RequestMapping("/member/checkIdDuplicate.do") public ModelAndView
	 * jsonViewProcess(@RequestParam String userId, ModelAndView mav) { //
	 * ModelAndView를 사용하여 전달할 정보를 mav에 담고 // jsonViewResolver에게 전달하여 json형식으로 화면에 값을
	 * 보내는 방식
	 * 
	 * logger.debug("jsonView 방식의 아이디 중복 확인!");
	 * 
	 * Map<String, Object> map = new HashMap<String, Object>(); boolean isUsable =
	 * memberService.checkIdDuplicate(userId) == 0 ? true : false;
	 * 
	 * map.put("isUsable", isUsable);
	 * 
	 * mav.addAllObjects(map);
	 * 
	 * // setViewName 안에 들어갈 문자열은 servlet-context.xml에 등록한 // jsonView의 아이디와 반드시 같아야
	 * 한다. mav.setViewName("jsonView");
	 * 
	 * return mav; }
	 */

	/**
	 * 스프링으로 json 처리하기 2. @ResponseBody 어노테이션과 HttpMessageConverter 사용하여 결과 자체를
	 * json화 하기
	 */
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> responseBodyProcess(@RequestParam String userId) {

		logger.debug("@ResponseBody 방식 확인!");
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = memberService.checkIdDuplicate(userId) == 0 ? true : false;

		map.put("isUsable", isUsable);

		// @ResponseBody 는 결과가 viewResolver로 가지 않고,
		// 직접 그 결과 자체를 화면으로 전달한다.
		return map;
	}

	// 아이디 찾기
	@RequestMapping("member/findId.do")
	@ResponseBody
	public Map<String, Object> searchId(Member m) {

		String userId = "";

		Map<String, Object> map = new HashMap<>();

		Member member = memberService.findId(m);

		if (member != null) {
			userId = "회원님의 아이디는 : " + member.getUserId() + "입니다.";
		} else {
			userId = "입력하신 정보에 해당하는 회원이 없습니다.";
		}

		map.put("userId", userId);

		return map;
	}

	// 비밀번호찾기 후 수정
	@RequestMapping("member/pwdUpdate.do")
	@ResponseBody
	public Map<String, Object> resetPwd(@RequestParam String email, String userId, Member m) {

		String msg = "";

		String plainPassword = m.getUserPwd();

		/************* 암호화 Start ! ***************/

		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		// $2a$10$ju.7JAGrQR9RUmYVuWtNQO6S/RUoGEWhtu8ryznONhwCheROJkSm.
		// $2a$ : 암호 알고리즘 (모드)
		// 10$ : 4-31 회 중 10번 반복 횟수를 거침
		// ju.7JAGrQR9RUmYVuWtNQO : 랜덤 Salt (임의의 문자열 22글자)
		// 6S/RUoGEWhtu8ryznONhwCheROJkSm. : 실제 암호화된 결과 (31글자)

		/*************** 암호화 End ! ***************/


		m.setUserPwd(encryptPassword);

		Map<String, Object> map = new HashMap<>();

		int result = memberService.pwdUpdate(m);

		if (result > 0) {
			msg = "비밀번호가 변경되었습니다.";
		} else {
			msg = "비밀번호 변경에 실패했습니다.";
		}

		map.put("msg", msg);

		return map;
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/member/userIdDupCheck.do")
	@ResponseBody
	public Map<String,Object> idDupCheck(@RequestParam String userId){
		
		 Map<String,Object> map = new HashMap<>();
		 boolean isUsable = memberService.idDupCheck(userId)== 0? true:false;
	     map.put("isUsable", isUsable);
	    
		return map;
	}
	
	// 닉네임 중복 체크
	@RequestMapping(value="/member/nickDupCheck.do")
	@ResponseBody
	public Map<String,Object> nickDupCheck(@RequestParam String nickName){
			
		 Map<String,Object> map = new HashMap<>();
		 boolean isUsable = memberService.nickDupCheck(nickName)== 0 ? true:false;
	     map.put("isUsable", isUsable);
	    
		return map;
	}
	
	// 이메일 중복 체크
	@RequestMapping(value="/member/emailDupCheck.do")
	@ResponseBody
	public Map<String,Object> emailDupCheck(@RequestParam String email){
	Map<String,Object> map = new HashMap<>();
	boolean isUsable = memberService.emailDupCheck(email)== 0 ? true:false;
	map.put("isUsable",isUsable);
	
	return map;
	}
	
	// 휴대폰 중복 체크
	@RequestMapping(value="/member/phoneDupCheck.do")
	@ResponseBody
	public Map<String,Object> phoneDupCheck(@RequestParam String phone){
	Map<String,Object> map = new HashMap<>();
	boolean isUsable = memberService.phoneDupCheck(phone)== 0 ? true:false;
	map.put("isUsable",isUsable);
	
	return map;
	}
	
	// 프로필 이미지 띄우기.!!!!@@@#!!@#$@!$#!@#@!#!@#$
	@RequestMapping("/member/sellerProfile.do")
	@ResponseBody
	public Map<String, Object> sellerProfile(@RequestParam String nickName, Model model) {

		
		
		
		Map<String, Object> map = new HashMap<>();

		ArrayList<Member> seList = memberService.findSeller(nickName);
		
		Member m = memberService.findSeller2(nickName);
		
		System.out.println("seList : "+seList);
		// 신고횟수 자기소개, 닉네임, 이미지, 판매중인 상품 개수
		// map.put("seList",seList);
		model.addAttribute("seller", m);
		
		map.put("seller", m);
		

		return map;
	}
	
	//admin 회원 리스트
	@RequestMapping("/admin/member/memberList.do")
	public String memberList(
			 @RequestParam(
					 value="pPage",
					 required=false, 
					 defaultValue="1")
				int cPage, Model model
			) {
		int numPerPage = 10; 
		
		List<Map<String, String>> list
			= memberService.selectMemberList(cPage, numPerPage);
	
		int totalContents = memberService.selectMemberTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "memberList.do");
		
		model.addAttribute("user", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "admin/customerList";
	}

	// 회원 비활성화
	@RequestMapping("/admin/member/memberCountUp.do")
	@ResponseBody
	public Map<String, Object> memberCountUp(@RequestParam String userId) {
		System.out.println("controller : " + userId);

		Map<String, Object> map = new HashMap<String, Object>();
		boolean memberKill =memberService.selectOneCountUp(userId) > 0 ? true : false;
		
		map.put("kill", memberKill);
		
		return map; 
	}
	
	// 회원 활성화
	@RequestMapping("/admin/member/memberCountDown.do")
	@ResponseBody
	public Map<String, Object> memberCountDown(@RequestParam String userId) {
		System.out.println("controllercd : " + userId);

		Map<String, Object> map = new HashMap<String, Object>();
		boolean memberSave =memberService.selectOneCountDown(userId) > 0 ? true : false;
		
		map.put("save", memberSave);
		
		return map; 
	}
	
	@RequestMapping(value = "/admin/member/searchMember.do", method = RequestMethod.GET)
	public String searchMember(@RequestParam(value= "keyword", required = false, defaultValue = "") String keyword, 
								@RequestParam (value= "condition", required = false, defaultValue = "") String condition, 
								Model model,
								@RequestParam(value = "pPage", required = false, defaultValue = "1") int pPage) {
		
		int numPerPage = 10; // 10개씩 나오도록 
		List<Object> list = memberService.searchMemberList(keyword, condition, pPage, numPerPage);

		
		// 페이지 계산을 위한 총 페이지 개수 
		int totalContents =  memberService.selectSMemberTotalContents(keyword, condition);
		
		System.out.println("totalContents : " + totalContents);
		
		String pageBar = AdminUtils.getPageBar(totalContents, 
												pPage, 
												numPerPage, 
												"admin/member/searchMember.do?condition="+condition+"&keyword=" + keyword);
		
		
		model.addAttribute("keyword", keyword)
		.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("pageBar", pageBar);
		
		return "admin/customerList";	
	}

	
}