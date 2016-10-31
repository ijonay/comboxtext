package com.atguigu.jf.console.baseapi.user;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.user.bean.pojo.User;

public interface UserMapper {
	public List<User> selectUserList(Map<String,Object> map);
	
	public Integer selectUserListCount();
}
