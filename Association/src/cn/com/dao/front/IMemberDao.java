package cn.com.dao.front;

import java.util.List;
import java.util.Map;

import cn.com.common.Constants;
import cn.com.model.MembersInfo;

public interface IMemberDao {
	
	//进入主页时查询网站公告信息
	public List queryNotice();
	
	//进入主页时查询学院新闻信息
	public List queryNews();
	
	//进入主页时查询头条新闻信息
	public List queryTopNews();
	
	//进入主页时查询优秀社团信息
	public List queryAssociation();
	
	//进入主页时查询活跃社员信息
	public List queryMember();
	
	//通过社员编号查询该社员所属的社团
	public Map queryAssoByMemberId(String memberId);
	
	//进入通过条件查询社员信息
	public List queryMemberForPage(String strChoice);
	
	//按条件查询社团信息
	public List queryAssoForPage(String strChoice);
	
	//查询指定编号的社团的社员人数
	public int queryAssoNum(final String assoId);
	
	//查询社员留言信息
	public List queryMsgInfo();
	
	//查询社团活动信息
	public List queryAssoActiv();
	
	//新社员注册
	public int addMemberInfo(MembersInfo member);

}
