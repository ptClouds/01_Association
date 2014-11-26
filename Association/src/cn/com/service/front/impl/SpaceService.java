package cn.com.service.front.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.dao.front.ISpaceDao;
import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;
import cn.com.service.front.ISpaceService;

public class SpaceService implements ISpaceService {
	
	private ISpaceDao spaceDao;

	public void setSpaceDao(ISpaceDao spaceDao) {
		this.spaceDao = spaceDao;
	}
	
	//获取个人主页要显示的信息集合
	public Map getSpaceInfo(String memberId){
		Map map = new HashMap();
		map.put("querySpaceUserByID", spaceDao.querySpaceUserByID(memberId));
		map.put("querySpaceMsgByID", spaceDao.querySpaceMsgByID(memberId));
		map.put("querySpaceAssoByID", spaceDao.querySpaceAssoByID(memberId));
		map.put("queryAssoByIDStatus", spaceDao.queryAssoByIDStatus(memberId));
		map.put("queryAssoAllInfo", spaceDao.queryAssoAllInfo());
		return map;
	}
	
	//查询指定编号的社团的社员人数
	public int queryAssoNum(String assoId){
		return spaceDao.queryAssoNum(assoId);
	}
	
	//处理社员申请社团
	public int addContact(ContactInfo contact){
		return spaceDao.addContact(contact);
	}
	
	// 注册社团
	public int addAssoInfo(AssociationInfo asso){
		return spaceDao.addAssoInfo(asso);
	}

}
