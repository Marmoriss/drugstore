package com.kh.drugstore.member.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.member.model.dto.KakaoProfile;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.member.model.dto.MemberEntity;
import com.kh.drugstore.member.model.dto.OAuthToken;
import com.kh.drugstore.member.model.service.MemberService;
import com.kh.drugstore.orders.model.dto.Orders;
import com.kh.drugstore.picked.model.dto.PickedExtends;
import com.kh.drugstore.picked.model.service.PickedService;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;
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

	@Autowired
	private PickedService pickedService;
	
	@GetMapping("/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	
	/**
	 *  ?????????/???????????? ??????
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
		phone = phone.replaceAll("-","");

		// 1. db row ??????
		int result = memberService.updateMember(member);

		UserDetails updatedMember = memberSecurityService.loadUserByUsername(member.getMemberId());
		
		

		mav.addObject("password", password);
		mav.setViewName("/member/findInfo");
		return mav;
	}
	
	@PostMapping("/findId.do")
	public ModelAndView findId(Member member, ModelAndView mav) {
		log.debug("?????? = {}",member.getPhone());
		String phone = member.getPhone().replaceAll("-", "");
		member.setPhone(phone);
		Member findMember = memberService.selectOneMemberByName(member);
		log.debug("memberId = {}",findMember.getMemberId());
		mav.addObject("memberId", findMember.getMemberId());
		mav.setViewName("/member/findInfo");
		return mav;
	}

	/**
	 * $2a$10$2.AdYu08nfVhU89v8PyfsuF0kObCQvGCdJiR3I5p1dSQMY81FfD6O
	 * 
	 * - $2a$ ?????????????????? - 10$ ?????? (????????? ???????????? ????????? ???????????????, ????????????????????? ??????) -
	 * 2.AdYu08nfVhU89v8Pyfsu 22?????? random salt - F0kObCQvGCdJiR3I5p1dSQMY81FfD6O
	 * 31?????? hashing + encoding??????
	 * 
	 */
	@PostMapping("/memberEnroll.do")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
		try {
			log.debug("member = {}", member);

			// ???????????? ?????????
			String rawPassword = member.getPassword();
			String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
			member.setPassword(encodedPassword);
			log.debug("encodedPassword = {}", encodedPassword);
			
			// ???????????? - ??????
			String rawPhone = member.getPhone();
			String phone = rawPhone.replace("-", "");
			member.setPhone(phone);
			
			int result = memberService.insertMember(member);
			result = authService.insertAuth(member.getMemberId());
			redirectAttr.addFlashAttribute("msg", "?????? ????????? ??????????????? ?????????????????????.");
			return "redirect:/";
		} catch (Exception e) {
			log.error("???????????? ?????? : " + e.getMessage(), e);
			throw e;
		}
	}

	/**
	 * viewName??? null??? ??????, ??????url??? ???????????? jsp????????? ????????????.
	 * 
	 * /member/memberLogin.do -> member/memberLogin
	 */
	@GetMapping("/memberLogin.do")
	public void memberLogin() {
		
	}
	
	
	@PostMapping("/memberLoginSuccess.do")
	public String memberLoginSuccess(HttpSession session) {
		log.debug("memberLoginSuccess.do ??????");
		// ????????? ?????????
		String location = "/";

		// security??? ???????????? ?????? ??????????????? url
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
		
		// ?????? ??????
		List<PickedExtends> list = pickedService.selectPickedList(authentication.getName());
		log.debug("list = {}", list);
		
		mav.addObject("list", list);
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
	 * ResponseEntity - @ResponseBody ?????? - ??????????????? ????????????, ????????????, ?????????????????? ???????????? ????????? ??? ?????????
	 * ???????????? ?????? - ?????????????????? ????????? ??????????????? messageConverter?????? ?????? json?????? ?????????.
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
		
		// ???????????? ?????????
		
		String encodedPassword = bcryptPasswordEncoder.encode(newPassword);
		member.setPassword(encodedPassword);
		log.debug("encodedPassword = {}", encodedPassword);
		
		// ???????????? - ??????
		String rawPhone = member.getPhone();
		String phone = rawPhone.replace("-", "");
		member.setPhone(phone);

		// 1. db row ??????
		int result = memberService.updateMember(member);

		UserDetails updatedMember = memberSecurityService.loadUserByUsername(member.getMemberId());
		// 2. authentication ??????
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(updatedMember,
				updatedMember.getPassword(), updatedMember.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);

		redirectAttr.addFlashAttribute("msg", "??????????????? ??????????????? ??????????????????.");
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
		
		// post???????????? key:value ???????????? ??????????????? ??????
		RestTemplate rt = new RestTemplate();
		
		// HttpHeader ???????????? ??????
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf8");
		
		// HttpBody ???????????? ??????
		MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "88be96f783f8adf9f14dc6555f3c228e");
		params.add("redirect_uri", "http://localhost:9090/drugstore/member/kakao/callback.do");
		params.add("code", code);
		
		// HttpHeader??? HttpBody??? ????????? ??????????????? ??????
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params,headers);
		
		// Http ???????????? - Post ???????????? ????????? response ????????? ?????? ??????
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
		System.out.println("????????? ????????? ??????"+oauthToken.getAccess_token());
		
		
		// post???????????? key:value ???????????? ??????????????? ??????
				RestTemplate rt2 = new RestTemplate();
				
				// HttpHeader ???????????? ??????
				HttpHeaders headers2 = new HttpHeaders();
				headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
				headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf8");
				
				
				// HttpHeader??? HttpBody??? ????????? ??????????????? ??????
				HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
				
				// Http ???????????? - Post ???????????? ????????? response ????????? ?????? ??????
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
			
			System.out.println("????????? ?????????(??????):" + kakaoProfile.getId());
			System.out.println("????????? ????????? : " + kakaoProfile.getKakao_account().getEmail());
			
			System.out.println("?????????????????? ??????????????? : " + kakaoProfile.getKakao_account().getEmail()+"k");
			System.out.println("?????????????????? ???????????? : "+ kakaoProfile.getProperties().getNickname());
			
			
			String encodedPassword = bcryptPasswordEncoder.encode("1234");
			Member kMember = new Member();
			kMember.setMemberId(kakaoProfile.getKakao_account().getEmail()+"k");
			kMember.setName(kakaoProfile.getProperties().getNickname());
			kMember.setPhone("01044443333");
			kMember.setPassword(encodedPassword);
			
			// 2. authentication ?????? -> ?????? ????????? ????????? 
			
			 Authentication newAuthentication = new UsernamePasswordAuthenticationToken(kMember,kMember.getPassword(), kMember.getAuthorities());
			 SecurityContextHolder.getContext().setAuthentication(newAuthentication);
			 
			
			
			Member member2 = memberService.findKakaoMember(kMember.getMemberId());
			
			if(member2 == null) {
				memberService.insertKakaoMember(kMember);
			}
			
			
			
			return "redirect:/";
	}
	
	@GetMapping("/memberSubscription.do")
	public void memberSubscription(Authentication authentication, Model model) {
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getMemberId();
		
		// ?????? ?????? ????????????
		SubscriptionProduct subscription = subscriptionService.getSubscription(memberId);
		if(subscription == null) {
			model.addAttribute("alert", "?????? ????????? ????????????.");
		}
		else {
			log.debug("subscriptoin = {}",subscription);
			int subNo = subscription.getSubNo();
			
			int pcode = subscriptionService.getPcodeBySubNo(subNo);
			// ?????? ????????? ?????? ?????? ????????????
			
			Product product = productService.getProductBySubNo(pcode);
			model.addAttribute("subscription", subscription);
			model.addAttribute("product", product);			
		}
		
	}
	
	@PostMapping("/passwordCheck.do")
	public ResponseEntity<?> passwordCheck(@RequestParam("password") String password , Principal principal) {
		log.debug("???????????? = {}",principal.getName());
		Member member = memberService.selectOneMember(principal.getName());
		log.debug("password = {}",member.getPassword());
		log.debug("password = {}",password);
		// ???????????? ?????????
		
		String encodedPassword = bcryptPasswordEncoder.encode(password);
		boolean isMatched = bcryptPasswordEncoder.matches(password, member.getPassword());
		
		
		 
		return ResponseEntity.status(HttpStatus.OK).body(isMatched);
		
		
	}
	
	// ??????
	@GetMapping("/memberOrder.do")
	public void memberOrder(Authentication authentication, @RequestParam(defaultValue = "1") int cPage, 
			Model model, 
			HttpServletRequest request) {
		// 1. content??????
				Map<String, Object> param = new HashMap<>();
				int limit = 10;
				param.put("cPage", cPage);
				param.put("limit", limit);
				
				Member member = (Member) authentication.getPrincipal();
				String memberId = member.getMemberId();
				param.put("memberId", memberId);
				
				List<Orders> list = memberService.getOrderById(param);
				log.debug("list = {}", list);
				
				model.addAttribute("list", list);
				
				// 2. pagebar??????
				int totalContent = memberService.getTotalContent(param);
				log.debug("totalContent = {}", totalContent);
				String url = request.getRequestURI() + "?memberId=" + memberId;
				//String url = request.getRequestURI(); 
				String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
				model.addAttribute("pagebar", pagebar);
	}
	
	@GetMapping("/findByValues.do")
	public String findByValues(Authentication authentication, @RequestParam String to, @RequestParam String from, @RequestParam String status, Model model) {
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getMemberId();
		log.debug("to = {}", to);
		log.debug("from = {}", from);
		Map<String, Object> param = new HashMap<>();
		param.put("status", status);
		param.put("to", to);
		param.put("from", from);
		param.put("memberId", memberId);
		List<Orders> list = memberService.findByValues(param);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		return "/member/memberOrder";
	}

	
}
