package com.spring.upload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	
	@Autowired
	private Upload upload;

	@RequestMapping("upload.do")
	public String upload() {
		
		return "upload_form";
	}
	
	@RequestMapping("upload_ok.do")
	public ModelAndView uploadOk(MultipartHttpServletRequest mRequest) {
		
		ModelAndView mav = new ModelAndView();
		
		// mRequest : uploadForm.jsp 에서 넘어온 file1,2,3 이 저장된 객체
		if(upload.fileUpload(mRequest)) {
			mav.addObject("result", "파일 업로드 성공");
		}else {
			mav.addObject("result", "파일 업로드 실패");
		}
		
		mav.setViewName("upload_result");
		
		return mav;
	}
}
