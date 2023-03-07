package com.air3.member.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.air3.main.Execute;

import com.air3.main.ServiceInterface;
import com.air3.member.vo.LoginVO;
import com.air3.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public class MemberController {

	private ServiceInterface memberLoginService;
	private ServiceInterface memberListService;
	private ServiceInterface memberUpdateGradeService;
	private ServiceInterface memberViewService;
	private ServiceInterface memberFindIdService;
	private ServiceInterface memberFindPwService;
	private ServiceInterface memberSignUpService;
	private ServiceInterface memberUpdateService;
	private ServiceInterface memberUpdateMemberService;
	private ServiceInterface memberUpdatePwService;
	private ServiceInterface memberSearchIdService;
	private ServiceInterface memberDeleteService;
	
	
	public void setMemberLoginService(ServiceInterface memberLoginService) {
		this.memberLoginService = memberLoginService;
	}

	public void setMemberListService(ServiceInterface memberListService) {
		this.memberListService = memberListService;
	}

	public void setMemberUpdateGradeService(ServiceInterface memberUpdateGradeService) {
		this.memberUpdateGradeService = memberUpdateGradeService;
	}

	public void setMemberViewService(ServiceInterface memberViewService) {
		this.memberViewService = memberViewService;
	}

	public void setMemberFindIdService(ServiceInterface memberFindIdService) {
		this.memberFindIdService = memberFindIdService;
	}

	public void setMemberFindPwService(ServiceInterface memberFindPwService) {
		this.memberFindPwService = memberFindPwService;
	}

	public void setMemberSignUpService(ServiceInterface memberSignUpService) {
		this.memberSignUpService = memberSignUpService;
	}

	public void setMemberUpdateService(ServiceInterface memberUpdateService) {
		this.memberUpdateService = memberUpdateService;
	}
	
	public void setMemberUpdateMemberService(ServiceInterface memberUpdateMemberService) {
		this.memberUpdateMemberService = memberUpdateMemberService;
	}

	public void setMemberUpdatePwService(ServiceInterface memberUpdatePwService) {
		this.memberUpdatePwService = memberUpdatePwService;
	}

	public void setMemberSearchIdService(ServiceInterface memberSearchIdService) {
		this.memberSearchIdService = memberSearchIdService;
	}

	public void setMemberDeleteService(ServiceInterface memberDeleteService) {
		this.memberDeleteService = memberDeleteService;
	}

	public String execute(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MemberController.execute()..................");
		
		int result = 0;
		
		// 이동할 페이지
		String jsp = null;
		
		// 요청 확인
		String uri = request.getRequestURI();
		
		// 세션 저장
		HttpSession session = request.getSession();
		
		switch (uri) { // 요청에 따라 처리
		case "/member/login.do": // 로그인 처리------------------------------
			
			if(request.getMethod().equals("GET")) { // get 방식 - 로그인 폼
				
				jsp = "/member/login";
				
			} else { // post 방식 - 로그인 처리
				
				// 로그인폼에서 입력한 아이디, 비밀번호 받기
				LoginVO loginVO = new LoginVO();
				loginVO.setId(request.getParameter("id"));
				loginVO.setPw(request.getParameter("pw"));
				
				// 아이디, 비밀번호 확인 후 세션에 로그인정보 저장 - 로그인
				session.setAttribute("login", Execute.run(memberLoginService, loginVO));
				
				// 로그인 처리 후 메인으로 이동
				jsp = "redirect:/";

				// 로그인 처리 후 null 일 경우
				if(session.getAttribute("login") == null) {
					jsp = "redirect:/member/login.do";
					session.setAttribute("msg", "로그인 실패. 아이디와 비밀번호를 확인해 주세요.");
				}
				

			} // end of if else
			
			break;

		case "/member/logout.do": // 로그아웃 처리 ---------------------------------
			
			// 세션에 저장된 로그인 정보 삭제 - 로그아웃
			session.removeAttribute("login");
			
			session.setAttribute("msg", "로그아웃 되었습니다.");
			
			// 로그아웃 후 메인으로 이동
			jsp = "redirect:/";
			
			break;
			
		case "/member/memberMenu.do": // 회원 메뉴 ---------------------------------
			
			jsp = "/member/memberMenu";
			
			break;
			
		case "/member/join.do": // 약관동의 ---------------------------------
			
			jsp = "/member/join";
			
			break;
			
		case "/member/list.do": // 회원 리스트 처리 ------------------------------------
			
			// 페이지 정보와 검색 정보를 받는 처리문(메소드)을 호출해서 해결한다.
			PageObject pageObject = PageObject.getInstance(request);
			
			// 리스트라고 생각을 하고 처리해 보자. -> request에 담는다.
			request.setAttribute("list", Execute.run(memberListService, pageObject));
			
			// jsp - 리스트 데이터 아래의 페이지 네비게이션을 위한 데이터 저장
			request.setAttribute("pageObject", pageObject);
			
			System.out.println(pageObject.getEndPage()); 
			System.out.println(pageObject.getTotalPage()); 
			
			jsp = "/member/list";
			
			break;
			
		case "/member/updateGrade.do": // 회원등급 변경 처리 ------------------------------------
			
			MemberVO vo = new MemberVO();
			
			vo.setId(request.getParameter("id"));
			vo.setGradeNo(Integer.parseInt(request.getParameter("grade")));
			
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("grade"));
			
			result = (int) Execute.run(memberUpdateGradeService, vo);
			
			if(result == 1) {
				session.setAttribute("msg", "["+request.getParameter("id")
						+"]의 회원등급이 ["+((Integer.parseInt(request.getParameter("grade")) ==1)?"일반회원":"관리자")
						+"](으)로 정상적으로 변경되었습니다.");
				
			} else {
				session.setAttribute("msg", "회원등급 변경에 실패했습니다.");
				
			} // end of if else
			
			jsp="redirect:/member/list.do";
			
			break;
			
		case "/member/view.do": // 회원정보 보기 처리 ------------------------------------
			
			// 아이디로 회원정보 가져오기
			String id = ((LoginVO)session.getAttribute("login")).getId();
			
			// 회원정보 보기 실행
			request.setAttribute("view", Execute.run(memberViewService, id));
			
			// 회원정보 보기 페이지로 이동
			jsp = "/member/view";
			
			break;
			
		case "/member/viewMember.do": // 회원정보 보기 처리 ( 관리자 ) ------------------------------------
			
			// 아이디로 회원정보 가져오기
			id = request.getParameter("id");
			
			// 회원정보 보기 실행
			request.setAttribute("view", Execute.run(memberViewService, id));
			
			// 회원정보 보기 페이지로 이동
			jsp = "/member/viewMember";
			
			break;
			
		case "/member/findId.do": // 아이디 찾기 처리 ------------------------------------
			
			if(request.getMethod().equals("GET")) { // get 방식 - 아이디찾기 폼
				
				jsp="/member/findId";
				
			} else { // post 방식 - 아이디 찾기 처리
				String email = request.getParameter("email")+"@"+request.getParameter("email2");

				MemberVO findIdVO = new MemberVO();
				findIdVO.setName(request.getParameter("name"));
				findIdVO.setEmail(email);
				findIdVO.setBirth(request.getParameter("birth"));
				
				request.setAttribute("vo", Execute.run(memberFindIdService, findIdVO));
				
				jsp = "/member/viewId";
				
			} // end of if else
			
			break;
			
		case "/member/findPw.do": // 비밀번호 찾기 처리 ------------------------------------
			
			if(request.getMethod().equals("GET")) { // get 방식 - 비밀번호찾기 폼
				
				jsp="/member/findPw";
				
			} else { // post 방식 - 비밀번호 찾기 처리
				
				MemberVO findPwVO = new MemberVO();
				findPwVO.setId(request.getParameter("id"));
				findPwVO.setName(request.getParameter("name"));
				findPwVO.setBirth(request.getParameter("birth"));
				
				request.setAttribute("pw", Execute.run(memberFindPwService, findPwVO));
				
				jsp = "/member/viewPw";
				
			} // end of if else
			
			break;
			
		case "/member/write.do": // 회원가입 처리 ------------------------------------

			if(request.getMethod().equals("GET")) { // get 방식 - 회원가입 폼

				jsp = "/member/write";
				
			} else { // post 방식 - 회원가입 처리
				
				String email = request.getParameter("email")+"@"+request.getParameter("email2");
				
				MemberVO writeVO = new MemberVO();
				writeVO.setName(request.getParameter("name"));
				writeVO.setE_name(request.getParameter("e_name"));
				writeVO.setId(request.getParameter("id"));
				writeVO.setPw(request.getParameter("pw"));
				writeVO.setBirth(request.getParameter("birth"));
				writeVO.setGender(request.getParameter("gender"));
				writeVO.setEmail(email);
				writeVO.setTel(request.getParameter("tel"));
				writeVO.setCountry(request.getParameter("country"));

				writeVO.setP_nationality(request.getParameter("p_nationality"));
				writeVO.setP_country(request.getParameter("p_country"));
				writeVO.setP_no(request.getParameter("p_no"));
				writeVO.setP_date(request.getParameter("p_date"));
				
				result = (int) Execute.run(memberSignUpService, writeVO);
				
				if(result == 1) { // 회원가입 성공
					
					LoginVO loginVO = new LoginVO();
					loginVO.setId(request.getParameter("id"));
					loginVO.setPw(request.getParameter("pw"));
					
					// 아이디, 비밀번호 확인 후 세션에 로그인정보 저장 - 로그인
					session.setAttribute("login", Execute.run(memberLoginService, loginVO));
					
					jsp = "/member/writeSuccess";
					
				} else { // 회원가입 실패
					session.setAttribute("msg", "회원가입에 실패했습니다.");
					jsp = "/memer/write";
					
				} // end of if else
				
			} // end of if else
			
			break;
			
		case "/member/searchId.do": // 아이디 검색 처리 ------------------------------------
			
			if(request.getMethod().equals("GET")) { // get 방식 - 아이디 중복체크 폼

				jsp = "/member/searchId";
				
			} else {
				
				id = request.getParameter("checkId");
				// result 1이면 아이디 중복, result 0이면 아이디 사용 가능
				request.setAttribute("result", Execute.run(memberSearchIdService, id));
				request.setAttribute("id", id);
				
				jsp = "/member/searchId";
				
			} // end of if else
			
			
			break;
			
		case "/member/updateMember.do": // 회원정보 수정 처리 ( 관리자 ) ------------------------------------
			
			if(request.getMethod().equals("GET")) { // get 방식 -  폼
				
				// 아이디로 회원정보 가져오기
				id = request.getParameter("id");
				
				// 회원정보 보기 실행
				request.setAttribute("update", Execute.run(memberViewService, id));
				
				// update 폼으로 이동
				jsp = "/member/updateMember";
				
			} else {
				
				MemberVO updateVO = new MemberVO();

				String email = request.getParameter("email")+"@"+request.getParameter("email2");
				
				id = request.getParameter("id");
				
				updateVO.setId(id);
				
				updateVO.setBirth(request.getParameter("birth"));
				updateVO.setGender(request.getParameter("gender"));
				updateVO.setEmail(email);
				updateVO.setTel(request.getParameter("tel"));
				
				
				result = (int) Execute.run(memberUpdateMemberService, updateVO);
				
				request.setAttribute("view", Execute.run(memberViewService, id));
				
				if(result == 1)
					session.setAttribute("msg", "회원정보가 정상적으로 변경되었습니다.");
				else
					session.setAttribute("msg", "회원정보 변경에 실패했습니다.");
				
				
				jsp = "redirect:viewMember.do?id="+updateVO.getId() 
						+ "&page=" + request.getParameter("page")
						+ "&perPageNum=" + request.getParameter("perPageNum")
						+ "&key=" + request.getParameter("key")
						+ "&word=" + URLEncoder.encode(request.getParameter("word"),"utf-8")
						;				
			} // end of if else
			
			break;
			
		case "/member/update.do": // 회원정보 수정 처리 ------------------------------------
			
			if(request.getMethod().equals("GET")) { // get 방식 -  폼

				// 아이디로 회원정보 가져오기
				id = ((LoginVO)session.getAttribute("login")).getId();
				
				// 회원정보 보기 실행
				request.setAttribute("update", Execute.run(memberViewService, id));
				
				// update 폼으로 이동
				jsp = "/member/update";
				
			} else {
				
				String email = request.getParameter("email")+"@"+request.getParameter("email2");
				
				MemberVO updateVO = new MemberVO();
				id = ((LoginVO)session.getAttribute("login")).getId();
				
				updateVO.setId(id);
				updateVO.setPw(request.getParameter("pw"));
				
				updateVO.setBirth(request.getParameter("birth"));
				updateVO.setGender(request.getParameter("gender"));
				updateVO.setEmail(email);
				updateVO.setTel(request.getParameter("tel"));
				updateVO.setCountry(request.getParameter("country"));

				updateVO.setP_nationality(request.getParameter("p_nationality"));
				updateVO.setP_country(request.getParameter("p_country"));
				updateVO.setP_no(request.getParameter("p_no"));
				updateVO.setP_date(request.getParameter("p_date"));
				
				result = (int) Execute.run(memberUpdateService, updateVO);
				
				request.setAttribute("view", Execute.run(memberViewService, id));
				
				if(result == 1)
					session.setAttribute("msg", "회원정보가 정상적으로 변경되었습니다.");
				else
					session.setAttribute("msg", "회원정보 변경에 실패했습니다. 아이디와 비밀번호를 확인해 주세요.");
				
				
				jsp = "/member/view";
				
			} // end of if else
			
			break;
			
		case "/member/updatePw.do": // 비밀번호 변경 처리 ------------------------------------
			
			if(request.getMethod().equals("GET")) { // get 방식 - 비밀번호 변경 폼
				
				jsp="/member/updatePw";
				
			} else { // post 방식 - 비밀번호 변경 처리
				
				// 아이디, 비밀번호, 신규비밀번호 저장
				MemberVO updatePwVO = new MemberVO();
				id= ((LoginVO)session.getAttribute("login")).getId();
				updatePwVO.setId(id);
				updatePwVO.setPw(request.getParameter("pw"));
				String chgPw = request.getParameter("chgPw");
				
				// 비밀번호 변경 실행
				result = (int) Execute.run(memberUpdatePwService, new Object[] {updatePwVO, chgPw});
				
				request.setAttribute("view", Execute.run(memberViewService, id));

				if(result == 1) {
					session.setAttribute("msg", "비밀번호변경을 정상적으로 완료했습니다.");
					
				} else {
					session.setAttribute("msg", "비밀번호변경 실패. 아이디와 비밀번호를 확인해 주세요.");
					
				}
				
				// 비밀번호 변경 후 회원정보로 이동
				jsp = "/member/view";
				
			} // end of if else
			
			break;
			
		case "/member/delete.do": // 회원탈퇴 처리 ------------------------------------
			
			if(request.getMethod().equals("GET")) { // get 방식 - 회원탈퇴 폼

				request.setAttribute("request", 9);
				jsp = "/member/delete";
				
			} else { // post 방식 - 회원탈퇴 처리
				
				// 아이디,비밀번호 수집
				LoginVO deleteVO = new LoginVO();
				id = request.getParameter("id");
				deleteVO.setId(id);
				deleteVO.setPw(request.getParameter("pw"));
				deleteVO.setGradeNo(1);

				
				// 회원탈퇴 실행
				result = (int) Execute.run(memberDeleteService, deleteVO);
				
				if(result == 1) { // 탈퇴 성공
					session.removeAttribute("login");
					// 회원탈퇴 후 메인으로 이동
					jsp = "/member/deleteSuccess";
				} else { // 탈퇴 실패
					request.setAttribute("view", Execute.run(memberViewService, id));
					session.setAttribute("msg", "회원탈퇴 실패. 아이디와 비밀번호를 확인해 주세요.");
					jsp = "/member/view";
					
				} // end of if else
				
			} // end of if else
			
			break;
			
		case "/member/deleteMember.do": // 회원탈퇴 처리 ( 관리자 )------------------------------------
				
				// 아이디,비밀번호 수집
				LoginVO deleteVO = new LoginVO();
				id = request.getParameter("id");
				deleteVO.setId(id);
				deleteVO.setGradeNo(9);
				
				// 회원탈퇴 실행
				result = (int) Execute.run(memberDeleteService, deleteVO);
				
				if(result == 1) { // 탈퇴 성공
					jsp = "redirect:/member/list.do?"
							+ "page="+request.getParameter("page")
							+ "&perPageNum="+request.getParameter("perPageNum");
					
				} else { // 탈퇴 실패
					request.setAttribute("view", Execute.run(memberViewService, id));
					session.setAttribute("msg", "회원탈퇴 실패. 아이디를 확인해 주세요.");
					jsp = "/member/view";
					
				} // end of if else
				
			
			break;
			
		default:
			request.getSession().setAttribute("uri", uri);
			jsp = "redirect:/error/404.do";
		} // end of switch
		
		return jsp;
	} // end of execute()
		
} // end of MemberController 
	
