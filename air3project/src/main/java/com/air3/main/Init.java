package com.air3.main;

import java.util.HashMap;
import java.util.Map;

import com.air3.cart.controller.CartController;
import com.air3.cart.dao.CartDAOImpl;
import com.air3.cart.service.AddCartServiceImpl;
//import com.air3.cart.service.AddCartServiceImpl;
import com.air3.cart.service.CartDeleteServiceImpl;
import com.air3.cart.service.CartList2ServiceImpl;
import com.air3.cart.service.CartListServiceImpl;
import com.air3.cart.service.CartOrderServiceImpl;
import com.air3.cart.service.CartSearchRevServiceImpl;
import com.air3.cart.service.CartUpdateServiceImpl;

import com.air3.craftInf.DAO.CraftInfDAOImpl;
import com.air3.craftInf.controller.CraftInfController;
import com.air3.craftInf.service.CraftInfAirbusListServiceImpl;
import com.air3.craftInf.service.CraftInfDeleteServiceImpl;
import com.air3.craftInf.service.CraftInfUpdateImage2ServiceImpl;
import com.air3.craftInf.service.CraftInfUpdateImageServiceImpl;
import com.air3.craftInf.service.CraftInfVoingListServiceImpl;
import com.air3.craftInf.service.CraftInfUpdateServiceImpl;
import com.air3.craftInf.service.CraftInfViewServiceImpl;
import com.air3.craftInf.service.CraftInfWriteServiceImpl;
import com.air3.error.controller.ErrorController;
import com.air3.flightInf.DAO.FlightInfDAOImpl;
import com.air3.flightInf.controller.FlightInfController;
import com.air3.flightInf.service.FlightInfCraftListServiceImpl;
import com.air3.flightInf.service.FlightInfDeleteServiceImpl;
import com.air3.flightInf.service.FlightInfFlistServiceImpl;
import com.air3.flightInf.service.FlightInfListServiceImpl;
import com.air3.flightInf.service.FlightInfStationListServiceImpl;
import com.air3.flightInf.service.FlightInfUpdateServiceImpl;
import com.air3.flightInf.service.FlightInfViewServiceImpl;
import com.air3.flightInf.service.FlightInfWriteServiceImpl;
import com.air3.main.controller.MainController;
import com.air3.member.controller.MemberController;
import com.air3.member.dao.MemberDAOImpl;
import com.air3.member.service.*;
import com.air3.mileage.controller.MileageController;
import com.air3.mileage.dao.MileageDAOImpl;
import com.air3.mileage.service.MileageDetailInsertServiceImpl;
import com.air3.mileage.service.MileageInsertServiceImpl;
import com.air3.mileage.service.MileageSearchOrdNoServiceImpl;
import com.air3.mileage.service.MileageSearchRevNoServiceImpl;
import com.air3.mileage.service.MileageUpdateServiceImpl;
import com.air3.mileage.service.MileageUseInsertServiceImpl;
import com.air3.mileage.service.MileageViewDetailServiceImpl;
import com.air3.mileage.service.MileageViewDetailUseServiceImpl;
import com.air3.mileage.service.MileageViewServiceImpl;
import com.air3.order.controller.OrderController;
import com.air3.order.dao.OrderDAOImpl;
import com.air3.order.service.OrderDeleteServiceImpl;
import com.air3.order.service.OrderDetailServiceImpl;
import com.air3.order.service.OrderListServiceImpl;
import com.air3.order.service.OrderOrderServiceImpl;
import com.air3.order.service.OrderSearchMServiceImpl;
import com.air3.order.service.OrderSearchRevServiceImpl;
import com.air3.order.service.OrderUpdateServiceImpl;
import com.air3.order.service.OrderViewServiceImpl;

import com.air3.product.controller.ProductController;
import com.air3.product.dao.ProductDAOImpl;
import com.air3.product.service.ProductDeleteServiceImpl;
import com.air3.product.service.ProductImageUpdateServiceImpl;
import com.air3.product.service.ProductListServiceImpl;
import com.air3.product.service.ProductUpdateServiceImpl;
import com.air3.product.service.ProductViewServiceImpl;
import com.air3.product.service.ProductWriteServiceImpl;
import com.air3.reservation.controller.ReservationController;
import com.air3.reservation.dao.PayReservationDAOImpl;
import com.air3.reservation.dao.ReservationDAOImpl;
import com.air3.reservation.service.FlightStartListServiceImpl;
import com.air3.reservation.service.ReservationDeleteService;
import com.air3.reservation.service.ReservationFSViewServiceImpl;
import com.air3.reservation.service.ReservationInfoWirteService;
import com.air3.reservation.service.ReservationPayService;
import com.air3.reservation.service.ReservationListService;
import com.air3.reservation.service.ReservationUpdateService;
import com.air3.reservation.service.ReservationViewService;
import com.air3.seat.controller.SeatController;
import com.air3.seat.dao.SeatDAOImpl;
import com.air3.seat.service.SeatListServiceImpl;
import com.air3.serviceInfo.controller.ServiceInfoController;
import com.air3.serviceInfo.dao.ServiceInfoDAOImpl;
import com.air3.serviceInfo.service.ServiceInfoDeleteServiceImpl;
import com.air3.serviceInfo.service.ServiceInfoListServiceImpl;
import com.air3.serviceInfo.service.ServiceInfoUpdateImageServiceImpl;
import com.air3.serviceInfo.service.ServiceInfoUpdateServiceImpl;
import com.air3.serviceInfo.service.ServiceInfoViewServiceImpl;
import com.air3.serviceInfo.service.ServiceInfoWriteServiceImpl;


// 서버가 실행하게 되면 DispatcherServlet.init()가 실행이 되면 거기서 호출해서 실행되는 클래스
//  -> 객체 생성하고 필요한 객체를 setter나 생성자를 이용해서 넣어준다.
public class Init {
	
	// Controller 저장변수
	private static Map<String, Object> controllerMap = new HashMap<>();
	private static Map<String, ServiceInterface> serviceMap = new HashMap<>();
	private static Map<String, Object> daoMap = new HashMap<>();
	
	// 객체 생성한다. 필요한 객체를 넣어준다.(조립)
	public static void init() {
		
		// Controller 생성 
		controllerMap.put("craftInfController", new CraftInfController());
		controllerMap.put("flightInfController", new FlightInfController());
		controllerMap.put("reservationController", new ReservationController());
		controllerMap.put("productController", new ProductController());
		controllerMap.put("orderController", new OrderController());
		controllerMap.put("cartController", new CartController());
		controllerMap.put("memberController", new MemberController());
		controllerMap.put("mileageController", new MileageController());
		controllerMap.put("serviceInfoController", new ServiceInfoController());
		controllerMap.put("seatController", new SeatController());
		controllerMap.put("errorController", new ErrorController());
		controllerMap.put("mainController", new MainController());
		
		
		// DAO 생성 
		daoMap.put("craftInfDAO", new CraftInfDAOImpl());
		daoMap.put("flightInfDAO", new FlightInfDAOImpl());
		daoMap.put("reservationDAO", new ReservationDAOImpl());
		daoMap.put("payReservationDAO", new PayReservationDAOImpl());
		daoMap.put("productDAO", new ProductDAOImpl());
		daoMap.put("orderDAO", new OrderDAOImpl());
		daoMap.put("cartDAO", new CartDAOImpl());
		daoMap.put("memberDAO", new MemberDAOImpl());
		daoMap.put("mileageDAO", new MileageDAOImpl());
		daoMap.put("serviceInfoDAO", new ServiceInfoDAOImpl());
		daoMap.put("seatDAO", new SeatDAOImpl());

		
		// Service 생성 
		// craftInf Service 생성 ----------------------------------------------------------------------
		serviceMap.put("craftInfVoingListServiceImpl", new CraftInfVoingListServiceImpl());
		serviceMap.put("craftInfAirbusListServiceImpl", new CraftInfAirbusListServiceImpl());
		serviceMap.put("craftInfViewServiceImpl", new CraftInfViewServiceImpl());
		serviceMap.put("craftInfWriteServiceImpl", new CraftInfWriteServiceImpl());
		serviceMap.put("craftInfUpdateServiceImpl", new CraftInfUpdateServiceImpl());
		serviceMap.put("craftInfDeleteServiceImpl", new CraftInfDeleteServiceImpl());
		serviceMap.put("craftInfUpdateImageServiceImpl", new CraftInfUpdateImageServiceImpl());
		serviceMap.put("craftInfUpdateImage2ServiceImpl", new CraftInfUpdateImage2ServiceImpl());
		// flightInf Service 생성 ----------------------------------------------------------------------
		serviceMap.put("flightInfListServiceImpl", new FlightInfListServiceImpl());
		serviceMap.put("flightInfFlistServiceImpl", new FlightInfFlistServiceImpl());
		serviceMap.put("flightInfViewServiceImpl", new FlightInfViewServiceImpl());
		serviceMap.put("flightInfWriteServiceImpl", new FlightInfWriteServiceImpl());
		serviceMap.put("flightInfUpdateServiceImpl", new FlightInfUpdateServiceImpl());
		serviceMap.put("flightInfDeleteServiceImpl", new FlightInfDeleteServiceImpl());
		serviceMap.put("flightInfCraftListServiceImpl", new FlightInfCraftListServiceImpl());
		serviceMap.put("flightInfStationListServiceImpl", new FlightInfStationListServiceImpl());

		// reservation Service 생성 ----------------------------------------------------------------------
		serviceMap.put("reservationListServiceImpl", new ReservationListService());
		serviceMap.put("reservationInfoWriteServiceImpl", new ReservationInfoWirteService());
		serviceMap.put("reservationPayServiceImpl", new ReservationPayService());
		serviceMap.put("reservationViewServiceImpl", new ReservationViewService());
		serviceMap.put("reservationUpdateServiceImpl", new ReservationUpdateService());
		serviceMap.put("reservationDeleteServiceImpl", new ReservationDeleteService());
		serviceMap.put("flightStartListServiceImpl", new FlightStartListServiceImpl());
		serviceMap.put("flightFSViewServiceImpl", new ReservationFSViewServiceImpl());

		// product Service 생성 ----------------------------------------------------------------------
		serviceMap.put("productListServiceImpl", new ProductListServiceImpl());
		serviceMap.put("productViewServiceImpl", new ProductViewServiceImpl());
		serviceMap.put("productWriteServiceImpl", new ProductWriteServiceImpl());
		serviceMap.put("productUpdateImageServiceImpl", new ProductImageUpdateServiceImpl());
		serviceMap.put("productUpdateServiceImpl", new ProductUpdateServiceImpl());
		serviceMap.put("productDeleteServiceImpl", new ProductDeleteServiceImpl());
		
		// order Service 생성 ----------------------------------------------------------------------
		serviceMap.put("orderListServiceImpl", new OrderListServiceImpl());
		serviceMap.put("orderViewServiceImpl", new OrderViewServiceImpl());
		serviceMap.put("orderOrderServiceImpl", new OrderOrderServiceImpl());
		serviceMap.put("orderUpdateServiceImpl", new OrderUpdateServiceImpl());
		serviceMap.put("orderDeleteServiceImpl", new OrderDeleteServiceImpl());
		serviceMap.put("orderDetailServiceImpl", new OrderDetailServiceImpl());
		serviceMap.put("orderSearchRevServiceImpl", new OrderSearchRevServiceImpl());
		serviceMap.put("orderSearchMServiceImpl", new OrderSearchMServiceImpl());
		
		// cart Service 생성 ----------------------------------------------------------------------
		serviceMap.put("cartListServiceImpl", new CartListServiceImpl());
		serviceMap.put("cartList2ServiceImpl", new CartList2ServiceImpl());
		serviceMap.put("addCartServiceImpl", new AddCartServiceImpl());
		serviceMap.put("cartUpdateServiceImpl", new CartUpdateServiceImpl());
		serviceMap.put("cartDeleteServiceImpl", new CartDeleteServiceImpl());
		serviceMap.put("cartOrderServiceImpl", new CartOrderServiceImpl());
		serviceMap.put("cartSearchRevServiceImpl", new CartSearchRevServiceImpl());

		// member Service 생성 ----------------------------------------------------------------------
		serviceMap.put("memberLoginServiceImpl", new MemberLoginServiceImpl());
		serviceMap.put("memberListServiceImpl", new MemberListServiceImpl());
		serviceMap.put("memberUpdateGradeServiceImpl", new MemberUpdateGradeServiceImpl());
		serviceMap.put("memberViewServiceImpl", new MemberViewServiceImpl());
		serviceMap.put("memberFindIdServiceImpl", new MemberFindIdServiceImpl());
		serviceMap.put("memberFindPwServiceImpl", new MemberFindPwServiceImpl());
		serviceMap.put("memberSignUpServiceImpl", new MemberSignUpServiceImpl());
		serviceMap.put("memberSearchIdServiceImpl", new MemberSearchIdServiceImpl());
		serviceMap.put("memberUpdateServiceImpl", new MemberUpdateServiceImpl());
		serviceMap.put("memberUpdateMemberServiceImpl", new MemberUpdateMemberServiceImpl());
		serviceMap.put("memberUpdatePwServiceImpl", new MemberUpdatePwServiceImpl());
		serviceMap.put("memberDeleteServiceImpl", new MemberDeleteServiceImpl());

		// mileage Service 생성 ----------------------------------------------------------------------
		serviceMap.put("mileageInsertServiceImpl", new MileageInsertServiceImpl());
		serviceMap.put("mileageUseInsertServiceImpl", new MileageUseInsertServiceImpl());
		serviceMap.put("mileageUpdateServiceImpl", new MileageUpdateServiceImpl());
		serviceMap.put("mileageDetailInsertServiceImpl", new MileageDetailInsertServiceImpl());
		serviceMap.put("mileageSearchRevNoServiceImpl", new MileageSearchRevNoServiceImpl());
		serviceMap.put("mileageSearchOrdNoServiceImpl", new MileageSearchOrdNoServiceImpl());
		serviceMap.put("mileageViewServiceImpl", new MileageViewServiceImpl());
		serviceMap.put("mileageViewDetailServiceImpl", new MileageViewDetailServiceImpl());
		serviceMap.put("mileageViewDetailUseServiceImpl", new MileageViewDetailUseServiceImpl());
		
		// serviceInfo Service 생성 ----------------------------------------------------------------------
		serviceMap.put("serviceInfoListServiceImpl", new ServiceInfoListServiceImpl());
		serviceMap.put("serviceInfoViewServiceImpl", new ServiceInfoViewServiceImpl());
		serviceMap.put("serviceInfoWriteServiceImpl", new ServiceInfoWriteServiceImpl());
		serviceMap.put("serviceInfoUpdateServiceImpl", new ServiceInfoUpdateServiceImpl());
		serviceMap.put("serviceInfoUpdateImageServiceImpl", new ServiceInfoUpdateImageServiceImpl());
		serviceMap.put("serviceInfoDeleteServiceImpl", new ServiceInfoDeleteServiceImpl());

		// seat Service 생성 ----------------------------------------------------------------------
		serviceMap.put("seatListServiceImpl", new SeatListServiceImpl());
		
		
		
		// dao -> service : 조립 
		// craftInf dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("craftInfVoingListServiceImpl").setDao(daoMap.get("craftInfDAO"));
		serviceMap.get("craftInfAirbusListServiceImpl").setDao(daoMap.get("craftInfDAO"));
		serviceMap.get("craftInfViewServiceImpl").setDao(daoMap.get("craftInfDAO"));
		serviceMap.get("craftInfWriteServiceImpl").setDao(daoMap.get("craftInfDAO"));
		serviceMap.get("craftInfUpdateServiceImpl").setDao(daoMap.get("craftInfDAO"));
		serviceMap.get("craftInfDeleteServiceImpl").setDao(daoMap.get("craftInfDAO"));
		serviceMap.get("craftInfUpdateImageServiceImpl").setDao(daoMap.get("craftInfDAO"));
		serviceMap.get("craftInfUpdateImage2ServiceImpl").setDao(daoMap.get("craftInfDAO"));
		
		// flightInf dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("flightInfListServiceImpl").setDao(daoMap.get("flightInfDAO"));
		serviceMap.get("flightInfFlistServiceImpl").setDao(daoMap.get("flightInfDAO"));
		serviceMap.get("flightInfWriteServiceImpl").setDao(daoMap.get("flightInfDAO"));
		serviceMap.get("flightInfViewServiceImpl").setDao(daoMap.get("flightInfDAO"));
		serviceMap.get("flightInfUpdateServiceImpl").setDao(daoMap.get("flightInfDAO"));
		serviceMap.get("flightInfDeleteServiceImpl").setDao(daoMap.get("flightInfDAO"));
		serviceMap.get("flightInfCraftListServiceImpl").setDao(daoMap.get("flightInfDAO"));
		serviceMap.get("flightInfStationListServiceImpl").setDao(daoMap.get("flightInfDAO"));
		
		// reservation dao -> Service 조립 ----------------------------------------------------------------------
		
		serviceMap.get("reservationInfoWriteServiceImpl").setDao(daoMap.get("ReservationDAO"));
		serviceMap.get("reservationPayServiceImpl").setDao(daoMap.get("payReservationDAO"));
		serviceMap.get("reservationViewServiceImpl").setDao(daoMap.get("payReservationDAO"));
		serviceMap.get("reservationUpdateServiceImpl").setDao(daoMap.get("payReservationDAO"));
		serviceMap.get("reservationDeleteServiceImpl").setDao(daoMap.get("payReservationDAO"));
		serviceMap.get("reservationListServiceImpl").setDao(daoMap.get("payReservationDAO"));
		serviceMap.get("flightStartListServiceImpl").setDao(daoMap.get("reservationDAO"));
		serviceMap.get("flightFSViewServiceImpl").setDao(daoMap.get("reservationDAO"));
		
		// product dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("productListServiceImpl").setDao(daoMap.get("productDAO"));
		serviceMap.get("productViewServiceImpl").setDao(daoMap.get("productDAO"));
		serviceMap.get("productWriteServiceImpl").setDao(daoMap.get("productDAO"));
		serviceMap.get("productUpdateImageServiceImpl").setDao(daoMap.get("productDAO"));
		serviceMap.get("productUpdateServiceImpl").setDao(daoMap.get("productDAO"));
		serviceMap.get("productDeleteServiceImpl").setDao(daoMap.get("productDAO"));

		// order dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("orderListServiceImpl").setDao(daoMap.get("orderDAO"));
		serviceMap.get("orderViewServiceImpl").setDao(daoMap.get("orderDAO"));
		serviceMap.get("orderOrderServiceImpl").setDao(daoMap.get("orderDAO"));
		serviceMap.get("orderUpdateServiceImpl").setDao(daoMap.get("orderDAO"));
		serviceMap.get("orderDeleteServiceImpl").setDao(daoMap.get("orderDAO"));
		serviceMap.get("orderDetailServiceImpl").setDao(daoMap.get("orderDAO"));
		serviceMap.get("orderSearchRevServiceImpl").setDao(daoMap.get("orderDAO"));
		serviceMap.get("orderSearchMServiceImpl").setDao(daoMap.get("orderDAO"));
		
		// cart dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("cartListServiceImpl").setDao(daoMap.get("cartDAO"));
		serviceMap.get("cartList2ServiceImpl").setDao(daoMap.get("cartDAO"));
		serviceMap.get("addCartServiceImpl").setDao(daoMap.get("cartDAO"));
		serviceMap.get("cartUpdateServiceImpl").setDao(daoMap.get("cartDAO"));
		serviceMap.get("cartDeleteServiceImpl").setDao(daoMap.get("cartDAO"));
		serviceMap.get("cartOrderServiceImpl").setDao(daoMap.get("cartDAO"));
		serviceMap.get("cartSearchRevServiceImpl").setDao(daoMap.get("cartDAO"));
		
		
		// member dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("memberLoginServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberListServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberUpdateGradeServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberViewServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberFindIdServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberFindPwServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberSignUpServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberSearchIdServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberUpdateServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberUpdateMemberServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberUpdatePwServiceImpl").setDao(daoMap.get("memberDAO"));
		serviceMap.get("memberDeleteServiceImpl").setDao(daoMap.get("memberDAO"));
		
		// mileage dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("mileageInsertServiceImpl").setDao(daoMap.get("mileageDAO"));
		serviceMap.get("mileageUseInsertServiceImpl").setDao(daoMap.get("mileageDAO"));
		serviceMap.get("mileageUpdateServiceImpl").setDao(daoMap.get("mileageDAO"));
		serviceMap.get("mileageDetailInsertServiceImpl").setDao(daoMap.get("mileageDAO"));
		serviceMap.get("mileageSearchRevNoServiceImpl").setDao(daoMap.get("mileageDAO"));
		serviceMap.get("mileageSearchOrdNoServiceImpl").setDao(daoMap.get("mileageDAO"));
		serviceMap.get("mileageViewServiceImpl").setDao(daoMap.get("mileageDAO"));
		serviceMap.get("mileageViewDetailServiceImpl").setDao(daoMap.get("mileageDAO"));
		serviceMap.get("mileageViewDetailUseServiceImpl").setDao(daoMap.get("mileageDAO"));
		
		// serviceInfo dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("serviceInfoListServiceImpl").setDao(daoMap.get("serviceInfoDAO"));
		serviceMap.get("serviceInfoViewServiceImpl").setDao(daoMap.get("serviceInfoDAO"));
		serviceMap.get("serviceInfoWriteServiceImpl").setDao(daoMap.get("serviceInfoDAO"));
		serviceMap.get("serviceInfoUpdateServiceImpl").setDao(daoMap.get("serviceInfoDAO"));
		serviceMap.get("serviceInfoUpdateImageServiceImpl").setDao(daoMap.get("serviceInfoDAO"));
		serviceMap.get("serviceInfoDeleteServiceImpl").setDao(daoMap.get("serviceInfoDAO"));

		
		// serviceInfo dao -> Service 조립 ----------------------------------------------------------------------
		serviceMap.get("seatListServiceImpl").setDao(daoMap.get("seatDAO"));

		
		
		// service -> controller : 조립 
		// craftInf service -> controller 조립 ----------------------------------------------------------------------
		((CraftInfController) controllerMap.get("craftInfController")).setCraftInfAirbusListService(serviceMap.get("craftInfAirbusListServiceImpl"));
		((CraftInfController) controllerMap.get("craftInfController")).setCraftInfVoingListService(serviceMap.get("craftInfVoingListServiceImpl"));
		((CraftInfController) controllerMap.get("craftInfController")).setCraftInfViewService(serviceMap.get("craftInfViewServiceImpl"));
		((CraftInfController) controllerMap.get("craftInfController")).setCraftInfWriteService(serviceMap.get("craftInfWriteServiceImpl"));
		((CraftInfController) controllerMap.get("craftInfController")).setCraftInfUpdateService(serviceMap.get("craftInfUpdateServiceImpl"));
		((CraftInfController) controllerMap.get("craftInfController")).setCraftInfDeleteService(serviceMap.get("craftInfDeleteServiceImpl"));
		((CraftInfController) controllerMap.get("craftInfController")).setCraftInfUpdateImageService(serviceMap.get("craftInfUpdateImageServiceImpl"));
		((CraftInfController) controllerMap.get("craftInfController")).setCraftInfUpdateImage2Service(serviceMap.get("craftInfUpdateImage2ServiceImpl"));
		

		// flightInf service -> controller 조립 ----------------------------------------------------------------------
		((FlightInfController) controllerMap.get("flightInfController")).setFlightInfListService(serviceMap.get("flightInfListServiceImpl"));
		((FlightInfController) controllerMap.get("flightInfController")).setFlightInfFlistService(serviceMap.get("flightInfFlistServiceImpl"));
		((FlightInfController) controllerMap.get("flightInfController")).setflightInfWriteService(serviceMap.get("flightInfWriteServiceImpl"));
		((FlightInfController) controllerMap.get("flightInfController")).setflightInfViewService(serviceMap.get("flightInfViewServiceImpl"));
		((FlightInfController) controllerMap.get("flightInfController")).setflightInfUpdateService(serviceMap.get("flightInfUpdateServiceImpl"));
		((FlightInfController) controllerMap.get("flightInfController")).setflightInfDeleteService(serviceMap.get("flightInfDeleteServiceImpl"));
		((FlightInfController) controllerMap.get("flightInfController")).setflightInfCraftListService(serviceMap.get("flightInfCraftListServiceImpl"));
		((FlightInfController) controllerMap.get("flightInfController")).setflightInfStationListService(serviceMap.get("flightInfStationListServiceImpl"));
		
		// flightInf service -> controller 조립 ----------------------------------------------------------------------
		((ReservationController) controllerMap.get("reservationController")).setReservationListService(serviceMap.get("reservationListServiceImpl"));
//		((ReservationController) controllerMap.get("reservationController")).setReservationInfoWriteService(serviceMap.get("reservationInfoServiceImpl"));
		((ReservationController) controllerMap.get("reservationController")).setReservationPayService(serviceMap.get("reservationPayServiceImpl"));
		((ReservationController) controllerMap.get("reservationController")).setReservationViewService(serviceMap.get("reservationViewServiceImpl"));
		((ReservationController) controllerMap.get("reservationController")).setReservationUpdateService(serviceMap.get("reservationUpdateServiceImpl"));
		((ReservationController) controllerMap.get("reservationController")).setReservationDeleteService(serviceMap.get("reservationDeleteServiceImpl"));
		((ReservationController) controllerMap.get("reservationController")).setFlightInfListService(serviceMap.get("flightInfListServiceImpl"));
		((ReservationController) controllerMap.get("reservationController")).setFlightStartListService(serviceMap.get("flightStartListServiceImpl"));
		((ReservationController) controllerMap.get("reservationController")).setReservationFSViewService(serviceMap.get("flightFSViewServiceImpl"));
		((ReservationController) controllerMap.get("reservationController")).setMileageUseInsertService(serviceMap.get("mileageUseInsertServiceImpl"));
		((ReservationController)controllerMap.get("reservationController")).setMemberViewService(serviceMap.get("memberViewServiceImpl"));
		//((ReservationController) controllerMap.get("reservationController")).setMileageUpdateService(serviceMap.get("mileageUpdateServiceImpl"));		
	
		// product service -> controller 조립 ----------------------------------------------------------------------
		((ProductController)controllerMap.get("productController")).setProductListService(serviceMap.get("productListServiceImpl"));
		((ProductController)controllerMap.get("productController")).setProductViewService(serviceMap.get("productViewServiceImpl"));
		((ProductController)controllerMap.get("productController")).setProductWriteService(serviceMap.get("productWriteServiceImpl"));
		((ProductController)controllerMap.get("productController")).setProductImageUpdateService(serviceMap.get("productUpdateImageServiceImpl"));
		((ProductController)controllerMap.get("productController")).setProductUpdateService(serviceMap.get("productUpdateServiceImpl"));
		((ProductController)controllerMap.get("productController")).setProductDeleteService(serviceMap.get("productDeleteServiceImpl"));

		// order service -> controller 조립 ----------------------------------------------------------------------
		((OrderController)controllerMap.get("orderController")).setOrderListService(serviceMap.get("orderListServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setOrderViewService(serviceMap.get("orderViewServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setOrderOrderService(serviceMap.get("orderOrderServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setOrderUpdateService(serviceMap.get("orderUpdateServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setOrderDeleteService(serviceMap.get("orderDeleteServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setOrderDetailService(serviceMap.get("orderDetailServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setOrderSearchRevService(serviceMap.get("orderSearchRevServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setOrderSearchMService(serviceMap.get("orderSearchMServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setMileageUseInsertService(serviceMap.get("mileageUseInsertServiceImpl"));
		((OrderController)controllerMap.get("orderController")).setMileageUpdateService(serviceMap.get("mileageUpdateServiceImpl"));
		
		// cart service -> controller 조립 ----------------------------------------------------------------------
		((CartController)controllerMap.get("cartController")).setCartListService(serviceMap.get("cartListServiceImpl"));
		((CartController)controllerMap.get("cartController")).setCartList2Service(serviceMap.get("cartList2ServiceImpl"));
		((CartController)controllerMap.get("cartController")).setAddcartService(serviceMap.get("addCartServiceImpl"));
		((CartController)controllerMap.get("cartController")).setCartUpdateService(serviceMap.get("cartUpdateServiceImpl"));
		((CartController)controllerMap.get("cartController")).setCartDeleteService(serviceMap.get("cartDeleteServiceImpl"));
		((CartController)controllerMap.get("cartController")).setCartOrderService(serviceMap.get("cartOrderServiceImpl"));
		((CartController)controllerMap.get("cartController")).setCartSearchRevService(serviceMap.get("cartSearchRevServiceImpl"));
		((CartController)controllerMap.get("cartController")).setMileageUseInsertService(serviceMap.get("mileageUseInsertServiceImpl"));
		((CartController)controllerMap.get("cartController")).setMileageUpdateService(serviceMap.get("mileageUpdateServiceImpl"));
		((CartController)controllerMap.get("cartController")).setDeleteService(serviceMap.get("deleteServiceImpl"));
	
		// member service -> controller 조립 ----------------------------------------------------------------------
		((MemberController)controllerMap.get("memberController")).setMemberLoginService(serviceMap.get("memberLoginServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberListService(serviceMap.get("memberListServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberUpdateService(serviceMap.get("memberUpdateServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberUpdateMemberService(serviceMap.get("memberUpdateMemberServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberUpdateGradeService(serviceMap.get("memberUpdateGradeServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberViewService(serviceMap.get("memberViewServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberFindIdService(serviceMap.get("memberFindIdServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberFindPwService(serviceMap.get("memberFindPwServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberSignUpService(serviceMap.get("memberSignUpServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberSearchIdService(serviceMap.get("memberSearchIdServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberUpdatePwService(serviceMap.get("memberUpdatePwServiceImpl"));
		((MemberController)controllerMap.get("memberController")).setMemberDeleteService(serviceMap.get("memberDeleteServiceImpl"));
		
		// mileage service -> controller 조립 ----------------------------------------------------------------------
		((MileageController)controllerMap.get("mileageController")).setMileageInsertService(serviceMap.get("mileageInsertServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setMileageUseInsertService(serviceMap.get("mileageUseInsertServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setMileageUpdateService(serviceMap.get("mileageUpdateServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setMileageDetailInsertService(serviceMap.get("mileageDetailInsertServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setMileageSearchRevNoService(serviceMap.get("mileageSearchRevNoServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setMileageSearchOrdNoService(serviceMap.get("mileageSearchOrdNoServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setReservationViewService(serviceMap.get("reservationViewServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setOrderViewService(serviceMap.get("orderViewServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setMileageViewService(serviceMap.get("mileageViewServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setMileageViewDetailService(serviceMap.get("mileageViewDetailServiceImpl"));
		((MileageController)controllerMap.get("mileageController")).setMileageViewDetailUseService(serviceMap.get("mileageViewDetailUseServiceImpl"));
		
		// serivceInfo service -> controller 조립 ----------------------------------------------------------------------
		((ServiceInfoController)controllerMap.get("serviceInfoController")).setServiceInfoListService(serviceMap.get("serviceInfoListServiceImpl"));
		((ServiceInfoController)controllerMap.get("serviceInfoController")).setServiceInfoViewService(serviceMap.get("serviceInfoViewServiceImpl"));
		((ServiceInfoController)controllerMap.get("serviceInfoController")).setServiceInfoWriteService(serviceMap.get("serviceInfoWriteServiceImpl"));
		((ServiceInfoController)controllerMap.get("serviceInfoController")).setServiceInfoUpdateService(serviceMap.get("serviceInfoUpdateServiceImpl"));
		((ServiceInfoController)controllerMap.get("serviceInfoController")).setServiceInfoUpdateImageService(serviceMap.get("serviceInfoUpdateImageServiceImpl"));
		((ServiceInfoController)controllerMap.get("serviceInfoController")).setServiceInfoDeleteService(serviceMap.get("serviceInfoDeleteServiceImpl"));

		
		
		// seat service -> controller 조립 ----------------------------------------------------------------------
		((SeatController) controllerMap.get("seatController")).setCraftInfViewService(serviceMap.get("craftInfViewServiceImpl"));
		((SeatController) controllerMap.get("seatController")).setSeatListService(serviceMap.get("seatListServiceImpl"));
		((SeatController) controllerMap.get("seatController")).setReservationFSViewService(serviceMap.get("flightFSViewServiceImpl"));
		// Main service -> controller 조립 ----------------------------------------------------------------------
		((MainController) controllerMap.get("mainController")).setServiceInfoListService(serviceMap.get("serviceInfoListServiceImpl"));
		((MainController) controllerMap.get("mainController")).setProductListService(serviceMap.get("productListServiceImpl"));
		
	} // end of init()

	// Controller 꺼내가기
	public static Object getController(String key) { 
		return controllerMap.get(key);
	}
	
}
