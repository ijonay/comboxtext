package com.atguigu.jf.console.baseapi.user;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.user.bean.pojo.User;

public interface UserMapper {
	public List<User> selectUserList(Map<String,Object> map);
	//这是我加的代码！
	public Integer selectUserListCount();
}
