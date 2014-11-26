package cn.com.service.front;

import java.util.List;
import java.util.Map;

import cn.com.model.MembersInfo;

public interface IMemberService {
	
	//主页要显示的信息集合
	public Map showMainInfo();
	
	//通过社员编号查询该社员所属的社团
	public Map queryAssoByMemberId(String memberId);

	//进入通过条件查询社员信息
	public List queryMemberForPage(String strChoice);
	
	//按条件查询社团信息
	public List queryAssoForPage(String strChoice);
	
	//查询指定编号的社团的社员人数
	public int queryAssoNum(final String assoId);
	
	//新社员注册
	public int addMemberInfo(MembersInfo member);
}
