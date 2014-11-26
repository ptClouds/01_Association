package cn.com.dao.front;

import java.util.List;

import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;

public interface ISpaceDao {
	
	//按编号查询社员详细信息
	public List querySpaceUserByID(String memberId);
	
	//按编号查询社员留言信息
	public List querySpaceMsgByID(String memberId);
	
	//按编号查询社员参加的社团信息
	public List querySpaceAssoByID(String memberId);
	
	//查询指定编号的社团的社员人数
	public int queryAssoNum(String assoId);
	
	//处理社员申请社团
	public int addContact(ContactInfo contact);
	
	// 注册社团
	public int addAssoInfo(AssociationInfo asso);
	
	// 查询指定编号社员申请的未审核的社团信息
	public List queryAssoByIDStatus(String memberId);
	
	// 查询新注册的社团信息
	public List queryAssoAllInfo();

}
