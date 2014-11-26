package cn.com.service.admin.impl;

import java.util.List;

import cn.com.dao.admin.IAdminDao;
import cn.com.model.AdminInfo;
import cn.com.service.admin.IAdminService;

public class AdminService implements IAdminService {
	
	private IAdminDao adminDao;

	public void setAdminDao(IAdminDao adminDao) {
		this.adminDao = adminDao;
	}

	//查询管理员信息
	public List queryAdminInfo() {
		// TODO Auto-generated method stub
		return adminDao.queryAdminInfo();
	}
	
	//添加管理员信息
	public int addAdminInfo(AdminInfo admin){
		return adminDao.addAdminInfo(admin);
	}
	
	//删除管理员信息（其实是做更新操作，将员工状态设置为冻结）
	public int deleteAdmin(AdminInfo admin){
		return adminDao.deleteAdmin(admin);
	}
	
	//通过编号查询管理员信息
	public List queryAdminInfo(String adminId){
		return adminDao.queryAdminInfo(adminId);
	}

}
