/*
 * Created by zhangchong on 5/30/2016.
 * Copyright (c) 2016 com.infohold.BcupBread. All rights reserved.
 */

package com.infohold.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;


/**
 * @ClassName: CupUtils
 * 
 * @Description: 工具类
 * 
 * @author Delong.Yang
 * 
 * @date 2016年4月14日 上午10:16:22
 */
public final class CupUtils {

	private CupUtils() {

	}

	/**
     * 将Json对象转换Map
     * 
     * @param jsonObject
     *            json对象
     * @return Map对象
     * @throws JSONException
     */
    public static Map<String, Object> toMap(Object obj) throws JSONException {

        JSONObject jsonObject = JSONObject.fromObject(obj);
        
        Map<String, Object> result = new HashMap<String, Object>();
        
        Iterator<?> iterator = jsonObject.keys();
        String key = null;
        String value = null;
        
        while (iterator.hasNext()) {

            key = (String) iterator.next();
            value = jsonObject.getString(key);
            result.put(key, value);

        }
        return result;

    }

}
