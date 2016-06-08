/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.utils;

import com.googlecode.jsonrpc4j.JsonRpcHttpClient;
import com.infohold.dto.JsonRPCMessage;
import net.sf.json.JSONObject;
import org.apache.commons.collections.MapUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName: JsonRPCClientUtil
 * 
 * @Description: JSONRPC请求工具
 * 
 * @author Delong.Yang
 * 
 * @date 2016年4月14日 上午10:16:22
 */
@Component
public final class JsonRPCClientUtil {

	public static final String ATTRIBUTE_POTAL_SESSION = "ATTRIBUTE_POTAL_SESSION";

	/**
	 * 会话失效
	 */
	public static final String EXP_C0005 = "C0005";

	/**
	 * 门户端异常Code 会话失效
	 */
	public static final String EXP_AE00001 = "AE00001";

	/**
	 * 系统异常
	 */
	public static final String EXP_SE00000 = "SE00000";

	public static final String EXP_LSE000001 = "EXP_LSE000001";
	
	/**
	 * 日志
	 */
	public static final Logger LOGGER = Logger.getLogger(JsonRPCClientUtil.class);
	
	/**
	 * 服务地址
	 */
	@Value("#{config.serviceURL}")
	private static String serviceURL;

	private static JsonRpcHttpClient client;
	
	private JsonRPCClientUtil() {

	}

	private static JsonRpcHttpClient getClient() throws MalformedURLException {

//		String serviceUrl = "http://114.215.115.108:8090/CupcakeService/jsonrpc/smartengines";
		JsonRpcHttpClient c = new JsonRpcHttpClient(new URL(serviceURL));

		return c;
	}

	public static com.alibaba.fastjson.JSONObject invokeJSONObj(String methodName, Map<String, Object> params) {
		Map<String, Object> reqParams = new HashMap<String, Object>();

		try {
			if (client == null) {
				client = getClient();
			}

            if (MapUtils.isNotEmpty(params)) {
                reqParams.putAll(params);
            }

			com.alibaba.fastjson.JSONObject json = client.invoke(methodName, new Object[] { reqParams }, com.alibaba.fastjson.JSONObject.class);
			JsonRPCClientUtil.LOGGER.info(json);
			return json;

		} catch (MalformedURLException e) {
			e.printStackTrace();

		} catch (Throwable e) {
			e.printStackTrace();
		}

		return new com.alibaba.fastjson.JSONObject();
	}

	public static JsonRPCMessage invoke(String methodName, Map<String, Object> params) {

		JsonRPCMessage message = new JsonRPCMessage();

		Map<String, Object> reqParams = new HashMap<String, Object>();

		if (MapUtils.isNotEmpty(params)) {
			reqParams.putAll(params);
		}

		try {
			if (client == null) {
				client = getClient();
			}

			JSONObject json = client.invoke(methodName, new Object[] { reqParams },JSONObject.class);
			
			JsonRPCClientUtil.LOGGER.info(json);
			message.setCode((String) json.get("repCode"));
			message.setMessage((String) json.get("repMSG"));
			message.setData(json.get("repData"));
			
			return message;

		} catch (MalformedURLException e) {
			e.printStackTrace();
			message.setCode(EXP_LSE000001);
			message.setMessage(e.getMessage());

			return message;
		} catch (Throwable e) {
			e.printStackTrace();
			message.setCode(EXP_LSE000001);
			message.setMessage(e.getMessage());

			return message;
		}

	}

	public String getServiceURL() {
		return serviceURL;
	}
	
	@Value("#{config.serviceURL}")
	public void setServiceURL(String serviceURL) {
		JsonRPCClientUtil.serviceURL = serviceURL;
	}
	
	
}
