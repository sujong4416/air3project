package com.air3.cart.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.air3.cart.vo.CartVO;
import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.air3.member.vo.LoginVO;
import com.air3.member.vo.MemberVO;
import com.air3.mileage.vo.MileageVO;
import com.air3.order.vo.OrderVO;
import com.air3.product.vo.ProductVO;

public class CartController {
	// private 변수로 BoardListService... 등등
	private ServiceInterface addcartService;
	private ServiceInterface cartListService;
	private ServiceInterface cartList2Service;
	private ServiceInterface cartUpdateService;
	private ServiceInterface cartDeleteService;
	private ServiceInterface cartOrderService;
	private ServiceInterface cartSearchRevService;
	private ServiceInterface mileageUseInsertService;
	private ServiceInterface mileageUpdateService;
	private ServiceInterface deleteService;
	
	
	
	// setter를 만들어서 생성된 service를 받는다.
		public void setAddcartService(ServiceInterface addcartService) {
			this.addcartService = addcartService;
		}
		public void setCartListService(ServiceInterface cartListService) {
			this.cartListService = cartListService;
		}
		public void setCartList2Service(ServiceInterface cartList2Service) {
			this.cartList2Service = cartList2Service;
		}
	
		public void setCartUpdateService(ServiceInterface cartUpdateService) {
			this.cartUpdateService = cartUpdateService;
		}
		
		public void setCartDeleteService(ServiceInterface cartDeleteService) {
			this.cartDeleteService = cartDeleteService;
		}
		public void setCartOrderService(ServiceInterface cartOrderService) {
			this.cartOrderService = cartOrderService;
		}
		public void setCartSearchRevService(ServiceInterface cartSearchRevService) {
			this.cartSearchRevService = cartSearchRevService;
		}
		public void setMileageUseInsertService(ServiceInterface mileageUseInsertService) {
			this.mileageUseInsertService = mileageUseInsertService;
		}
		public void setMileageUpdateService(ServiceInterface mileageUpdateService) {
			this.mileageUpdateService = mileageUpdateService;
		}
		public void setDeleteService(ServiceInterface deleteService) {
			this.deleteService = deleteService;
		}

		public String execute(HttpServletRequest request) throws Exception {
				System.out.println("CartController.execute().request" + request);
			// 어떤 요청을 하는지
			String uri = request.getRequestURI();
			// get , post 알기 위한 메서드
			String method = request.getMethod();
			String jsp = null;
			//멤버 id 가져오기 
			HttpSession session = request.getSession();
			
						
			switch (uri) {
			case "/cart/addcart.do":
				System.out.println(request.getParameter("productno"));
				System.out.println(request.getParameter("prQuantity"));
				System.out.println(request.getParameter("price"));
				String id2=((LoginVO)session.getAttribute("login")).getId();

					String productNostr = request.getParameter("productno");
					long product = Long.parseLong(productNostr);
					String Qstr = request.getParameter("prQuantity");
					long  quantity = Long.parseLong(Qstr);
					String priceStr = request.getParameter("price");
					long price = Long.parseLong(priceStr);
					// 데이터 수집
					CartVO addcart = new CartVO();
					addcart.setProductNo(product);
					addcart.setQuantity(quantity);
					addcart.setName(request.getParameter("name"));
					addcart.setPrice(price);
					addcart.setImg(request.getParameter("img"));
					addcart.setId(id2);
					request.setAttribute("result", Execute.run(addcartService, addcart));
					jsp = "redirect:list.do";
			
			case "/cart/list.do":
				
				 id2=((LoginVO)session.getAttribute("login")).getId();

				 
				 request.setAttribute("list", Execute.run(cartListService,id2));
				jsp = "cart/list";
				break;
			case "/cart/update.do":
			    String cartNoStr = request.getParameter("cartNo");
			    long cartNo = Long.parseLong(cartNoStr);
			    String quantityStr = request.getParameter("quantity");
			    long updatequantity = Long.parseLong(quantityStr);

			    if (request.getMethod().equals("GET")) {
			        // 데이터 처리
			        jsp = "/cart/update";
			    } else {
			        // 데이터 수집
			        CartVO updateVO = new CartVO();
			        updateVO.setCartNo(cartNo);
			        updateVO.setQuantity(updatequantity);

			        Execute.run(cartUpdateService, updateVO);
			        System.out.println(updateVO);
			        jsp = "redirect:list.do?cartNo=" + cartNo + "&quantity=" + updatequantity;
			    }
			    break;

			case "/cart/delete.do":
				    String deleteStr = request.getParameter("cartNo");
					long deleteNo = Long.parseLong(deleteStr);

					Execute.run(cartDeleteService, deleteNo);
					jsp = "redirect:list.do";

				break;
			case "/cart/cartOrder.do":
				String[] cartNoList = request.getParameterValues("cartNo[]");
				System.out.println("cartNoList"+ cartNoList.length);
				String a = cartNoList[0];
				System.out.println(a);
				
				List<CartVO> list = null;
				for(int i=0;i<cartNoList.length;i++ ) {
					
					if(list == null) list = new ArrayList<>();
					
					CartVO readyvo = (CartVO) Execute.run(cartList2Service,cartNoList[i]);
					readyvo.setTotalPrice(readyvo.getQuantity()*readyvo.getPrice());   
					
					list.add(readyvo);
				}
				//항공 예약 번호 가져오기.
				 id2=((LoginVO)session.getAttribute("login")).getId();
				List<CartVO> list2 = (List<CartVO>) Execute.run(cartSearchRevService, id2);
				Object[] obj = {list,list2};

				request.setAttribute("list", obj);
				
				jsp = "/cart/cartOrder";
				break;
			case "/cart/buyAll.do":
				
			
					String[] bCartNoList = request.getParameterValues("cartNo[]");
					String[] bProductList = request.getParameterValues("productNo[]");
					String[] nameList = request.getParameterValues("name[]");
					String[] quantityList = request.getParameterValues("quantity[]");
					String[] priceList = request.getParameterValues("price[]");
					String[] totalPriceList = request.getParameterValues("totalPrice[]");
					String orderStatus = request.getParameter("orderstatus");
					String pay = request.getParameter("PAY");
					long use=Long.parseLong(request.getParameter("mileage")) ;

					long revNo =Long.parseLong(request.getParameter("revNo")) ;
					
					System.out.println("CartController.execute().bCartNoList : "+Arrays.toString(bCartNoList));
					System.out.println("CartController.execute().bProductList : "+Arrays.toString(bProductList));
					System.out.println("CartController.execute().name : "+Arrays.toString(nameList));
					System.out.println("CartController.execute().quantityList : "+Arrays.toString(quantityList));
					System.out.println("CartController.execute().priceList : "+Arrays.toString(priceList));
					System.out.println("CartController.execute().totalPriceList : "+Arrays.toString(totalPriceList));
					System.out.println("CartController.execute().orderStatus : "+orderStatus);
					System.out.println("CartController.execute().pay : "+pay);
					System.out.println("CartController.execute().revNoStr : "+revNo);
					System.out.println("-----------------"+use);
					String names = String.join("-", nameList);
					System.out.println("***********"+names);
					System.out.println("**********"+names.split("-", 2)[0]);
					CartVO buyVO = new CartVO();
					buyVO.setQuantity(nameList.length);
					buyVO.setName(names.split("-", 2)[0]);
					buyVO.setbCartNoList(bCartNoList);
					buyVO.setbProductList(bProductList);
					buyVO.setNameList(new String[]{names});
					buyVO.setQuantityList(quantityList);
					buyVO.setPriceList(priceList);
					long totalPrice=0;
					for (String price1 : priceList) {
					    totalPrice += Long.parseLong(price1);
					}
				
					buyVO.setTotalPrice(totalPrice);
					buyVO.setOrderStatus(orderStatus);
					buyVO.setPay(pay);
					buyVO.setRevNo(revNo);
					buyVO.setUse(use);
					buyVO.setId(((LoginVO)session.getAttribute("login")).getId());

					System.out.println("======================"+buyVO.getNameList().toString());
					System.out.println("-----------"+totalPrice);
					Execute.run(cartOrderService, buyVO);
				
					
					String mileage = request.getParameter("mileage"); // 마일리지 사용금액 가져오기
					if(!mileage.equals("") && !mileage.equals("0")) { // 마일리지 사용금액이 0이 아닌경우
						MileageVO mVO = new MileageVO();
						// 마일리지 금액 저장
						mVO.setUmoney(Integer.parseInt(mileage));
						// 아이디 저장
						mVO.setId(((LoginVO)session.getAttribute("login")).getId());
						
						// 마일리지 사용 실행
						Execute.run(mileageUseInsertService, new Object[] {mVO, 1});
						
						LoginVO loginVO = (LoginVO) session.getAttribute("login");
						// 마일리지 사용금액 세션에서 차감후 저장
						int useM = loginVO.getMileage()-Integer.parseInt(mileage);
						if (useM <=0 ) loginVO.setMileage(0);
						else loginVO.setMileage(useM);
						// 세션에 다시 저장
						session.setAttribute("login", loginVO);
						
					} // end of if
					
					//주문된 장바구니리스트 삭제하기
					jsp = "redirect:/order/list.do";

				

				break;
		

		default:
			request.getSession().setAttribute("uri", uri);
			jsp = "redirect:/error/404.do";
			break;
		}//end of switch
		return jsp;

	}//end of execute()


}//end of CartController
