package cn.com.dao.admin;

import cn.com.model.MessageInfo;
import cn.com.model.NewsInfo;
import cn.com.model.SiteNotice;

public interface INewsDao {
	
	//发布新闻信息
	public int addNews(NewsInfo news);
	
	//获取新闻的最大编号，这里本来是要建立序列的，这里直接简单处理了
	public String getSqueNewsID();
	
	//发布公告信息
	public int addNotice(SiteNotice notice);
	
	//获取公告的最大编号，这里本来是要建立序列的，这里直接简单处理了
	public String getSqueNoticeID();
	
	//删除留言信息
	public int deleteMsg(MessageInfo msg);
	
	//删除公告信息
	public int deleteNotice(SiteNotice notice);
	
	//删除新闻信息
	public int deleteNews(NewsInfo news);
	
	//修改公告信息
	public int updateNotice(SiteNotice notice);
	
	//更新修改新闻信息
	public int updateNews(NewsInfo news);

}
