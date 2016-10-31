package com.atguigu.jf.console.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.baseapi.user.UserMapper;
import com.atguigu.jf.console.user.bean.pojo.User;
import com.atguigu.jf.console.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	public List<User> queryUserList(Map<String,Object> map) {
		return userMapper.selectUserList(map);
	}

	@Override
	public Integer queryUserListCount() {
		return userMapper.selectUserListCount();
	}
	
	

}
