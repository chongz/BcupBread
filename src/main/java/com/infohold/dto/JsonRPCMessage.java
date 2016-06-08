/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.dto;


/**
 * @ClassName: JsonRPCMessage
 * 
 * @Description: 接口返回消息
 * 
 * @author Delong.Yang
 * 
 * @date 2016年4月14日 上午10:16:22
 */
public class JsonRPCMessage {

	private String code;
	private String message;
	private Object data;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
