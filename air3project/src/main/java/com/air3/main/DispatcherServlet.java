package com.air3.main;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.air3.cart.controller.CartController;
import com.air3.craftInf.controller.CraftInfController;
import com.air3.error.controller.ErrorController;
import com.air3.flightInf.controller.FlightInfController;
import com.air3.main.controller.MainController;
import com.air3.member.controller.MemberController;
import com.air3.mileage.controller.MileageController;
import com.air3.order.controller.OrderController;
import com.air3.product.controller.ProductController;
import com.air3.reservation.controller.ReservationController;
import com.air3.seat.controller.SeatController;
import com.air3.serviceInfo.controller.ServiceInfoController;

/**
 * Servlet implementation class DispatcherServlet
 */
// @WebServlet("/DispatcherServlet") -> web.xml에 매핑정보 등록
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    // Oracle 드라이버 확인, 처리에 필요한 객체 생성 - Controller, Service, DAO
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("DispatcherServlet.init() - 서버가 동작되면서 같이 처음 한번 동작되는 초기화 메서드");
		
		// Oracle 드라이버 확인
		try {
			Class.forName("com.air3.io.db.DB");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} // end of try catch
		
		// 객체 생성과 조립 (넣어주기)
		Init.init();
		
		System.out.println("DispatcherServlet.init() - 객체 생성 완료....");
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("DispatcherServlet.service() - 실행중...");
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		try {
	
			// 사용자가 요청한 페이지(자원)
			String uri = request.getRequestURI();
			System.out.println("DispatcherServlet.service() - 요청한 페이지 : "+uri);
			
			// jsp로 forward 이동 -> "/WEB-INF/views/" + jsp + ".jsp"
			// redirect : jsp 정보에 "redirect:" -> "redirect:"는 제거하고 자동으로 이동 url로 사용
			String jsp = null;
			
			if(uri.equals("/") | uri.equals("/index.do")) { // 메인처리 - "/", "/index.do"
				System.out.println("메인 처리");
				jsp = ((MainController) Init.getController("mainController")).execute(request);
				
			} else if(uri.indexOf("/craftInf/")==0) { // 항공기정보 처리 
				jsp = ((CraftInfController) Init.getController("craftInfController")).execute(request);

			} else if(uri.indexOf("/flightInf/")==0) { // 비행정보 처리
				// BoardController 실행
				jsp = ((FlightInfController) Init.getController("flightInfController")).execute(request);
				
			} else if(uri.indexOf("/reservation/")==0) { // 예약 처리
				// MemberController 실행
				jsp = ((ReservationController) Init.getController("reservationController")).execute(request);
				
			} else if(uri.indexOf("/product/")==0) { // 이미지 게시판 처리
				// ImageController 실행
				jsp = ((ProductController) Init.getController("productController")).execute(request);
				
			} else if(uri.indexOf("/order/")==0) { // 공지사항 게시판 처리
				// NoticeController 실행
				jsp = ((OrderController) Init.getController("orderController")).execute(request);

			} else if(uri.indexOf("/cart/")==0) { // 공지사항 게시판 처리
				// NoticeController 실행
				jsp = ((CartController) Init.getController("cartController")).execute(request);
				
			} else if(uri.indexOf("/member/")==0) { // 공지사항 게시판 처리
				// NoticeController 실행
				jsp = ((MemberController) Init.getController("memberController")).execute(request);
				
			} else if(uri.indexOf("/mileage/")==0) { // 공지사항 게시판 처리
				// NoticeController 실행
				jsp = ((MileageController) Init.getController("mileageController")).execute(request);
				
			} else if(uri.indexOf("/serviceInfo/")==0) { // 공지사항 게시판 처리
				// NoticeController 실행
				jsp = ((ServiceInfoController) Init.getController("serviceInfoController")).execute(request);
				
			} else if(uri.indexOf("/seat/")==0) { // 공지사항 게시판 처리
				// NoticeController 실행
				jsp = ((SeatController) Init.getController("seatController")).execute(request);
				
			} else if(uri.indexOf("/error/")==0) { // 공지사항 게시판 처리
				// NoticeController 실행
				jsp = ((ErrorController) Init.getController("errorController")).execute(request);
				
			} else {
				// urㅣ이 바뀌지 않는다.
//				jsp = "error/404";
				
				// urㅣ이 바뀌게 된다.
				request.getSession().setAttribute("uri", uri);
				jsp = "redirect:/error/404.do";
				
			} // end of if else
			
			int pos = jsp.indexOf("redirect:"); // 0: 있다 , -1: 없다.
			
			System.out.println("DispatcherServlet.service().pos : "+pos);
			
			if(pos == 0) { // redirect 시킨다. - "redirect:" 는 제거하고 url로 사용한다.
			
				System.out.println("DispatcherServlet.service() - jsp 정보로 페이지 이동");
				response.sendRedirect(jsp.substring("redirect:".length()));
			
			} else { // jsp로 이동시키는 메서드를 호출한다.
				
				System.out.println("DispatcherServlet.service() - jsp 정보로 jsp로 이동");
				request.getRequestDispatcher("/WEB-INF/views/"+jsp+".jsp").forward(request, response);
			
			} // end of if else
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// error URL -> redirect 또는 바로 JSP로 forward
			// jsp -> Exception e 를 사용가능
			// url -> 메시지만 출력 할 경우
			request.getSession().setAttribute("exception", e);
			response.sendRedirect("/error/500.do"); // errorController -> jsp , 에러 페이지가 없을 경우 무한루프
			
		} // end of try catch
		
	} // end of service()

} // end of DispatcherServlet class
