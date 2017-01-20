package com.cngc.pm.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

import com.cngc.pm.common.web.common.UserUtil;
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
	@Autowired
	private UserUtil userUtil;
	
	Set<Moudle> moudleSet0 = new LinkedHashSet<>();
	
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
	
	@RequestMapping(value = "/menu-json", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody  
	//public String menuJson(@RequestParam String reqUrl,Authentication authentication, HttpSession session, HttpServletRequest request) {
	public String menuJson(Authentication authentication, HttpSession session, HttpServletRequest request) {	
		SysUser user = userService.getByUsername(((UserDetails)authentication.getPrincipal()).getUsername());
		String contextPath = userUtil.getContextPath(session);
		StringBuffer sb = new StringBuffer("[");
		Set<Moudle> moudleSet = new HashSet<>();
		for(Role role : userService.getRolesByUser(user.getId())) {
			//取出所有拥有角色的菜单
			moudleSet.addAll(role.getModules());
		}
		
		//set -> array
		List<Moudle> list = new ArrayList<Moudle>(moudleSet);
		
		Collections.sort(list);
		
		if(!userUtil.IsCommonUser(authentication)) {
			sb.append("{\"text\":\"快速链接\",\"state\":{\"expanded\":false},\"id\":\"0\",\"nodeId\":\"0\",\"nodes\":[{\"text\":\"待办任务\",\"icon\":\"glyphicon glyphicon-th-list\",\"id\":\"00\", \"nodeId\":\"00\",\"href\":\""+contextPath+"/workflow/task/mytask\"},");
			if(userUtil.IsLeader(authentication) || userUtil.IsAdmin(authentication)) {
				sb.append("{\"text\":\"运维控制台\",\"icon\":\"glyphicon glyphicon-star\",\"id\":\"000\",\"href\":\""+contextPath+"/workflow/task/board\"},");
			}
			sb.append("{\"text\":\"领导交办\",\"icon\":\"glyphicon glyphicon-user\",\"id\":\"0000\",\"href\":\""+contextPath+"/leadertask/list\"},{\"text\":\"日常巡检\",\"icon\":\"glyphicon glyphicon-calendar\",\"id\":\"000000\",\"href\":\""+contextPath+"/record/inspection\"}]},");
		}
		for(Moudle mod : list) {
			
			if(mod.getParent() == null) {	//顶级目录
				if(!moudleSet0.contains(mod)) {			//如果有相同的菜单，则不处理
					sb.append("{\"text\":\""+mod.getName()+"\",\"state\":{\"expanded\":false},\"id\":\""+mod.getId()+"\", \"nodeId\":\""+mod.getId()+"\",");
					
					sb = getSubmenu(sb, mod, list, contextPath);
					
					sb.append("},");
					
					moudleSet.add(mod);
				}
				
				
			}
		}
		sb = sb.deleteCharAt( sb.length()-1);
		sb.append("]");
		//
		return sb.toString();
	}
	
	/**
	 * @param sb
	 * @param mod
	 * @return
	 */
	private StringBuffer getSubmenu(StringBuffer sb, Moudle mod, List<Moudle> moudles ,String contextPath) {
		// TODO Auto-generated method stub
			
			sb.append("\"nodes\":[");
			for(Moudle mo1 : mod.getChild()) {
				
				for(Moudle mo2 : moudles) {
					if(mo1 == mo2) {
						if(!moudleSet0.contains(mo1)) {
							if(mo1.getChild().size()>0) {
								sb .append("{\"text\":\""+mo1.getName()+"\",\"href\":\""+contextPath+mo1.getUrl()+"\", \"id\":\""+mo1.getId()+"\", \"nodeId\":\""+mo1.getId()+"\",");
							
							
								sb = getSubmenu(sb, mo1, moudles, contextPath);
							} else {
								sb .append("{\"text\":\""+mo1.getName()+"\",\"href\":\""+contextPath+mo1.getUrl()+"\",\"icon\":\""+mo1.getStyleClass()+"\", \"id\":\""+mo1.getId()+"\", \"nodeId\":\""+mo1.getId()+"\"");
							}
							
							moudleSet0.add(mo1);
							sb.append("},");
						}
					}
				}
				
			}
			sb = sb.deleteCharAt( sb.length()-1);
			sb.append("]");
		
		return sb;
	}
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	//public String menu(@RequestParam String reqUrl, Model model) {		//菜单准确性需要
	public String menu(Model model) {	
		UserDetails user1 = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		SysUser user = userService.getByUsername(user1.getUsername());

		model.addAttribute("user", user);
		
		//model.addAttribute("reqestUrl", reqUrl);

		return "public/menu";
	}
	
	@RequestMapping(value = "/contentbuttons", method = RequestMethod.GET)
	public String contentButtons() {
		
		return "public/content_buttons";
	}
}
