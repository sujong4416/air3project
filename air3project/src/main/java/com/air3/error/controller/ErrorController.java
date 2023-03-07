package com.air3.error.controller;

import javax.servlet.http.HttpServletRequest;

public class ErrorController {

	// 실행 메서드 -> 리턴 String 데이터 : jsp 또는 url 정보가 된다.
	public String execute(HttpServletRequest request) throws Exception{
		System.out.println("ErrorController.execute().request : "+request);
		
		// 어떤 요청이 왔는지 확인
		String uri = request.getRequestURI();
		String jsp = null;
		
		// 요청에 따라 처리
		switch (uri) {
		case "/error/404.do": 

			jsp = "/error/404";
			break;
			
		case "/error/500.do": 

			jsp = "/error/500";
			break;
			
		case "/error/loginError.do": 
			
			jsp = "/error/loginError";
			break;
			
		case "/error/authError.do": 
			
			jsp = "/error/authError";
			break;
			
		default:
			// urㅣ이 바뀌지 않는다.
//			jsp = "error/404";
			
			// urㅣ이 바뀌게 된다.
			request.getSession().setAttribute("uri", uri);
			jsp = "redirect:/error/404.do";
		} // end of switch
		
		return jsp;
		
	} // end of execute()
}