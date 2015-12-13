package com.cngc.pm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cngc.pm.common.web.common.UserUtil;
import com.cngc.pm.service.MessageService;

@Controller
@RequestMapping(value="/message")
public class MessageController {
	
	@Resource
	private MessageService messageService;
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public String list(Model model,HttpSession session){
		
		model.addAttribute("messages", messageService.getByUserId(UserUtil.getUserId(session)).getResult() );
		
		return "/sysmanage/message-list";
	}
	
	@RequestMapping(value="/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") long id,Model model){
		if(id!=0)
			messageService.delById(id);
		
		return "redirect:/message/list";
	}
	
	@RequestMapping(value="/getnotreadcount")
	@ResponseBody
	public Map<String,Object> getNotReadMessageCount(HttpSession session,Model model)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("count", messageService.getNotReadMessageCountByUserId(UserUtil.getUserId(session)));
		
		return map;
	}
	
	@RequestMapping(value="/getnotreadlist")
	@ResponseBody
	public Map<String,Object> getNotReadMessageList(HttpSession session,Model model)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("messages", messageService.getNotReadMessageByUserId(UserUtil.getUserId(session)).getResult());
		
		return map;
	}
	@RequestMapping(value="/getlist")
	@ResponseBody
	public Map<String,Object> getMessageList(HttpSession session,Model model)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("messages", messageService.getByUserId(UserUtil.getUserId(session)).getResult());
		
		return map;
	}
	
	@RequestMapping(value="/read/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> read(@PathVariable("id") long id,Model model){
		Map<String,Object> map = new HashMap<String,Object>();
		if(id!=0)
			messageService.readMessage(id);
		
		map.put("result","ok");
		
		return map;
	}
	
	@RequestMapping(value="/readmessage/{id}", method = RequestMethod.GET)
	public String readmessage(@PathVariable("id") long id,Model model){
		if(id!=0)
			messageService.readMessage(id);
		
		return "redirect:/message/list";
	}

}
