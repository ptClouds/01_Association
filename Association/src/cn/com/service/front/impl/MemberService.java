package cn.com.service.front.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.dao.front.IMemberDao;
import cn.com.model.MembersInfo;
import cn.com.service.front.IMemberService;

public class MemberService implements IMemberService {
	private IMemberDao memberDao;
	
	public void setMemberDao(IMemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	/**
	 * 主页要显示的信息集合
	 * @return 返回一个map集合
	 */
	public Map showMainInfo() {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("queryNotice",memberDao.queryNotice());
		map.put("queryNews",memberDao.queryNews());
		map.put("queryTopNews",memberDao.queryTopNews());
		map.put("queryAssociation",memberDao.queryAssociation());
		map.put("queryMember",memberDao.queryMember());
		map.put("queryMsgInfo",memberDao.queryMsgInfo().get(0));//只查询了五条记录
		map.put("queryMsgAll",memberDao.queryMsgInfo().get(1));//查询了全部社员留言记录
		map.put("queryActivInfo",memberDao.queryAssoActiv().get(0));//只查询了五条记录
		map.put("queryActivAll",memberDao.queryAssoActiv().get(1));//查询了全部社团活动记录
		return map;
	}
	
	//通过社员编号查询该社员所属的社团
	public Map queryAssoByMemberId(String memberId){
		return memberDao.queryAssoByMemberId(memberId);
	}
	
	//进入通过条件查询社员信息
	public List queryMemberForPage(String strChoice){
		return memberDao.queryMemberForPage(strChoice);
	}
	
	//按条件查询社团信息
	public List queryAssoForPage(String strChoice){
		return memberDao.queryAssoForPage(strChoice);
	}
	
	//查询指定编号的社团的社员人数
	public int queryAssoNum(final String assoId){
		return memberDao.queryAssoNum(assoId);
	}
	
	//新社员注册
	public int addMemberInfo(MembersInfo member){
		return memberDao.addMemberInfo(member);
	}

}
