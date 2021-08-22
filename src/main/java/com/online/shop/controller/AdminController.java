package com.online.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.online.shop.service.AdminService;
import com.online.shop.utils.UploadFileUtils;
import com.online.shop.vo.CateVO;
import com.online.shop.vo.OrderListVO;
import com.online.shop.vo.OrderVO;
import com.online.shop.vo.ProductVO;
import com.online.shop.vo.ProductViewVO;
import com.online.shop.vo.ReplyListVO;

import net.sf.json.JSONArray;

@Controller
public class AdminController {

	@Value("${file.upload.directory}")
	String uploadFileDir;

	@Autowired
	AdminService service;

	////////////// 관리자 컨트롤러
	// 관리자 상품 뷰 
	@RequestMapping(value = "/adminproductadd", method=RequestMethod.GET)
	public String productaddView(Model model) throws Exception {
		List<CateVO> category = null;
		category = service.category();
		model.addAttribute("category",JSONArray.fromObject(category));
		return "admin/adminproductadd";
	}

	// 관리자 상품 등록
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(ProductVO vo, MultipartFile file) throws Exception{
		String imgUploadPath = uploadFileDir + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			
			// 이미지 파일이 있을때의 경로추적
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			
			vo.setSP_IMG(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setSP_THUMBIMG(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {
			// 이미지 파일이 없을때 기본 이미지
			fileName = File.separator + "images" + File.separator + "none.png";
			
			vo.setSP_IMG(fileName);
			vo.setSP_THUMBIMG(fileName);
		}

		service.register(vo);

		return "redirect:/admin";
	}

	// 관리자 상품 목록
	@RequestMapping(value="/adminproductlist", method=RequestMethod.GET)
	public String productlist(Model model) throws Exception {
		
		List<ProductViewVO> mem=service.productList();
		
		model.addAttribute("list",mem);
		
		return "admin/adminproductlist";
	}

	// 관리자 상품 상세 정보
	@RequestMapping(value="/adminproductdetail",method=RequestMethod.GET)
	public String productdetail(@RequestParam("num") int num,Model model,ProductVO vo)throws Exception {
		ProductViewVO pro = service.productDetail(num);
		model.addAttribute("productDetail",pro);
		return "admin/adminproductdetail";
	}

	// 관리자 상품 삭제 
	@RequestMapping(value= "/admindelete",method=RequestMethod.POST)
	public String productDelete(@RequestParam("num") int num) throws Exception {
		service.productDelete(num);
		return "redirect:/adminproductlist";
	}

	// 관리자 상품 수정 뷰
	@RequestMapping(value= "/adminproductmodify", method=RequestMethod.GET)
	public String productmodify(@RequestParam("num") int num,Model model)throws Exception {

		ProductViewVO vo = service.productDetail(num);
		model.addAttribute("pro",vo);

		List<CateVO> category = null;
		category = service.category();
		model.addAttribute("category",JSONArray.fromObject(category));
		return "admin/adminproductmodify";
	}

	// 관리자 상품 수정 완료
	@RequestMapping(value= "/modify", method=RequestMethod.POST)
	public String productDelete(ProductVO vo,MultipartFile file,HttpServletRequest requst) throws Exception {

		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadFileDir + requst.getParameter("SP_IMG")).delete();
			new File(uploadFileDir + requst.getParameter("SP_THUMBIMG")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadFileDir + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setSP_IMG(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setSP_THUMBIMG(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else {  // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setSP_IMG(requst.getParameter("SP_IMG"));
			vo.setSP_THUMBIMG(requst.getParameter("SP_THUMBIMG"));

		}

		service.productModify(vo);
		return "redirect:/adminproductlist";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, 
			HttpServletResponse res, 
			@RequestParam MultipartFile upload) throws Exception {

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadFileDir + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

//			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "resources/ckUpload/" + uid + "_" + fileName; // 작성화면

			// 업로드시 메시지 출력
//			printWriter.println("<script type='text/javascript'>"
//					+ "window.parent.CKEDITOR.tools.callFunction("
//					+ callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
//					+"</script>");
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");

			printWriter.flush();

		} catch (IOException e) { e.printStackTrace();
		} finally {
			try {
				if(out != null) { out.close(); }
				if(printWriter != null) { printWriter.close(); }
			} catch(IOException e) { e.printStackTrace(); }
		}

		return; 
	}
	
	/////////////////// 회원관리 부분
	// 회원 목록 출력
	@RequestMapping(value="/adminmemberlist")
	public String memberlist(Model model) throws Exception {
		model.addAttribute("list",service.memberlist());
		return "admin/adminmemberlist";
	}
	
	// 회원 삭제
	@RequestMapping(value="/memberdelete")
	public String delete(@RequestParam("uid") String uid) throws Exception {
		service.memberdelete(uid);
		return "redirect:/adminmemberlist";
		
	}
	
	/////////////////// 주문 부분
	// 주문 목록
	@RequestMapping(value = "/adminorderList", method = RequestMethod.GET)
	public String adminOrderList(Model model) throws Exception {
	   
	 List<OrderVO> orderList = service.adminorderList();
	 
	 model.addAttribute("orderList", orderList);
	 
	 return "admin/adminorderList";
	}

	// 주문 상세 목록
	@RequestMapping(value = "/adminorderView", method = RequestMethod.GET)
	public String adminOrderView(@RequestParam("num") String orderId,
	      OrderVO order, Model model) throws Exception {
	 
	 order.setOrderId(orderId);  
	 List<OrderListVO> orderView = service.adminorderView(order);
	 
	 model.addAttribute("orderView", orderView);
	 
	 return "admin/adminorderView";
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/delivery", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
	   
	service.delivery(order);
	
	// 상품 수량 변경 STOCK
	List<OrderListVO> orderView = service.adminorderView(order); 

	ProductVO goods = new ProductVO();
	  
		for(OrderListVO i : orderView) {
		 goods.setSP_NUM(i.getSP_NUM());
		 goods.setSP_STOCK(String.valueOf(i.getSP_STOCK()));
		 service.changeStock(goods);
		}

	 return "redirect:/adminorderView?num=" + order.getOrderId();
	}
	
	// 모든 소감(댓글)
	@RequestMapping(value = "/allReply", method = RequestMethod.GET)
	public String getAllReply(Model model) throws Exception {
	   
	 List<ReplyListVO> reply = service.allReply();
	 
	 model.addAttribute("reply", reply);
	 return "admin/adminallReply";
	}
	
	// 소감 삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String deleteReply(HttpServletRequest request) throws Exception {
		int reqNum = Integer.parseInt(request.getParameter("S_reqNum"));
		System.out.println("소감 삭제 값 : "+reqNum);
		service.deleteReply(reqNum);
		
		return "redirect:/allReply";
	}
}

