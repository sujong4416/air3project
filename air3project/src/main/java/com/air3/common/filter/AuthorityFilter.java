package com.air3.common.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.air3.member.vo.LoginVO;

/**
 * Servlet Filter implementation class AuthorityFilter
 */
//@WebFilter("/AuthorityFilter")
public class AuthorityFilter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Map<String, Integer> authMap = new HashMap<>();
	
	/**
     * @see HttpFilter#HttpFilter()
     */
    public AuthorityFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		System.out.println("AuthorityFilter.doFilter().uri - " + uri);
		
		Integer pageGradeNo = authMap.get(uri);
		
		System.out.println("AuthorityFilter.doFilter() - 처리 전 권한처리");
		
		// authMap 안에 uri 데이터가 있는지 확인
		if(pageGradeNo != null) { // authMap 안에 uri 있으므로 권한 처리
			HttpSession session = req.getSession();
			
			LoginVO vo = (LoginVO) session.getAttribute("login");
			
			// 로그인 확인
			if(vo == null) { // 로그인 안되어 있음
				// 오류처리 - 로그인 에러 페이지 이동
				res.sendRedirect("/error/loginError.do");
				return;
			}
			
			// 로그인이 된 경우 관리자 권한 처리
			if(pageGradeNo == 9 && vo.getGradeNo() != 9) {
				// 오류처리 - 권한 에러 페이지 이동
				res.sendRedirect("/error/authError.do");
				return;
			}
			
		} // end fo if

		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		System.out.println("AuthorityFilter.doFilter() - 처리 후 권한처리");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("AuthorityFilter.init() 실행 - 권한에 대한 정보 저장");
		
		// 회원관리 권한 
		authMap.put("/member/logout.do", 1);
		authMap.put("/member/memberMenu.do", 1);
		authMap.put("/member/list.do", 9);
		authMap.put("/member/updateGrade.do", 9);
		authMap.put("/member/view.do", 1);
		authMap.put("/member/viewMember.do", 9);
		authMap.put("/member/updateMember.do", 9);
		authMap.put("/member/updatePw.do", 1);
		authMap.put("/member/update.do", 1);
		authMap.put("/member/delete.do", 1);
		authMap.put("/member/deleteMember.do", 9);
		
		// 마일리지 권한
		authMap.put("/mileage/info.do", 1);
		authMap.put("/mileage/saveReservation.do", 1);
		authMap.put("/mileage/searchRevNo.do", 1);
		authMap.put("/mileage/saveOrder.do", 1);
		authMap.put("/mileage/searchOrdNo.do", 1);
		authMap.put("/mileage/view.do", 1);
		authMap.put("/mileage/viewDetail.do", 1);
		authMap.put("/mileage/viewDetailUse.do", 1);
		
		// cart 권한
		authMap.put("/cart/addcart.do", 1);
		authMap.put("/cart/list.do", 1);
		authMap.put("/cart/update.do", 1);
		authMap.put("/cart/delete.do", 1);
		authMap.put("/cart/cartOrder.do", 1);
		authMap.put("/cart/buyAll.do", 1);
		
		// craft 권한
		authMap.put("/craftInf/write.do", 9);
		authMap.put("/craftInf/update.do", 9);
		authMap.put("/craftInf/delete.do", 9);
		authMap.put("/craftInf/updateImage.do", 9);
		authMap.put("/craftInf/updateImage2.do", 9);
		
		// flight 권한
		authMap.put("/flightInf/write.do", 9);
		authMap.put("/flightInf/update.do", 9);
		authMap.put("/flightInf/delete.do", 9);
		
		// order 권한
		authMap.put("/order/list.do", 1);
		authMap.put("/order/view.do", 1);
		authMap.put("/order/write.do", 1);
		authMap.put("/order/update.do", 1);
		authMap.put("/order/delete.do", 1);
		
		// product 권한
		authMap.put("/product/write.do", 9);
		authMap.put("/product/updateImage.do", 9);
		authMap.put("/product/update.do", 9);
		authMap.put("/product/delete.do", 9);
		
		// reservation 권한
		authMap.put("/reservation/paymentWrite.do", 1);
		authMap.put("/reservation/list.do", 1);
		authMap.put("/reservation/view.do", 1);
		authMap.put("/reservation/update.do", 1);
		authMap.put("/reservation/delete.do", 1);
		authMap.put("/reservation/infoWrite.do", 1);
		
		// seat 권한
		authMap.put("/seat/seat.do", 1);
		
		// serviceInfo 권한
		authMap.put("/serviceInfo/write.do", 9);
		authMap.put("/serviceInfo/update.do", 9);
		authMap.put("/serviceInfo/updateImage.do", 9);
		authMap.put("/serviceInfo/delete.do", 9);
		
	}

}
