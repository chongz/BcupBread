/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.client;

import com.infohold.dto.JsonRPCMessage;
import com.infohold.utils.JsonRPCClientUtil;

import java.util.HashMap;

/**
 * @ClassName: JsonRPCClient
 * 
 * @Description: 客户端请求服务接口
 * 
 * @author Delong.Yang
 * 
 * @date 2016年4月14日 上午10:16:22
 */
public class JsonRPCClient {
	
	/**
	 * 获取原料
	 * @return
	 * @throws Exception
	 */
	public static JsonRPCMessage getMaterials(String materialKind) throws Exception {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("materialKind", materialKind);
		JsonRPCMessage message = JsonRPCClientUtil.invoke("getMaterials", params);
		return message;
	}
	
	public static void main(String[] args) throws Exception {
		getMaterials("3");
	}
}
