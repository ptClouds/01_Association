package cn.com.dao.admin;

import java.util.List;
import java.util.Map;

import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;
import cn.com.model.MembersInfo;

public interface IUsersDao {
	
	//分页查询社员信息
	public List queryMember();
	
	//通过社员编号查询该社员所属的社团
	public Map queryAssoByMemberId(String memberId);
	
	//后台查询申请加入社团而未审核的信息
	public List showNotDealContact(String status);
	
	//社员入社审批
	public int dealJoinAssoInfo(ContactInfo contact);
	
	//查询待审批或已审批的社团信息
	public List showDealAsso(String status);
	
	//社团审批
	public int dealApplyAsso(AssociationInfo asso);
	
	//删除社员信息
	public int updateMemberInfo(MembersInfo member);
	public int updateEmberStatus(MembersInfo member);
	
	//查询新注册待审核社员信息
	public List getNotDealMember(final String status);
	
}
