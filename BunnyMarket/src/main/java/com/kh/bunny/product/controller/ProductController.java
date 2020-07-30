package com.kh.bunny.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bunny.product.model.exception.ProductException;
import com.kh.bunny.product.model.service.ProductService;
import com.kh.bunny.product.model.vo.Product;
import com.kh.bunny.common.util.Utils;
<<<<<<< HEAD
=======
import com.kh.bunny.member.model.vo.Member;
>>>>>>> refs/heads/develop
import com.kh.bunny.product.model.vo.PComment;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService; 
	
	@RequestMapping("/product/productList.do")
	public String selectBoardList(
			@RequestParam(value = "pPage", required = false, defaultValue = "1")
			int pPage, Model model) {
		
		int numPerPage = 9; // 한 페이지에 9개의 게시글씩 나오도록 
		
		List<Map<String, String>> list = productService.selectProductList(pPage, numPerPage);
		
		System.out.println("productController에서 list를 가져오나 확인 : " + list);
		// Product list는 잘 가져오는 것 확인 완료 
		
		// 페이지 계산을 위한 총 페이지 개수 
		int totalContents = productService.selectProductTotalContents();
		
		// 페이지 HTML 생성 
		String pageBar = Utils.getPageBar(totalContents, pPage, numPerPage, "productList.do");
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numberPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "product/productList";
		
		
	}
	
	// 상품 상세보기 
	@RequestMapping("/product/productDetail.do")
	public String selectOne(@RequestParam int pno, Model model) {
		Product p = productService.selectOneProduct(pno);
		List<Object> PComments = productService.selectPCommentList(pno);
		
		System.out.println("productDetail Cont에서 product객체 확인 : " + p);
		System.out.println("productDetail cont에서 PComment객체 확인 : " + PComments);
		System.out.println("PComment객체 갯수 : " + PComments.size());
		
		model.addAttribute("product", p)
		     .addAttribute("pcomments", PComments)
		     .addAttribute("pcommentSize", PComments.size()); // 댓글 갯수 출력 
		
		
		return "product/productDetail";
	}
	
	
	
	
	// 상품 생성하기 
	@RequestMapping("/product/productInsert.do")
	public void productForm() {
		// productInsert.jsp 로 이동하기 
	}
	
	@RequestMapping("/product/productInsertEnd.do")
	public String insertProduct(Product product, Model model, HttpSession session,
			@RequestParam(value = "pTitleImg", required = false) MultipartFile pImg) {
		
		
		System.out.println("pImg가져오나 확인 : " + pImg);
		System.out.println("jsp에서 insertProduct할때 객체 받아오나 확인 : " + product);
		
		// 1. 파일을 저장할 경로 생성 
		String saveDir = session.getServletContext().getRealPath("resources/upload/product");
		
		// 2. 폴더 유무 확인 후 생성 
		File dir = new File(saveDir);
		System.out.println("productImg를 생성할 폴더가 존재함? " + dir.exists());
		
		if(dir.exists() == false) dir.mkdirs();
		
		// 파일 원본 이름 가져오기 
		String originName = pImg.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf(".")+1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		
		int rndNum = (int)(Math.random() * 1000); // 이름바꾸기 수행. 랜덤번호..
		
		// 서버에서 저장 후 관리할 파일 명 
		String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
		
		// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
		try {
			pImg.transferTo(new File(saveDir + "/" + renamedName)); 
			// transferTo는 우리가 원래 받은 원본 파일 이름을 변경된 파일 이름으로 바꾸어서 해당 경로에 저장해달라는 것.
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getNickName();
		
		product.setPWriter(userId);
		product.setPImg(renamedName);
		int result = productService.insertProduct(product);
		String msg = "";
		String loc = "/product/productList.do";
		if (result >0) {
			msg = "상품 정보 생성 완료";
			System.out.println("상품생성완료");
		} else {
			msg = "상품 정보 생성 실패";
			System.out.println("상품수정실패");
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		return "common/msg";
	}
	
	// 상품 게시글 수정 페이지 이동하기 
	@RequestMapping("/product/productView.do")
	public String productView(Model model,
			@RequestParam int pno) {
		model.addAttribute("product", productService.selectOneProduct(pno));
		
		return "product/productUpdate";
	}
	
	
	// 상품 게시글 수정하기 
	@RequestMapping("/product/productUpdate.do")
	public String updateProduct(Product product, Model model, HttpSession session,
			@RequestParam(value = "pTitleImg", required = false) MultipartFile pImg) {
		
		int pno = product.getPno();
		System.out.println("수정 서블릿에서 jsp에서 받아온 product객체 확인 : " + product);
		
		Product originProduct = productService.selectOneProduct(pno);
		System.out.println("수정 서블릿에서 origin product객체 확인 : " + originProduct);
		
		originProduct.setPTitle(product.getPTitle());
		originProduct.setPPrice(product.getPPrice());
		originProduct.setPAddress(product.getPAddress());
		originProduct.setPContent(product.getPContent());
		
		
		// 1. 파일을 저장할 경로 생성 
		String saveDir = session.getServletContext().getRealPath("resources/upload/product");
		
		// 2. 폴더 유무 확인 후 생성 
		File dir = new File(saveDir);
		System.out.println("productImg를 생성할 폴더가 존재함? " + dir.exists());
		
		if(dir.exists() == false) dir.mkdirs();
		
		System.out.println("jsp에서 받아온 pImg확인 : " + pImg);
		if(!pImg.isEmpty()) { // pImg를 수정해준 경우 
			// 기존에 존재하던 이미지 파일은 삭제해주고 다시 받아서 넣어준다.
			System.out.println("pImg가 null이 아님!! 새로 받은 이미지로 이미지 수정이 시작된다.");
			System.out.println("해당 게시물에 원래 있던 pImg의 값 : " + originProduct.getPImg());
			
			boolean deleteFile = new File(saveDir+"/"+ originProduct.getPImg()).delete();
			System.out.println("수정 과정에서 기존의 파일은 삭제되었나? : " + deleteFile);
			
			
			// 파일 원본 이름 가져오기 
			String originName = pImg.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			
			int rndNum = (int)(Math.random() * 1000); // 이름바꾸기 수행. 랜덤번호..
			
			// 서버에서 저장 후 관리할 파일 명 
			String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
			
			// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
			try {
				pImg.transferTo(new File(saveDir + "/" + renamedName)); 
				// transferTo는 우리가 원래 받은 원본 파일 이름을 변경된 파일 이름으로 바꾸어서 해당 경로에 저장해달라는 것.
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			product.setPImg(renamedName);
			
		} else {
			System.out.println("pImg가 null이네요~~!");
		}
		
		int result = productService.updateProduct(product);
		String msg = "";
		String loc = "/product/productList.do";
		if (result >0) {
			msg = "상품 정보 수정 완료";
			System.out.println("상품 수정 완료");
		} else {
			msg = "상품 정보 수정 실패";
			System.out.println("상품 수정 실패");
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		return "common/msg";
	}
	
	
	// 상품 삭제하기 
	@RequestMapping("/product/productDelete.do")
	public String deleteProduct(@RequestParam int pno, Model model) {
		
		String msg = "";
		String loc = "/product/productList.do";
		int result = productService.deleteProduct(pno);
		
		if (result >0) {
			msg = "상품 정보 삭제 완료";
			System.out.println("상품삭제완료");
		} else {
			msg = "상품 정보 삭제 실패";
			System.out.println("상품삭제실패");
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	// 댓글 생성하기 
	@RequestMapping("/product/pcommentInsert.do")
<<<<<<< HEAD
	public String pcommentInsert(PComment pcomment, Model model) {
		
		
		
		return "";
	}
=======
	public String pcommentInsert(PComment pcomment, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getNickName();
		
		pcomment.setPcWriter(userId);
		System.out.println("댓글 들어옴 ? " + pcomment);
		String msg = "";
		String loc = "/product/productDetail.do?pno=" + pcomment.getPno();
		
		try	{
			int result = productService.insertPComment(pcomment);
			
			if(result > 0) {
				msg = "댓글 달기 성공!";
			} else {
				msg = "댓글 달기 실패ㅠ";
			}
		} catch (Exception e) {
			throw new ProductException("상품 댓글에서 에러 발생! " + e.getMessage());
		}
		 
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
//	@RequestMapping("/product/pcommentInserta.do")
//	@ResponseBody
//	public Map<String, Object> pcommentInserta(PComment pcomment, Model model, HttpSession session) {
//		
//		Member m = (Member)session.getAttribute("member");
//		String userId = m.getNickName();
//		
//		pcomment.setPcWriter(userId);
//		System.out.println("댓글 들어옴 ? " + pcomment);
//		Map<String, Object> hmap = new HashMap<String, Object>();
//		boolean isInsert = false;
//		PComment pcm = null;
//		try {
//			
//			isInsert = productService.insertPComment(pcomment) > 0 ? true : false;
//			if(isInsert) {
//				pcm = productService.selectOnePComment(pcomment.getPno()); 				
//			}
//			
//		} catch (Exception e) {
//			throw new ProductException();
//		}
//		
//		System.out.println("pcm : " + pcm);
//		hmap.put("isInsert", isInsert);
//		hmap.put("pcomment", pcm);
//		 
//		return hmap;
//	}
>>>>>>> refs/heads/develop
	
	// 댓글 수정하기 
	@RequestMapping("/product/pcommentUpdate.do")
	public String pcommentUpdate(PComment pcomment, Model model) {
		
		
		return "";
	}
	
<<<<<<< HEAD
	// 댓글 삭제하기 
	@RequestMapping("/product/pcommentDelete.do")
	public String pcommentDelete(@RequestParam int pcmno) {
		
		
		
		return "";
	}
	
	
=======
	// 댓글 수정하기 
	@RequestMapping("/product/pcommentUpdate.do")
	@ResponseBody
	public HashMap<String, Object> pcommentUpdate(PComment pcomment) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		boolean updateCheck = false;
		try {
			updateCheck = productService.updatePComment(pcomment) > 0 ? true : false;
		} catch (Exception e) {
			throw new ProductException();
		}
		
		hmap.put("updateCheck", updateCheck);
		
		return hmap;
	}
	
	// 댓글 삭제하기 
	@RequestMapping("/product/pcommentDelete.do")
	public String pcommentDelete(PComment pcomment, Model model) {
		
		String msg = "";
		String loc = "/product/productDetail.do?pno=" + pcomment.getPno();
		
		try	{
			
			boolean hasReply = productService.selectOneReplyPcmno(pcomment.getPcmno()) > 0 ? true : false;
			if(hasReply == true) {
				msg = "대댓글이 있어서 삭제가 불가능합니다.";
			} else {
				
				int result = productService.deletePComment(pcomment.getPcmno());
			
				if(result > 0 && hasReply == false) {
					msg = "댓글 삭제 성공!";				
				} else {
					msg = "에러 발생!(댓글 삭제 실패)";
				}
			}
		} catch (Exception e) {
			throw new ProductException("상품 댓글에서 에러 발생! " + e.getMessage());
		}
		 
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/product/pImgInsert.do")
	@ResponseBody
	public String auctionImgInsert(
				  @RequestParam(value="file", required = false) MultipartFile[] file
				, Model model, HttpSession session
			) {
		
		String saveDir = session.getServletContext().getRealPath("resources/upload/product/desc");
		
		File dir = new File(saveDir);
		if(dir.exists() == false) dir.mkdirs();
		
		String renamedName = "";
		
		for(MultipartFile f : file) {
			
			if(!f.isEmpty()) {
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				int rndNum = (int)(Math.random() * 1000);
				
				renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
				
				try {
					f.transferTo(new File(saveDir + "/" + renamedName)); 
					System.out.println("바뀐이름 : " + renamedName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		// 192.168.20.214 - 민정
		return "http://localhost:8088/bunny/resources/upload/product/desc/" + renamedName;
	}
>>>>>>> refs/heads/develop
	


}




























