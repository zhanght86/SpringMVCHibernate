package com.cngc.pm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cngc.pm.model.Moudle;
import com.cngc.pm.model.Role;
import com.cngc.pm.model.SysUser;
import com.cngc.pm.service.UserService;

@Controller
public class SystemController {

	@Resource
	private UserService userService;
	@Autowired
	SessionRegistry sessionRegistry;
	
	@ModelAttribute("currentUsers")  
	public List<String> getCurrentUsers() {
		List<String> list = new ArrayList<>();
		List<Object> slist =sessionRegistry.getAllPrincipals();
		for(int i=0; i<slist.size(); i++) {
			 //List<SessionInformation> sessionList = sessionRegistry.getAllSessions(slist.get(i),true);  
			User user=(User)slist.get(i); 
			
			list.add(user.getUsername());
		}
	   return list;  
	} 
	@RequestMapping(value = "/getcurrentusers", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getCurrentUsers(Model model, HttpSession session, Authentication authentication)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<>();
		List<Object> slist =sessionRegistry.getAllPrincipals();
		for(int i=0; i<slist.size(); i++) {
			 //List<SessionInformation> sessionList = sessionRegistry.getAllSessions(slist.get(i),true);  
			User user=(User)slist.get(i); 
			list.add( userService.getUserName(user.getUsername()) );
		}
		map.put("users", list);
		return map;
	}
	
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public String header() {
		
		return "public/header";
	}
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String menu(Model model) {
		
		UserDetails user1 = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		SysUser user = userService.getByUsername(user1.getUsername());

		//List<Moudle> menu1 = new ArrayList<>();
		Set<Moudle> menu1 = new LinkedHashSet<>();
		//List<Moudle> menu2 = new ArrayList<>();
		Set<Moudle> menu2 =  new LinkedHashSet<>();
		//for(Role role : user.getRoles()) {
		for(Role role : userService.getRolesByUser(user.getId())) {
			for(Moudle mod : role.getModules()) {
				if(mod.isEnable()) {
					//int level = mod.getLevel();
					int level = mod.reaches();
					if(level == 0) {
						menu1.add(mod);
					} else if(level == 1) {
						menu2.add(mod);
					}
				}
			}
		}
		
		model.addAttribute("menu1", menu1);
		model.addAttribute("menu2", menu2);
		model.addAttribute("user", user);

		//model.addAttribute("lastLogin", user.getLastWhile());
		
		return "public/menu";
	}
	
	@RequestMapping(value = "/contentbuttons", method = RequestMethod.GET)
	public String contentButtons() {
		
		return "public/content_buttons";
	}
}
