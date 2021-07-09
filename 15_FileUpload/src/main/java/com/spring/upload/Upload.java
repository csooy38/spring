package com.spring.upload;

import java.awt.PageAttributes.OriginType;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/*
 * MultipartHttpServletRequest
 * - 스프링이 제공하는 인터페이스.
 * - Multipart 요청이 들어올 때 내부적으로 HttpServletRequest 객체를 대신하여 사용되는 객체(인터페이스).
 * - HttpServletRequest 인터페이스와 MultipartRequest 인터페이스를 상속받고 있다.
 * - getParameter() 메서드나 getHeader() 와 같은 메서드를 사용할 수 있으며,
 * 	추가적으로 MultipartRequest 인터페이스가 제공하는 Multipart 관련 메서드를 사용할 수 있다.
 */

/*
 * MultipartRequest 인터페이스의 파일 관련 주요 메서드
 * - Iterator<String> getFilenames()
 * 	==> 업로드된 파일들의 이름 목록을 제공하는 Iterator를 구현하는 메서드.
 * - MultipartFile getFile(String name)
 * 	==> 파라미터 이름 name의 업로드 파일 과년 정보를 구하는 메서드.
 * - List<MultipartFile> getFiles(String name)
 * 	==> 파라미터 이름 name의 업로드 파일 정보 목록을 구하는 메서드.
 */

/*
 * Iterator 객체
 * - 자바 컬렉션 프레임워크에서 컬렉션에 저장되어 있는 요소들을 읽어 오는 방법을 표준화한 객체.
 * - 컬렉션으로부터 정보를 얻어 내는 객체.
 * - Iterator 객체를 사용하게 되면 어떤 컬렉션이라도 동일한 방식으로 접근이 가능하며, 그 안에 있는 데이터들에게 쉽게 접근할 수 있는 방법을 제공한다.
 * - Iterator 객체의 주요 메서드.
 * 	* hasNext() : 읽어올 요소가 남아 있는지 확인하는 메서드. 요소가 있으면  true, 요소가 없으면 false 값을 반환한다.
 * 	* next() : 다음 데이터를 반환하는 메서드.
 * 	* remove() : next() 메서드로 읽어 온 요소를 삭제하는 메서드.
 */


@Service	// 해당 클래스는 비지니스 로직을 수행하는 클래스이다.
public class Upload {
	
	public boolean fileUpload(MultipartHttpServletRequest mRequest) {
		
		boolean isUpload = false;
		
		// upload 폴더의 위치 지정
		// 폴더 하위에 저장되어야 하므로 끝에 "\\"를 붙인다.
		String uploadPath = "C:\\NCS\\spring\\15_FileUpload\\src\\main\\webapp\\resources\\upload\\";
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			// 톰캣에 있는 임시 파일.
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// getOriginalFilename() : 업로드한 파일의 이름을 구하는 메서드
			String originalFileName = mFile.getOriginalFilename();
			
			// 실제적으로 물리적인 파일의 저장 필요
			// 1. 폴더 만들기 = ....\\resources\\upload\\2021-07-06
			String homedir = uploadPath + year + "-" + month + "-" + day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {	// 폴더가 없는 경우 폴더 생성
				path1.mkdirs();
			}
			
			// 2. 실제 파일을 만들기
			String saveFileName = originalFileName;
			
			if(saveFileName != null && !saveFileName.equals("")) {
				// currentTimeMillis() : 1/1000초로 환산되어 진행중인 시간. 중복되기 힘든 시간.
				saveFileName = System.currentTimeMillis() + "_" + saveFileName;	
				
				try {
					
					// ....\\resources\\upload\\2021-07-06\\실제파일이름
					File origin = new File(homedir+"/"+saveFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장하는 메서드.
					mFile.transferTo(origin);
					
					isUpload = true;
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} // if문 end
			
		} // while문 end
		
		return isUpload;
	}

	
	
	
}
