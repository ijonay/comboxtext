package com.atguigu.jf.console.user.service;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.user.bean.pojo.User;

public interface UserService {

	public List<User> queryUserList(Map<String,Object> map);

	public Integer queryUserListCount();
}
