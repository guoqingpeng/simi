package org.simi.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 微信配置获取工具类
 * @author daiying.zhang
 *
 */
public class PastUtil {
	public static String token = null;
	public static String time = null;
	public static String jsapi_ticket = null;
	public static String app_id = null;

	/**
	 * 
	 * @param appId
	 *            公账号appId
	 * @param appSecret
	 * @param url
	 *            当前网页的URL，不包含#及其后面部分
	 * @return
	 */
	public static Map<String, String> getParam(String appId, String appSecret) {
		app_id = appId;
		if (jsapi_ticket == null) {
			token = CommonUtil.getAccess_token(appId, appSecret);
			jsapi_ticket = CommonUtil.getJsApiTicket(token);
			time = getTime();
		} else {
			if (!time.substring(0, 13).equals(getTime().substring(0, 13))) { // 每小时刷新一次
				token = CommonUtil.getAccess_token(appId, appSecret);
				jsapi_ticket = CommonUtil.getJsApiTicket(token);
				time = getTime();
			}
		}

		String url = getUrl();
		//System.out.println("aaaaa:"+jsapi_ticket);
		Map<String, String> params = sign(jsapi_ticket, url);
		params.put("appid", appId);
		params.put("access_token", token);
//		JSONObject jsonObject = JSONObject.fromObject(params);
//		String jsonStr = jsonObject.toString();
//		System.out.println(jsonStr);
		return params;
	}
    
	/**
	 * 获取访问url
	 * @return
	 */
	public  static String getUrl() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		StringBuffer requestUrl = request.getRequestURL();
		String queryString = request.getQueryString();
		String url = requestUrl + "?" + queryString;
		System.out.println(url);
		return url;
	}
    
	/**
	 * 获取签名
	 * @param jsapi_ticket
	 * @param url
	 * @return
	 */
	public static Map<String, String> sign(String jsapi_ticket, String url) {
		Map<String, String> ret = new HashMap<String, String>();
		String nonce_str = create_nonce_str();
		String timestamp = create_timestamp();
		String str;
		String signature = "";
		//没有参数时，去掉null
		if (url.contains("?null")) {
			
			url = url.replace("?null", "");
		}
		// 注意这里参数名必须全部小写，且必须有序
		str = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + nonce_str
				+ "&timestamp=" + timestamp + "&url=" + url;

		try {
			MessageDigest crypt = MessageDigest.getInstance("SHA-1");
			crypt.reset();
			crypt.update(str.getBytes("UTF-8"));
			signature = byteToHex(crypt.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		ret.put("url", url);
		ret.put("jsapi_ticket", jsapi_ticket);
		ret.put("nonceStr", nonce_str);
		ret.put("timestamp", timestamp);
		ret.put("signature", signature);
		ret.put("appid", app_id);
		ret.put("access_token", token);

		return ret;
	}

	private static String byteToHex(final byte[] hash) {
		Formatter formatter = new Formatter();
		for (byte b : hash) {
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}

	private static String create_nonce_str() {
		return UUID.randomUUID().toString();
	}

	private static String create_timestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}

	// 获取当前系统时间 用来判断access_token是否过期
	public static String getTime() {
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(dt);
	}
	
	/**
	 * 测试类
	 * @param args
	 */
	public static void main(String[] args) {
//		Map<String, String>  map = new HashMap<String, String>();
//		map = PastUtil.getParam("wx07 = new HashMap<String, String>();
//		map = sign(p, getUrl());
//		System.out.println(map.toString());
	}
	
	public static Map<String, String>  getWxConfig(){
		Map<String, String>  map = new HashMap<String, String>();
		map = PastUtil.getParam("wx0738861136c0affb", "942a42d4ee8b21163ee54cddad1ccf02");
		return map;
		
	}
	
}