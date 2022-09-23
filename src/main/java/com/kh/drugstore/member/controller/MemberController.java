package com.kh.drugstore.member.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.drugstore.auth.model.service.AuthService;
import com.kh.drugstore.member.model.dto.KakaoProfile;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.member.model.dto.MemberEntity;
import com.kh.drugstore.member.model.dto.OAuthToken;
import com.kh.drugstore.member.model.service.MemberService;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;
import com.kh.drugstore.subscription.model.dto.Subscription;
import com.kh.drugstore.subscription.model.dto.SubscriptionProduct;
import com.kh.drugstore.subscription.model.service.SubscriptionService;
import com.kh.security.model.service.MemberSecurityService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberSecurityService memberSecurityService;
	
	@Autowired
	private AuthService authService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private SubscriptionService subscriptionService;
	
	@Autowired
	private ProductService productService;

	
	
	@GetMapping("/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	
	/**
	 *  아이디/비밀번호 찾기
	 */
	@GetMapping("/findInfo.do")
	public void findMemberInfo() {
		
	}
	
	@PostMapping("/findInfo.do")
	public ModelAndView findPw(@RequestParam String memberId, @RequestParam String phone, ModelAndView mav) {
		Member member = memberService.selectOneMember(memberId);
		int rnd = (int) (Math.random() * (10000-1000) + 1000);
		String password = String.valueOf(rnd);
		String encodedPassword = bcryptPasswordEncoder.encode(password);
		member.setPassword(encodedPassword);

		// 1. db row 수정
		int result = memberService.updateMember(member);

		UserDetails updatedMember = memberSecurityService.loadUserByUsername(member.getMemberId());
		
		// 2. authentication 수정
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(updatedMember,
				updatedMember.getPassword(), updatedMember.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);

		mav.addObject("password", password);
		mav.setViewName("/member/findInfo");
		return mav;
	}
	
	@PostMapping("/findId.do")
	public ModelAndView findId(Member member, ModelAndView mav) {
		log.debug("멈버 = {}",member);
		Member findMember = memberService.selectOneMemberByName(member);
		log.debug("memberId = {}",findMember.getMemberId());
		mav.addObject("memberId", findMember.getMemberId());
		mav.setViewName("/member/findInfo");
		return mav;
	}

	/**
	 * $2a$10$2.AdYu08nfVhU89v8PyfsuF0kObCQvGCdJiR3I5p1dSQMY81FfD6O
	 * 
	 * - $2a$ 알고리즘타입 - 10$ 옵션 (비용이 높을수록 속도가 오래걸리고, 메모리사용량이 많다) -
	 * 2.AdYu08nfVhU89v8Pyfsu 22자리 random salt - F0kObCQvGCdJiR3I5p1dSQMY81FfD6O
	 * 31자리 hashing + encoding처리
	 * 
	 */
	@PostMapping("/memberEnroll.do")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
		try {
			log.debug("member = {}", member);

			// 비밀번호 암호화
			String rawPassword = member.getPassword();
			String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
			member.setPassword(encodedPassword);
			log.debug("encodedPassword = {}", encodedPassword);
			
			// 전화번호 - 빼기
			String rawPhone = member.getPhone();
			String phone = rawPhone.replace("-", "");
			member.setPhone(phone);
			
			int result = memberService.insertMember(member);
			result = authService.insertAuth(member.getMemberId());
			redirectAttr.addFlashAttribute("msg", "회원 가입이 정상적으로 처리되었습니다.");
			return "redirect:/";
		} catch (Exception e) {
			log.error("회원등록 오류 : " + e.getMessage(), e);
			throw e;
		}
	}

	/**
	 * viewName이 null인 경우, 요청url을 기준으로 jsp위치를 추론한다.
	 * 
	 * /member/memberLogin.do -> member/memberLogin
	 */
	@GetMapping("/memberLogin.do")
	public void memberLogin() {
		
	}
	
	
	@PostMapping("/memberLoginSuccess.do")
	public String memberLoginSuccess(HttpSession session) {
		log.debug("memberLoginSuccess.do 호출");
		// 로그인 후처리
		String location = "/";

		// security가 관리하는 다음 리다이렉트 url
		SavedRequest savedRequest = (SavedRequest) session.getAttribute("SPRING_SECURITY_SAVED_REQUEST");
		if (savedRequest != null) {
			location = savedRequest.getRedirectUrl();
		}

		log.debug("location = {}", location);

		return "redirect:" + location;
	}

	@GetMapping("/memberMyPage.do")
	public ModelAndView memberMyPage(Authentication authentication, ModelAndView mav) {

		Object principal = authentication.getPrincipal();
		Object credentials = authentication.getCredentials();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		log.debug("principal = {}", principal);
		log.debug("credentials = {}", credentials);
		log.debug("authorities = {}", authorities);

		mav.setViewName("/member/memberMyPage");
		return mav;
	}

	
	  @GetMapping("/updateMember.do") public ModelAndView
	  updateMember(Authentication authentication, ModelAndView mav) {
	  
	  Object principal = authentication.getPrincipal();
	  Object credentials = authentication.getCredentials(); Collection<? extends GrantedAuthority>
	  authorities = authentication.getAuthorities();
	  mav.setViewName("/member/updateMember");
	  return mav; 
	  }
	 

	/**
	 * ResponseEntity - @ResponseBody 기능 - 핸들러에서 응답코드, 응답헤더, 메세지바디를 자유롭게 제어할 수 있도록
	 * 도와주는 객체 - 메세지바디에 작성할 자바객체는 messageConverter빈에 의해 json으로 처리됨.
	 */
	@PostMapping("/checkIdDuplicate.do")
	public ResponseEntity<?> checkIdDuplicate3(@RequestParam String memberId) {
		Member member = memberService.selectOneMember(memberId);
		boolean available = member == null;

		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("available", available);

		return ResponseEntity.status(HttpStatus.OK).body(map);
	}

	@PostMapping("/memberUpdate.do")
	public String memberUpdate(@ModelAttribute Member member,String newPassword, RedirectAttributes redirectAttr, Model model) {
		log.debug("member = {}", member);
		
		// 비밀번호 암호화
		
		String encodedPassword = bcryptPasswordEncoder.encode(newPassword);
		member.setPassword(encodedPassword);
		log.debug("encodedPassword = {}", encodedPassword);
		
		// 전화번호 - 빼기
		String rawPhone = member.getPhone();
		String phone = rawPhone.replace("-", "");
		member.setPhone(phone);

		// 1. db row 수정
		int result = memberService.updateMember(member);

		UserDetails updatedMember = memberSecurityService.loadUserByUsername(member.getMemberId());
		// 2. authentication 수정
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(updatedMember,
				updatedMember.getPassword(), updatedMember.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);

		redirectAttr.addFlashAttribute("msg", "회원정보를 성공적으로 수정했습니다.");
		return "redirect:/member/memberMyPage.do";
	}
	
	@PostMapping("/memberDelete.do")
	public String memberDelete(@ModelAttribute Member member, RedirectAttributes redirectAttr) {
		
		int result = memberService.deleteMember(member);
		
		return "redirect:/";
	}
	
	@GetMapping("/kakao/callback.do")
	public String kakaoCallback(String code, HttpSession session) {
		System.out.println("code = " + code);
		
		// post방식으로 key:value 데이터를 카카오한테 요청
		RestTemplate rt = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf8");
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "88be96f783f8adf9f14dc6555f3c228e");
		params.add("redirect_uri", "http://localhost:9090/drugstore/member/kakao/callback.do");
		params.add("code", code);
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params,headers);
		
		// Http 요청하기 - Post 방식으로 그리고 response 변수의 응답 받음
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
				);
		
		//Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
			OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.println("카카오 엑세스 토큰"+oauthToken.getAccess_token());
		
		
		// post방식으로 key:value 데이터를 카카오한테 요청
				RestTemplate rt2 = new RestTemplate();
				
				// HttpHeader 오브젝트 생성
				HttpHeaders headers2 = new HttpHeaders();
				headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
				headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf8");
				
				
				// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
				HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
				
				// Http 요청하기 - Post 방식으로 그리고 response 변수의 응답 받음
				ResponseEntity<String> response2 = rt2.exchange(
						"https://kapi.kakao.com/v2/user/me",
						HttpMethod.POST,
						kakaoProfileRequest2,
						String.class
						);
		
			ObjectMapper objectMapper2 = new ObjectMapper();
			KakaoProfile kakaoProfile = null;
			
			try {
				kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
			} catch(JsonMappingException e) {
				e.printStackTrace();
			}catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			System.out.println("카카오 아이디(번호):" + kakaoProfile.getId());
			System.out.println("카카오 이메일 : " + kakaoProfile.getKakao_account().getEmail());
			
			System.out.println("드러그스토어 유저아이디 : " + kakaoProfile.getKakao_account().getEmail()+"k");
			System.out.println("드러그스토어 유저네임 : "+ kakaoProfile.getProperties().getNickname());
			
			
			String encodedPassword = bcryptPasswordEncoder.encode("1234");
			
			MemberEntity member =  new MemberEntity(kakaoProfile.getKakao_account().getEmail()+"k", kakaoProfile.getProperties().getNickname(), encodedPassword, "01011112222", null, null, true, null, null, null, null, null);
			Member member2 = memberService.findKakaoMember(member.getMemberId());
			
			if(member2 == null) {
				memberService.insertKakaoMember(member);
			}
			
			
			
			return "redirect:/";
	}
	
	@GetMapping("/memberSubscription.do")
	public void memberSubscription(Authentication authentication, Model model) {
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getMemberId();
		
		// 구독 번호 가져오기
		SubscriptionProduct subscription = subscriptionService.getSubscription(memberId);
		if(subscription == null) {
			model.addAttribute("alert", "구독 상품이 없습니다.");
		}
		else {
			log.debug("subscriptoin = {}",subscription);
			int subNo = subscription.getSubNo();
			
			int pcode = subscriptionService.getPcodeBySubNo(subNo);
			// 구독 번호로 상품 코드 가져오기
			
			Product product = productService.getProductBySubNo(pcode);
			model.addAttribute("subscription", subscription);
			model.addAttribute("product", product);			
		}
		
	}
	
	@PostMapping("/passwordCheck.do")
	public ResponseEntity<?> passwordCheck(@RequestParam("password") String password , Principal principal) {
		log.debug("프린시발 = {}",principal.getName());
		Member member = memberService.selectOneMember(principal.getName());
		log.debug("password = {}",member.getPassword());
		log.debug("password = {}",password);
		// 비밀번호 암호화
		
		String encodedPassword = bcryptPasswordEncoder.encode(password);
		boolean isMatched = bcryptPasswordEncoder.matches(password, member.getPassword());
		
		
		 
		return ResponseEntity.status(HttpStatus.OK).body(isMatched);
		
		
	}
	
	@GetMapping("/memberOrder.do")
	public void memberOrder() {
		
	}
	

	
}
