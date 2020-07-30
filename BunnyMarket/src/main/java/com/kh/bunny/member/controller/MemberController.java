package com.kh.bunny.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.exception.MemberException;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class MemberController {
	// 사용 기록을 남기기 위한 로그 객체 등록
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MemberService memberService;
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	// 회원 가입 페이지 이동하기
	@RequestMapping("login.do")
	public String memberEnroll() {
		logger.debug("회원 등록 페이지 이동~!");

		return "login";
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
			} else {

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
	@RequestMapping("/member/memberMyPage.do")
	public String memberMyPage(@RequestParam String userId, Model model) {
		model.addAttribute("member", memberService.selectOne(userId));
		
		return "member/myPage";
	}

	// 회원정보 정보 페이지 이동
	@RequestMapping("/member/memberView.do")
	public String memberView(@RequestParam String userId, Model model) {
		logger.debug("[" + userId + "] : 회원 정보 페이지 접근!");

		model.addAttribute("member", memberService.selectOne(userId));

		return "member/profileUpdate";
	}
	
	
	
	// 회원 정보 수정 기능 메소드
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {
		logger.debug("회원 정보 수정 발생!");
		
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
		
		// 1. 서비스 로직 수행! (비즈니스 로직)
		int result = memberService.updateMember(member);
				
		// 2. 처리결과에 따라 화면 분기 처리하기
		String loc = "/";
		String msg = "";

		if (result > 0) {
			msg = "회원 정보 수정 성공!";
			
		} else {
			msg = "회원 정보 수정 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

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

	// mailSending 코드
	@RequestMapping(value = "/member/auth.do", method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email)
			throws IOException {
		
		int result;
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "model_so@naver.com";
		String tomail = request.getParameter("email"); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주세요"; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("redirect:memberEnrollEnd.do"); // 뷰의이름
		mv.addObject("dice", dice);

		System.out.println("mv : " + mv);

		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

//이메일 인증 페이지 맵핑 메소드
	@RequestMapping("/member/email.do")
	public String email() {
		return "member/login";
	}

//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
//틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/member/join_injeung.do{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeung(String email_injeung, @PathVariable String dice,
			HttpServletResponse response_equals) throws IOException {

		System.out.println("마지막 : email_injeung : " + email_injeung);

		System.out.println("마지막 : dice : " + dice);

		// 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

		ModelAndView mv = new ModelAndView();

		mv.setViewName("memberEnrollEnd.do");

		mv.addObject("e_mail", email_injeung);

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			mv.setViewName("redirect:memberEnrollEnd.do");

			mv.addObject("email", email_injeung);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("redirect:memberEnrollEnd.do");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;

		}

		return mv;

	}
	//admin
	@RequestMapping("/admin/member/memberList.do")
	public String memberList(
			 @RequestParam(
					 value="cPage",
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

	@RequestMapping("/admin/member/memberCountUp.do")
	@ResponseBody
	public Map<String, Object> memberCountUp(@RequestParam String userId) {
		System.out.println("controller : " + userId);

		Map<String, Object> map = new HashMap<String, Object>();
		boolean memberKill =memberService.selectOneCountUp(userId) > 0 ? true : false;
		
		map.put("kill", memberKill);
		
		return map; 
	}
	
	@RequestMapping("/admin/member/memberCountDown.do")
	@ResponseBody
	public Map<String, Object> memberCountDown(@RequestParam String userId) {
		System.out.println("controllercd : " + userId);

		Map<String, Object> map = new HashMap<String, Object>();
		boolean memberSave =memberService.selectOneCountDown(userId) > 0 ? true : false;
		
		map.put("save", memberSave);
		
		return map; 
	}
}
