package com.cngc.utils;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

public class MD5Tools {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println(getMd5("user","user"));/workflow/task/list
		PathMatcher  urlMatcher = new AntPathMatcher();
		
		System.out.println(urlMatcher.matchStart( "/PmSys/workflow/task/list","/PmSys/workflow/task/list"));
	}

	public static String getMd5(String password, String salt){
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();   
		String result = "d:/123/456/789.txt".replaceAll("/[^/]+$","");
		System.out.println(result);
		
		return md5.encodePassword(password, salt);
	}
}
