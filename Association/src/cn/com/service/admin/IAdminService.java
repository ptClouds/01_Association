package cn.com.service.admin;

import java.util.List;

import cn.com.model.AdminInfo;

public interface IAdminService {
	
	//查询管理员信息
	public List queryAdminInfo();
	
	//通过编号查询管理员信息
	public List queryAdminInfo(String adminId);
	
	//添加管理员信息
	public int addAdminInfo(AdminInfo admin);
	
	//删除管理员信息（其实是做更新操作，将员工状态设置为冻结）
	public int deleteAdmin(AdminInfo admin);

}
