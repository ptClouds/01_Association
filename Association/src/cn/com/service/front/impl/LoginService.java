package cn.com.service.front.impl;

import java.util.List;

import cn.com.dao.front.ILoginDao;
import cn.com.model.AdminInfo;
import cn.com.model.MembersInfo;
import cn.com.service.front.ILoginService;

public class LoginService implements ILoginService {
	private ILoginDao frootLoginDao;

	public void setFrootLoginDao(ILoginDao frootLoginDao) {
		this.frootLoginDao = frootLoginDao;
	}

	//前台用户登录
	public int login(MembersInfo member) {
		// TODO Auto-generated method stub
		return frootLoginDao.login(member);
	}
	
	//后台用户登录
	public List login4(AdminInfo admin) {
		// TODO Auto-generated method stub
		return frootLoginDao.login4(admin);
	}
	
	//查询登录用户的详细信息
	public List queryMemberInfo(String memberId){
		return frootLoginDao.queryMemberInfo(memberId);
	}

	public int getAllRowCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getAllRowCount(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getAllRowCount(int typeid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getRowCountByFlag(String id, String flag) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List queryForPage(int offset, int length) {
		// TODO Auto-generated method stub
		return null;
	}

	public List queryForPage(int offset, int length, String strChoice) {
		// TODO Auto-generated method stub
		return null;
	}

	public List queryForPageAblum(int typeid, int offset, int length,
			String flag) {
		// TODO Auto-generated method stub
		return null;
	}

	public List queryPageByFlag(int offset, int length, String id, String flag) {
		// TODO Auto-generated method stub
		return null;
	}

}
