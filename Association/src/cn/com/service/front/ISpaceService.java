package cn.com.service.front;

import java.util.List;
import java.util.Map;

import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;

public interface ISpaceService {
	
	//获取个人主页要显示的信息集合
	public Map getSpaceInfo(String memberId);
	
	//查询指定编号的社团的社员人数
	public int queryAssoNum(String assoId);
	
	//处理社员申请社团
	public int addContact(ContactInfo contact);
	
	// 注册社团
	public int addAssoInfo(AssociationInfo asso);

}
