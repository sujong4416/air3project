package com.air3.product.controller;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.air3.member.service.MemberLoginServiceImpl;
import com.air3.member.vo.LoginVO;
import com.air3.product.vo.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.webjjang.util.PageObject;

public class ProductController {
	// private 변수로 BoardListService... 등등
	private ServiceInterface productListService;
	private ServiceInterface productViewService;
	private ServiceInterface productWriteService;
	private ServiceInterface productUpdateService;
	private ServiceInterface productImageUpdateService;
	private ServiceInterface productDeleteService;

	// setter를 만들어서 생성된 service를 받는다.
	public void setProductListService(ServiceInterface productListService) {
		this.productListService = productListService;
	}

	public void setProductViewService(ServiceInterface productViewService) {
		this.productViewService = productViewService;
	}

	public void setProductWriteService(ServiceInterface productWriteService) {
		this.productWriteService = productWriteService;
	}

	public void setProductUpdateService(ServiceInterface productUpdateService) {
		this.productUpdateService = productUpdateService;
	}

	public void setProductImageUpdateService(ServiceInterface productImageUpdateService) {
		this.productImageUpdateService = productImageUpdateService;
	}

	public void setProductDeleteService(ServiceInterface productDeleteService) {
		this.productDeleteService = productDeleteService;
	}

	public String execute(HttpServletRequest request) throws Exception {
		System.out.println("ProductController.execute().request" + request);
		// 어떤 요청을 하는지
		String uri = request.getRequestURI();
		// get , post 알기 위한 메서드
		String method = request.getMethod();
		System.out.println("ProductController.execute()" + request.getMethod());
		// 파일 저장 위치
		String path = "/upload/product";
		// 실제적인 파일 시스템의 위치가 필요하다.
		String realPath = request.getServletContext().getRealPath(path);
		System.out.println("ProductController.execute().realPath--" + realPath);
		int size = 100 * 1024 * 1024;
		// 이미지 등록할때 아이디가 session에 저장되어 있어서 로그인을 꺼낸다.
		// 로그인 속에서 id를 꺼내서 우리가 집어넣을때 id를 집어넣는다.
		String jsp = null;
		// session 로그인 가져오기 
		HttpSession session = request.getSession();
		switch (uri) {
		case "/product/list.do":
			// 페이지 정보와 검색 정보를 받는 처리문을 호출해서 해결
			PageObject pageObject = PageObject.getInstance(request);
			// 리스트를 담아오는 request
		//	if(login != null) {
			request.setAttribute("list", Execute.run(productListService, pageObject));
			// jsp의 list 하단의 마지막 페이지 네비게이션 데이터 저장- request를 담는다.
			request.setAttribute("pageObject", pageObject);
		//	}
			jsp = "product/list";
			break;
		case "/product/view.do":
			String noStr = request.getParameter("productno");
			long productno = Long.parseLong(noStr);
		
			ProductVO viewVO=  (ProductVO) Execute.run(productViewService, productno);
			request.setAttribute("vo", viewVO);
			jsp = "/product/view";
			break;
		case "/product/write.do":
			if (request.getMethod().equals("GET")) {
				jsp = "product/write";
			} else {
				MultipartRequest multi = new MultipartRequest(request, realPath, size, "utf-8",
						new DefaultFileRenamePolicy());
				String priceStr = multi.getParameter("price");
				long price = Long.parseLong(priceStr);
				String stockStr = multi.getParameter("stock");
				long stock = Long.parseLong(stockStr);
				
				// 데이터 수집
				ProductVO writeVO = new ProductVO();
				writeVO.setName(multi.getParameter("name"));
				writeVO.setDescription(multi.getParameter("description"));
				writeVO.setPrice(price);
				writeVO.setStock(stock);
				writeVO.setImg(path + "/" + multi.getFilesystemName("img"));
				Execute.run(productWriteService, writeVO);
				jsp = "redirect:list.do";
			}
			break;
		case "/product/updateImage.do":
			MultipartRequest multi = new MultipartRequest(request, realPath, size, "utf-8",
					new DefaultFileRenamePolicy());
			// 업데이트할 이미지 번호 수집 
			String updateImg = multi.getParameter("productno");
			long updateImageNo = Long.parseLong(updateImg);
			// 삭제할 이미지 파일 수집 
			String deleteImg = multi.getParameter("deleteFile");
			System.out.println("");
			String reaDeleteFile = request.getServletContext().getRealPath(deleteImg);
			//삭제할 파일 
			File deleteFile = new File(reaDeleteFile);
			if (deleteFile.exists())
				System.out.println("삭제 파일이 존재합니다");

			ProductVO updateImageVO = new ProductVO();
			
			updateImageVO.setProductno(updateImageNo);
			// 파일 이름만 가져오는것.
			updateImageVO.setImg(path + "/" + multi.getFilesystemName("img"));
			System.out.println("ProductController.execute().imageUpdateImageService:" + updateImageVO);
			// 삭제할 이미지 - 내 컴퓨터에 있는것을 삭제하므로 realPath
			System.out.println("ProductController.execute().삭제할 파일명" + deleteFile);

			// 예전 파일 삭제 처리
			deleteFile.delete();
			Execute.run(productImageUpdateService, updateImageVO);
			jsp = "redirect:view.do?productno="+updateImageNo;
			
			break;
			
		case "/product/update.do":
			String updateNoStr = request.getParameter("productno");
			long updateNo = Long.parseLong(updateNoStr);
			
			
			if (request.getMethod().equals("GET")) {
				// 데이터 처리 >> request에 담는다.>> jsps에서 꺼내쓴다. EL객체 사용해서
				request.setAttribute("vo", Execute.run(productViewService, updateNo));
				jsp = "product/update";
			} else {
				// 데이터 수집
			String stockStr = request.getParameter("stock");
			long stock = Long.parseLong(stockStr);
			String priceStr = request.getParameter("price");
			long price = Long.parseLong(priceStr);
				ProductVO updateVO = new ProductVO();
				updateVO.setProductno(updateNo);
				updateVO.setName(request.getParameter("name"));
				updateVO.setDescription(request.getParameter("description"));
				updateVO.setPrice(price);
				updateVO.setStock(stock);
				Execute.run(productUpdateService, updateVO);
				jsp = "redirect:view.do?productno="+updateNo;
			}
			break;
		case "/product/delete.do":
			// 데이터 수집 - 반드시 list에서 시작하셔야 데이터가 넘어온다.
			String deletenoStr = request.getParameter("productno");
			long deleteNo = Long.parseLong(deletenoStr);
			deleteImg=request.getParameter("deleteFile");
			//db에서 삭제처리 
			Execute.run(productDeleteService, deleteNo);
			//데이터가 삭제되면 파일도 삭제된다.
			reaDeleteFile = request.getServletContext().getRealPath(deleteImg);
			deleteFile = new File(reaDeleteFile);
			deleteFile.delete();
			System.out.println("컨트롤러 삭제");
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
