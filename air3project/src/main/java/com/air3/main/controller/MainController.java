package com.air3.main.controller;

import javax.servlet.http.HttpServletRequest;

import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.webjjang.util.PageObject;

public class MainController {

//	// 리스트만 가져오는 서비스 변수 지정
	private ServiceInterface serviceInfoListService;
	private ServiceInterface productListService;

//	//setter -> 조립은 Init 클래스에서
	public void setServiceInfoListService(ServiceInterface serviceInfoListService) {
		this.serviceInfoListService = serviceInfoListService;
	}
	public void setProductListService(ServiceInterface productListService) {
		this.productListService = productListService;
	}

//	
//	// 실행 메서드 -> 리턴 String 데이터를 jsp 또는 url 정보가 된다.
	public String execute(HttpServletRequest request) throws Exception{
		String jsp = "main/main";
		System.out.println("1111111111111111111111111111111");
//		
		// 메인에 표시할 공지사항과 게시판의 데이터 개수 - 5
		PageObject pageObject = new PageObject(1, 5);
		request.setAttribute("Infolist", Execute.run(serviceInfoListService, pageObject));
//		request.setAttribute("Productlist", Execute.run(productListService, pageObject));
	System.out.println("2222222222222222222222222222222222222");



		return jsp;
	}
	
	

}
