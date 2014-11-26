package cn.com.service.admin.impl;

import java.util.List;
import java.util.Map;

import cn.com.dao.admin.IUsersDao;
import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;
import cn.com.model.MembersInfo;
import cn.com.service.admin.IUsersService;

public class UsersService implements IUsersService{
	
	private IUsersDao adminUsersDao;

	public void setAdminUsersDao(IUsersDao adminUsersDao) {
		this.adminUsersDao = adminUsersDao;
	}
	
	//分页查询社员信息
	public List queryMember(){
		return adminUsersDao.queryMember();
	}
	
	//通过社员编号查询该社员所属的社团
	public Map queryAssoByMemberId(String memberId){
		return adminUsersDao.queryAssoByMemberId(memberId);
	}
	
	//后台查询申请加入社团而未审核的信息
	public List showNotDealContact(String status){
		return adminUsersDao.showNotDealContact(status);
	}
	
	//社员入社审批
	public int dealJoinAssoInfo(ContactInfo contact){
		return adminUsersDao.dealJoinAssoInfo(contact);
	}
	
	//查询待审批或已审批的社团信息
	public List showDealAsso(String status){
		return adminUsersDao.showDealAsso(status);
	}
	
	//社团审批
	public int dealApplyAsso(AssociationInfo asso){
		return adminUsersDao.dealApplyAsso(asso);
	}
	
	//删除社员信息
	public int updateMemberInfo(MembersInfo member){
		return adminUsersDao.updateMemberInfo(member);
	}
	
	public int updateEmberStatus(MembersInfo member){
		return adminUsersDao.updateEmberStatus(member);
	}
	
	//查询新注册待审核社员信息
	public List getNotDealMember(final String status){
		return adminUsersDao.getNotDealMember(status);
	}

}
