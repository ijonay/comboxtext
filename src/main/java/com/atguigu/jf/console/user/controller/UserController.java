package com.atguigu.jf.console.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.atguigu.jf.console.user.bean.pojo.User;
import com.atguigu.jf.console.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="queryUserList",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject queryUserList(int start,int limit){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("limit", limit);
		List<User> ulist = userService.queryUserList(map);
		
		JSONObject obj = new JSONObject();
		obj.put("total", userService.queryUserListCount());
		obj.put("rows", ulist);
		return obj;
	}

	@RequestMapping(value="queryUserCombox",method=RequestMethod.GET)
	@ResponseBody
	public List<JSONObject> queryUserCombox(){
		Map<String,Object> map = new HashMap<String, Object>();
		List<User> ulist = userService.queryUserList(map);
		List<JSONObject> list = new ArrayList<JSONObject>();
		JSONObject obj = null;
		for (User user : ulist) {
			obj = new JSONObject();
			obj.put("id", user.getId());
			obj.put("name", user.getName());
			list.add(obj);
		}
		return list;
	}
	
	
}
