package com.air3.serviceInfo.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.air3.member.vo.LoginVO;
import com.air3.member.vo.MemberVO;
import com.air3.serviceInfo.vo.ServiceInfoVO;
import com.webjjang.util.PageObject;

public class ServiceInfoController {

	// private 변수로 ServiceInfoService
	private ServiceInterface serviceInfoListService;
	private ServiceInterface serviceInfoViewService;
	private ServiceInterface serviceInfoWriteService;
	private ServiceInterface serviceInfoUpdateService;
	private ServiceInterface serviceInfoUpdateImageService;
	private ServiceInterface serviceInfoDeleteService;

	// setter를 만들어서 생성된 service를 받는다.
	public void setServiceInfoListService(ServiceInterface serviceInfoListService) {
		this.serviceInfoListService = serviceInfoListService;
	}
	public void setServiceInfoViewService(ServiceInterface serviceInfoViewService) {
		this.serviceInfoViewService = serviceInfoViewService;
	}
	public void setServiceInfoWriteService(ServiceInterface serviceInfoWriteService) {
		this.serviceInfoWriteService = serviceInfoWriteService;
	}
	public void setServiceInfoUpdateService(ServiceInterface serviceInfoUpdateService) {
		this.serviceInfoUpdateService = serviceInfoUpdateService;
	}
	public void setServiceInfoUpdateImageService(ServiceInterface serviceInfoUpdateImageService) {
		this.serviceInfoUpdateImageService = serviceInfoUpdateImageService;
	}
	public void setServiceInfoDeleteService(ServiceInterface serviceInfoDeleteService) {
		this.serviceInfoDeleteService = serviceInfoDeleteService;
	}


	
	// 실행 메서드 -> 리턴 String 데이터를 jsp 또는 url 정보가 된다.
	public String execute(HttpServletRequest request) throws Exception{
		System.out.println("ServiceInfoController.execute().request : " + request);
		// 어떤 요청
		String uri = request.getRequestURI();
		String method = request.getMethod();
		System.out.println("ServiceInfoController.execute().method : " + method);
		
		
		/*
		 * 파일 업로드를 위한 정보
		 * */
		
		// 파일 저장 위치 
		String path = "/upload/info_service";
		// 실제적인 파일 시스템의 위치가 필요하다.
		String realPath = request.getServletContext().getRealPath(path);
		System.out.println("ServiecInfoController.execute().realPath : " + realPath);
		int size = 100 * 1024 * 1024;
		
		// 이미지 등록할 때 아이디가 session에 저장되어 있다.
		HttpSession session = request.getSession();
		
		
		
		String jsp = null;
				
		// 처리 
		switch (uri) {
		case "/serviceInfo/list.do":

			
			// 페이지 정보와 검색 정보를 받는 처리문(메소드)를 호출해서 해결한다.
			PageObject pageObject = PageObject.getInstance(request);

			request.setAttribute("list", Execute.run(serviceInfoListService, pageObject));
			// jsp - 리스트 데이터 아래의 페이지 네비게이션을 위한 데이터 저장
			request.setAttribute("pageObject", pageObject);
			jsp = "/infor_service/list";
			break;

		case "/serviceInfo/view.do":
			// 글보기라고 생각을 하고 처리해 보자.
			// 데이터 수집 -> 반드시 리스트 부터 시작하여야 데이터가 넘어온다.
			System.out.println(request.getParameter("no"));
			String noStr = request.getParameter("no");
			long no = Long.parseLong(noStr);
			System.out.println(no);

				ServiceInfoVO viewVO 
			= (ServiceInfoVO) Execute.run(serviceInfoViewService, no);
			// 내용 줄바꿈 처리
			viewVO.setContent(viewVO.getContent().replace("\n", "<br/>"));
			request.setAttribute("vo", viewVO);
			jsp = "/infor_service/view";
			break;

			
		case "/serviceInfo/write.do":
			if(request.getMethod().equals("GET")) {
				jsp = "infor_service/write";
			} else {
				// 파일 업로드 실행 -> 객체 생성과 동시에 업로드 해준다.
				// request 대신 muti에 데이터를 넣어둔다.
				
				MultipartRequest multi = new MultipartRequest(request, 
						realPath, size, "utf-8", new DefaultFileRenamePolicy());				
				
				// 데이터 수집
				ServiceInfoVO writeVO = new ServiceInfoVO();
				// id는 세션에 있다.
				writeVO.setId(((LoginVO)session.getAttribute("login")).getId());
				writeVO.setTitle(multi.getParameter("title"));
				writeVO.setContent(multi.getParameter("content"));
				writeVO.setFileName(path + "/" + multi.getFilesystemName("imageFile"));
				System.out.println("ImageController.execute().writeVO : " + writeVO);
				// 글등록 처리해 보자.
				Execute.run(serviceInfoWriteService, writeVO);
				jsp = "redirect:list.do?perPageNum=" + multi.getParameter("perPageNum");
				System.out.println(multi.getParameter("perPageNum"));
			}
			break;
			
		case "/serviceInfo/update.do":
			// DB에서 데이터 가져오기
			// 데이터 수집 -> 반드시 리스트 부터 시작하여야 데이터가 넘어온다.
			String updateNoStr = request.getParameter("no");
			long updateNo = Long.parseLong(updateNoStr);
			
			if(request.getMethod().equals("GET")) {
				// 데이터 처리 -> request에 담는다. -> jsp에서 꺼내 쓴다. EL 객체 사용
				request.setAttribute("vo", Execute.run(serviceInfoViewService, updateNo));
				jsp = "infor_service/update";
			} else {
				ServiceInfoVO updateVO = new ServiceInfoVO();
				// 데이터 수집 vo 넣기
				updateVO.setNo(updateNo);
				updateVO.setTitle(request.getParameter("title"));
				updateVO.setContent(request.getParameter("content"));
				
				
				// DB 처리
				Execute.run(serviceInfoUpdateService, updateVO);
				
				// 글보기로 자동이동 - 글번호와  inc가 필요하다. inc는 무조건 0이다.
				jsp = "redirect:view.do?no=" + updateNo + "&page=" + request.getParameter("page") + "&perPageNum" + request.getParameter("perPageNum");
			}
			break;
			
		case "/serviceInfo/updateImage.do":
			// 파일 업로드를 실행 -> 객체 생성과 동시에 업로드 해준다.
			// request 대신 multi에 데이터를 넣둔다.
			MultipartRequest multi
			= new MultipartRequest(request, realPath, size, 
					"utf-8", new DefaultFileRenamePolicy());
			
			// 데이터 수집
			String updateImageNoStr = multi.getParameter("no");
			long updateImageNo = Long.parseLong(updateImageNoStr);
			// 삭제할 이미지 파일
			String deleteFileName = multi.getParameter("deleteFile");
			System.out.println("ImageController.execute().deleteFile : " + deleteFileName);
			String realDeleteFile = request.getServletContext().getRealPath(deleteFileName);
			File deleteFile = new File(realDeleteFile);
			if(deleteFile.exists()) System.out.println("삭제 파일이 존재합니다.");
			
			ServiceInfoVO updateImageVO = new ServiceInfoVO();
			// id는 session에 있다.
			updateImageVO.setNo(updateImageNo);
			updateImageVO.setFileName(path + "/" + multi.getFilesystemName("imageFile"));
			System.out.println("ServiceInfoController.execute().updateImageVO : " + updateImageVO);
			// 글등록 처리해 보자.
			Execute.run(serviceInfoUpdateImageService, updateImageVO);
			
			// 예전 파일 삭제 처리
			deleteFile.delete();
			
			jsp = "redirect:view.do?no=" + updateImageNo;
			break;
			
			
			
		case "/serviceInfo/delete.do":

			String deleteNoStr = request.getParameter("no");
			long deleteNo = Long.parseLong(deleteNoStr);
			deleteFileName = request.getParameter("deleteFile");
			// DB 삭제 처리해 보자.
			Execute.run(serviceInfoDeleteService, deleteNo);
			
			// 데이터가 삭제되면 파일도 삭제한다.
			realDeleteFile = request.getServletContext().getRealPath(deleteFileName);
			deleteFile = new File(realDeleteFile);
			deleteFile.delete();
			
			jsp = "redirect:list.do?perPageNum=" + request.getParameter("perPageNum");
			break;
			
		default:
			request.getSession().setAttribute("uri", uri);
			jsp = "redirect:/error/404.do";
		}
		return jsp;
	}
	
}
