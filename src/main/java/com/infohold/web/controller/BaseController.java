/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @ClassName: BaseController
 * 
 * @Description: 基础Controller
 * 
 * @author Delong.Yang
 * 
 * @date 2016年4月14日 上午10:16:22
 */
public class BaseController {
	
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpServletResponse response;

	@Autowired
	protected Map<String, Object> session;

	@Value("#{config.serviceImgURL}")
	protected String serviceImgURL;

	/**
	 * 获取基础路径
	 * 
	 * @return
	 */
	public String getBasePath() {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";

		return basePath;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public String getServiceImgURL() {
		return serviceImgURL;
	}

	public void setServiceImgURL(String serviceImgURL) {
		this.serviceImgURL = serviceImgURL;
	}
	
	
}
