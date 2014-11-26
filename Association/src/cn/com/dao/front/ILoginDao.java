package cn.com.dao.front;

import java.util.List;

import cn.com.model.AdminInfo;
import cn.com.model.MembersInfo;

public interface ILoginDao {
	//前台用户登录
	public int login(MembersInfo member);
	
	//查询登录用户的详细信息
	public List queryMemberInfo(String memberId);
	
	//后台用户登录
	public List login4(AdminInfo admin) ;

}
