package com.myweb.www.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

///또는 WebApplicationInitializer 상속
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {RootConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {ServletConfiguration.class};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}

	//EncodingFilter 설정
	@Override
	protected Filter[] getServletFilters() {
		// filter 설정
		CharacterEncodingFilter encoding = new CharacterEncodingFilter();
		encoding.setEncoding("UTF-8");
		encoding.setForceEncoding(true); //외부로 나가는 데이터도 인코딩 설정
		
		return new Filter[] {encoding};
	}

	@Override
	protected void customizeRegistration(Dynamic registration) {
		// 그외 기타 사용자 설정
		// 사용자 지정 익셉션 처리 지정
		
		// 파일 업로드 설정
		String uploadLocation = "D:\\_myProject\\_java\\_fileUpload";
		int maxFileSize = 1024*1024*20; //20M
		int maxRequestSize = maxFileSize * 2; //40M
		int fileSizeThreshold = maxFileSize; // 20M
	
		// multipartConfig 설정
		MultipartConfigElement multiPartConfig = 
				new MultipartConfigElement(uploadLocation, maxFileSize, maxRequestSize, fileSizeThreshold);
		registration.setMultipartConfig(multiPartConfig);
	}
	
	
}
