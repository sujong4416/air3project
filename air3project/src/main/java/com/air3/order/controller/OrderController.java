package com.air3.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.air3.main.ServiceInterface;
import com.air3.member.vo.LoginVO;
import com.air3.member.vo.MemberVO;
import com.air3.mileage.vo.MileageVO;
import com.air3.order.vo.OrderVO;
import com.air3.product.dao.ProductDAO;
import com.air3.product.service.ProductViewServiceImpl;
import com.air3.product.vo.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.webjjang.util.PageObject;
import com.air3.cart.vo.CartVO;
import com.air3.main.Execute;


public class OrderController {
	// private 변수로 BoardListService... 등등
			private ServiceInterface orderListService;
			private ServiceInterface orderViewService;
			private ServiceInterface orderOrderService;
			private ServiceInterface orderUpdateService;
			private ServiceInterface orderDetailService;
			private ServiceInterface orderDeleteService;
			private ServiceInterface orderSearchRevService;
			private ServiceInterface orderSearchMService;
			private ServiceInterface MileageUseInsertService;
			private ServiceInterface mileageUpdateService;

			// setter를 만들어서 생성된 service를 받는다.
			public void setOrderListService(ServiceInterface orderListService) {
				this.orderListService = orderListService;
			}
			public void setOrderViewService(ServiceInterface orderViewService) {
				this.orderViewService = orderViewService;
			}
			public void setOrderOrderService(ServiceInterface orderOrderService) {
				this.orderOrderService = orderOrderService;
			}
			public void setOrderUpdateService(ServiceInterface orderUpdateService) {
				this.orderUpdateService = orderUpdateService;
			}
			public void setOrderDetailService(ServiceInterface orderDetailService) {
				this.orderDetailService = orderDetailService;
			}
			public void setOrderDeleteService(ServiceInterface orderDeleteService) {
				this.orderDeleteService = orderDeleteService;
			}
			public void setOrderSearchRevService(ServiceInterface orderSearchRevService) {
				this.orderSearchRevService = orderSearchRevService;
			}
			public void setOrderSearchMService(ServiceInterface orderSearchMService) {
				this.orderSearchMService = orderSearchMService;
			}
			
			public void setMileageUseInsertService(ServiceInterface MileageUseInsertService) {
				this.MileageUseInsertService = MileageUseInsertService;
			}
			
			public void setMileageUpdateService(ServiceInterface mileageUpdateService) {
				this.mileageUpdateService = mileageUpdateService;
			}
			
			public String execute(HttpServletRequest request) throws Exception{
				System.out.println("OrderController.execute().request:" + request);
				
				String uri = request.getRequestURI();
				// get , post 알기 위한 메서드
				String method = request.getMethod();
				String jsp = null;
				//멤버 id 가져오기 
				HttpSession session = request.getSession();

				String id=((LoginVO)session.getAttribute("login")).getId();
				
				switch (uri) {
				case "/order/list.do":
					PageObject pageObject = PageObject.getInstance(request);
					// 리스트를 담아오는 request
					request.setAttribute("list", Execute.run(orderListService, pageObject));
					System.out.println(orderListService);
					request.setAttribute("pageObject", pageObject);
					jsp = "order/list";
					break;
				case "/order/view.do":
					String noStr = request.getParameter("orderNo");
					long no = Long.parseLong(noStr);
					// 데이터 처리 -> request에 담는다. -> jsp에서 꺼내 쓴다. EL 객체 사용
					System.out.println(no);
					OrderVO viewVO 
					= (OrderVO) Execute.run(orderViewService, no);
					// 내용 줄바꿈 처리
					
					request.setAttribute("vo", viewVO); // ${vo }로 찾아서 사용한다.
					jsp = "order/view";
					break;	
					
				case "/order/write.do":
					if (request.getMethod().equals("GET")) {
						OrderVO wOrderVO = new OrderVO();
						ProductVO WproductVO = new ProductVO();
						long productno = Long.parseLong(request.getParameter("productno"));
						int quantity = Integer.parseInt(request.getParameter("quantity"));
						int price = Integer.parseInt(request.getParameter("price"));
						
						wOrderVO.setProductName(request.getParameter("name"));
						wOrderVO.setProductNo(productno);
						wOrderVO.setQuantity(quantity);
						wOrderVO.setTotalPrice(price*quantity);
						
						OrderVO vo = new OrderVO();
					
						
						vo.setId(id);
						int mileage = (int) Execute.run(orderSearchMService, id);
						
						 MemberVO mVo= new MemberVO();
						 mVo.setMileage(mileage);
						List<OrderVO> revList = (List<OrderVO>) Execute.run(orderSearchRevService,vo);
						Object[] objs = {wOrderVO,revList,mVo};
						request.setAttribute("list", objs);
						jsp = "/order/write";
				} else {
						String productNoSre = request.getParameter("productno");
						long productNo = Long.parseLong(productNoSre);
						String priceStr = request.getParameter("totalPrice");
						long totalPrice = Long.parseLong(priceStr);
						String quantityStr = request.getParameter("quantity");
						long quantity = Long.parseLong(quantityStr);
						String revNoStr = request.getParameter("revNo");
						long revNo = Long.parseLong(revNoStr);
						
						// 데이터 수집
						OrderVO writeVO = new OrderVO();
						writeVO.setRevNo(revNo);
						writeVO.setProductNo(productNo);
						writeVO.setOrderStatus(request.getParameter("orderstatus"));
						writeVO.setId(id);
						writeVO.setOrderName(request.getParameter("productName"));
						writeVO.setPay(request.getParameter("pay"));
						writeVO.setQuantity(quantity);
						writeVO.setTotalPrice(totalPrice);
						System.out.println("ControllerwriteVO : " + writeVO);
						Execute.run(orderOrderService, writeVO);
						
						// 마일리지 사용
						String mileage = request.getParameter("mileage"); // 마일리지 사용금액 가져오기
						if(!mileage.equals("") && !mileage.equals("0")) { // 마일리지 사용금액이 0이 아닌경우
							MileageVO mVO = new MileageVO();
							// 마일리지 금액 저장
							mVO.setUmoney(Integer.parseInt(mileage));
							// 아이디 저장
							mVO.setId(((LoginVO)session.getAttribute("login")).getId());
							
							// 마일리지 사용 실행
							Execute.run(MileageUseInsertService, new Object[] {mVO, 1});
							
							LoginVO loginVO = (LoginVO) session.getAttribute("login");
							// 마일리지 사용금액 세션에서 차감후 저장
							int useM = loginVO.getMileage()-Integer.parseInt(mileage);
							if (useM <=0 ) loginVO.setMileage(0);
							else loginVO.setMileage(useM);
							// 세션에 다시 저장
							session.setAttribute("login", loginVO);
							
						} // end of if
						
						jsp = "redirect:list.do";
					}
					break;
				case "/order/update.do":
				
				    String orderNoStr1 = request.getParameter("orderNo");
				    long orderNo = Long.parseLong(orderNoStr1);
				    

				    if (request.getMethod().equals("GET")) {
				        // 데이터 처리
				        jsp = "/order/update";
				    } else {
				        // 데이터 수집
				       OrderVO updateVO = new OrderVO();
				        updateVO.setOrderNo(orderNo);
				        updateVO.setOrderStatus(request.getParameter("orderStatus"));

				        Execute.run(orderUpdateService, updateVO);
				        System.out.println(updateVO);
				        jsp = "redirect:list.do?orderNo=" + orderNo;
				    }
				    break;

				case "/order/delete.do":
				    String orderNoStr = request.getParameter("orderNo");
				    long deleteNo = Long.parseLong(orderNoStr);
				    
				    // 마일리지 사용 취소
				    String mileage = request.getParameter("mileage"); // 마일리지 사용금액 가져오기
				    if(!mileage.equals("") && !mileage.equals("0")) { // 마일리지 사용 0이 아니면 실행
					    MileageVO deleteVO = new MileageVO();
					    // 아이디 가져오기
					    deleteVO.setId(((LoginVO) session.getAttribute("login")).getId());
					    // 주문번호 저장
					    deleteVO.setOrderNo(Integer.parseInt(orderNoStr));
					    // 마일리지 사용 취소 실행
					    Execute.run(mileageUpdateService, deleteVO);
					    
					    LoginVO loginVO = (LoginVO) session.getAttribute("login");
						// 마일리지 사용금액 세션 마일리지금액에 더한 후 저장
						int useM = loginVO.getMileage()+Integer.parseInt(mileage);
						loginVO.setMileage(useM);
						// 세션에 다시 저장
						session.setAttribute("login", loginVO);
					    
				    } // end of if
				    
				    Execute.run(orderDeleteService, deleteNo);
				    jsp = "redirect:list.do";
				    break;
				default:
					request.getSession().setAttribute("uri", uri);
					jsp = "redirect:/error/404.do";
					break;
				}
				return jsp;
			}
			
}
