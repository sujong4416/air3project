package com.air3.craftInf.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.air3.craftInf.VO.CraftInfVO;
import com.air3.main.Execute;
import com.air3.main.ServiceInterface;
import com.air3.product.vo.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;








public class CraftInfController {

	private ServiceInterface craftInfVoingListService;
	private ServiceInterface craftInfAirbusListService;
	private ServiceInterface craftInfDeleteService;
	private ServiceInterface craftInfWriteService;
	private ServiceInterface craftInfViewService;
	private ServiceInterface craftInfUpdateService;
	private ServiceInterface craftInfUpdateImageService;
	private ServiceInterface craftInfUpdateImage2Service;

	public void setCraftInfVoingListService(ServiceInterface craftInfVoingListService) {
		this.craftInfVoingListService = craftInfVoingListService;
	}
	public void setCraftInfAirbusListService(ServiceInterface craftInfAirbusListService) {
		this.craftInfAirbusListService = craftInfAirbusListService;
	}
	public void setCraftInfWriteService(ServiceInterface craftInfWriteService) {
		this.craftInfWriteService = craftInfWriteService;
	}
	public void setCraftInfViewService(ServiceInterface craftInfViewService) {
		this.craftInfViewService = craftInfViewService;
	}
	public void setCraftInfUpdateService(ServiceInterface craftInfUpdateService) {
		this.craftInfUpdateService = craftInfUpdateService;
	}
	public void setCraftInfDeleteService(ServiceInterface craftInfDeleteService) {
		this.craftInfDeleteService = craftInfDeleteService;
	}
	public void setCraftInfUpdateImageService(ServiceInterface craftInfUpdateImageService) {
		this.craftInfUpdateImageService = craftInfUpdateImageService;
	}
	public void setCraftInfUpdateImage2Service(ServiceInterface craftInfUpdateImage2Service) {
		this.craftInfUpdateImage2Service = craftInfUpdateImage2Service;
	}
	

	public String execute(HttpServletRequest request) throws Exception {
		System.out.println("CraftInfController.execute().request : " + request);
		// 어떤 요청
		String uri = request.getRequestURI();
		String method = request.getMethod();
		System.out.println("CraftInfController.execute().method : " + method);
		String path = "/upload/craftInf";
		// 실제적인 파일 시스템의 위치가 필요하다.
		String realPath = request.getServletContext().getRealPath(path);
		System.out.println("CraftInfController.execute().realPath : " + realPath);
		
		HttpSession session = request.getSession();
		// 이미지 등록할 때 아이디가 session에 저장되어 있다.
		
		
		int size = 99999999 ;
		String jsp = null;
		// 처리
		switch (uri) {
		case "/craftInf/list.do":
				List<CraftInfVO> voingList=(List<CraftInfVO>) Execute.run(craftInfVoingListService, null);
				System.out.println(voingList);
				List<CraftInfVO> airbusList=(List<CraftInfVO>) Execute.run(craftInfAirbusListService, null);
				System.out.println(airbusList);
				Object[] lists = {voingList,airbusList};
				request.setAttribute("list", lists);
				jsp = "craftInf/list";
				
			break;
		case "/craftInf/view.do":
			String noStr = request.getParameter("no");
			long no = Long.parseLong(noStr);
			// 데이터 처리 -> request에 담는다. -> jsp에서 꺼내 쓴다. EL 객체 사용
			CraftInfVO viewVO 
			= (CraftInfVO) Execute.run(craftInfViewService, no);
			// 내용 줄바꿈 처리
			
			request.setAttribute("vo", viewVO); // ${vo }로 찾아서 사용한다.
			jsp = "craftInf/view";
			break;
		case "/craftInf/write.do":
			if(request.getMethod().equals("GET")) {
				jsp = "craftInf/write";
			} else {
				// 파일 업로드를 실행 -> 객체 생성과 동시에 업로드 해준다.
				// request 대신 multi에 데이터를 넣둔다.
				MultipartRequest multi
				= new MultipartRequest(request, realPath, size,"utf-8", new DefaultFileRenamePolicy());
				
				// 데이터 수집
				CraftInfVO writeVO = new CraftInfVO();
				// id는 session에 있다.
				
				writeVO.setcName(multi.getParameter("cName"));
				writeVO.setcImg(path + "/" + multi.getFilesystemName("cImg"));
				writeVO.setcChairImg(path + "/" + multi.getFilesystemName("cChairImg"));
				String cDistanceStr = multi.getParameter("cDistance");
				Long cDistance = Long.parseLong(cDistanceStr);
				writeVO.setcDistance(cDistance);
				String cSpeedStr = multi.getParameter("cSpeed");
				Long cSpeed = Long.parseLong(cSpeedStr);
				writeVO.setcSpeed(cSpeed);
				String cChairNStr = multi.getParameter("cChairN");
				Long cChairN = Long.parseLong(cChairNStr);
				writeVO.setcChairN(cChairN);
				String cChairRowNStr = multi.getParameter("cChairRowN");
				Long cChairRowN = Long.parseLong(cChairRowNStr);
				writeVO.setcChairRowN(cChairRowN);
				
				writeVO.setcChairLineN(multi.getParameter("cChairLineN"));
				
				String cdivStr = multi.getParameter("cDiv");
				Long cdiv = Long.parseLong(cdivStr);
				writeVO.setcDiv(cdiv);
				
				System.out.println("ImageController.execute().writeVO : " + writeVO);
				// 글등록 처리해 보자.
				Execute.run(craftInfWriteService, writeVO);
				jsp = "redirect:list.do";
			}
			break;
		case "/craftInf/update.do":
			// DB에서 데이터 가져오기
						// 데이터 수집 -> 반드시 리스트 부터 시작하여야 데이터가 넘어온다.
						
						// 수정에서의 데이터 가져오기 조회수 1증가 하지 않는다. -> 0 으로 강제 입력
//							String incStr = request.getParameter("inc");
//							int inc = Integer.parseInt(incStr);
						if(request.getMethod().equals("GET")) {
							String updateNoStr = request.getParameter("no");
							long updateNo = Long.parseLong(updateNoStr);
							// 데이터 처리 -> request에 담는다. -> jsp에서 꺼내 쓴다. EL 객체 사용
							request.setAttribute("vo",
									Execute.run(craftInfViewService, updateNo));
							jsp = "craftInf/update";
						} else {
							MultipartRequest multi
							= new MultipartRequest(request, realPath, size,"utf-8", new DefaultFileRenamePolicy());
							CraftInfVO updateVO = new CraftInfVO();
							// 데이터 수집 vo 넣기
							
							String cNoStr = multi.getParameter("cNo");
							Long cNo = Long.parseLong(cNoStr);
							updateVO.setcNo(cNo);
							updateVO.setcName(multi.getParameter("cName"));
							
							String cDistanceStr = multi.getParameter("cDistance");
							Long cDistance = Long.parseLong(cDistanceStr);
							updateVO.setcDistance(cDistance);
							String cSpeedStr = multi.getParameter("cSpeed");
							Long cSpeed = Long.parseLong(cSpeedStr);
							updateVO.setcSpeed(cSpeed);
							String cChairNStr = multi.getParameter("cChairN");
							Long cChairN = Long.parseLong(cChairNStr);
							updateVO.setcChairN(cChairN);
							String cChairRowNStr = multi.getParameter("cChairRowN");
							Long cChairRowN = Long.parseLong(cChairRowNStr);
							updateVO.setcChairRowN(cChairRowN);
							
							updateVO.setcChairLineN(multi.getParameter("cChairLineN"));
							
							String cDivStr = multi.getParameter("cDiv");
							Long cDiv = Long.parseLong(cDivStr);
							updateVO.setcDiv(cDiv);
							
							System.out.println("ImageController.execute().writeVO : " + updateVO);
							
							// DB 처리
							Execute.run(craftInfUpdateService, updateVO);
							
							// 글보기로 자동이동 - 글번호와  inc가 필요하다. inc는 무조건 0이다.
							jsp = "redirect:view.do?no=" + cNo;
						}
						break;
		case "/craftInf/delete.do":
			// 데이터 수집 - 글번호, 비밀번호
						String deleteNoStr = request.getParameter("no");
						long deleteNo = Long.parseLong(deleteNoStr);
						
						String deleteFileName1 = request.getParameter("deleteFile1");
						String deleteFileName2 = request.getParameter("deleteFile2");
						// DB 삭제 처리해 보자.
						Execute.run(craftInfDeleteService, deleteNo);
						
						// 데이터가 삭제되면 파일도 삭제한다.
						
						 String realDeleteFile1 = request.getServletContext().getRealPath(deleteFileName1);
						File deleteFile1 = new File(realDeleteFile1);
						deleteFile1.delete();
						String realDeleteFile2 = request.getServletContext().getRealPath(deleteFileName2);
						File deleteFile2 = new File(realDeleteFile2);
						deleteFile2.delete();
						
						jsp = "redirect:list.do";
						
						break;
						
		case "/craftInf/updateImage.do":
			MultipartRequest multi = new MultipartRequest(request, realPath, size, "utf-8",
					new DefaultFileRenamePolicy());
			// 업데이트할 이미지 번호 수집 
			String updateImg = multi.getParameter("cno");
			long updateImageNo = Long.parseLong(updateImg);
			// 삭제할 이미지 파일 수집 
			String deleteImg = multi.getParameter("deleteFile");
			System.out.println("");
			String reaDeleteFile = request.getServletContext().getRealPath(deleteImg);
			//삭제할 파일 
			File deleteFile = new File(reaDeleteFile);
			if (deleteFile.exists())
				System.out.println("삭제 파일이 존재합니다");

			CraftInfVO updateImageVO = new CraftInfVO();
			
			updateImageVO.setcNo(updateImageNo);
			// 파일 이름만 가져오는것.
			updateImageVO.setcChairImg(path + "/" + multi.getFilesystemName("img"));
			System.out.println("ProductController.execute().imageUpdateImageService:" + updateImageVO);
			// 삭제할 이미지 - 내 컴퓨터에 있는것을 삭제하므로 realPath
			System.out.println("ProductController.execute().삭제할 파일명" + deleteFile);

			// 예전 파일 삭제 처리
			deleteFile.delete();
			Execute.run(craftInfUpdateImageService, updateImageVO);
			jsp = "redirect:view.do?no="+updateImageNo;
			
			break;
		case "/craftInf/updateImage2.do":
			MultipartRequest multi2 = new MultipartRequest(request, realPath, size, "utf-8",
					new DefaultFileRenamePolicy());
			// 업데이트할 이미지 번호 수집 
			String updateImg2 = multi2.getParameter("cno");
			long updateImageNo2 = Long.parseLong(updateImg2);
			// 삭제할 이미지 파일 수집 
			String deleteImg2 = multi2.getParameter("deleteFile2");
			System.out.println("");
			String reaDeleteFile2 = request.getServletContext().getRealPath(deleteImg2);
			//삭제할 파일 
			deleteFile2 = new File(reaDeleteFile2);
			if (deleteFile2.exists())
				System.out.println("삭제 파일이 존재합니다");

			CraftInfVO updateImage2VO = new CraftInfVO();
			
			updateImage2VO.setcNo(updateImageNo2);
			// 파일 이름만 가져오는것.
			updateImage2VO.setcImg(path + "/" + multi2.getFilesystemName("img2"));
			System.out.println("ProductController.execute().imageUpdateImageService:" + updateImage2VO);
			// 삭제할 이미지 - 내 컴퓨터에 있는것을 삭제하므로 realPath
			System.out.println("ProductController.execute().삭제할 파일명" + deleteFile2);

			// 예전 파일 삭제 처리
			deleteFile2.delete();
			Execute.run(craftInfUpdateImage2Service, updateImage2VO);
			jsp = "redirect:view.do?no="+updateImageNo2;
			
			break;
			
			
		default:
			request.getSession().setAttribute("uri", uri);
			jsp = "redirect:/error/404.do";
			break;
		

		}// switch
		return jsp;
	}// execute

}// CraftInfController
