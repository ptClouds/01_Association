package cn.com.service.admin.impl;

import cn.com.dao.admin.INewsDao;
import cn.com.model.MessageInfo;
import cn.com.model.NewsInfo;
import cn.com.model.SiteNotice;
import cn.com.service.admin.INewsService;

public class NewsService implements INewsService {
	
	private INewsDao adminNewsDao;

	public void setAdminNewsDao(INewsDao adminNewsDao) {
		this.adminNewsDao = adminNewsDao;
	}

	public int addNews(NewsInfo news) {
		// TODO Auto-generated method stub
		return adminNewsDao.addNews(news);
	}
	
	//获取新闻的最大编号，这里本来是要建立序列的，这里直接简单处理了
	public String getSqueNewsID(){
		return adminNewsDao.getSqueNewsID();
	}
	
	//发布公告信息
	public int addNotice(SiteNotice notice){
		return adminNewsDao.addNotice(notice);
	}
	
	//获取公告的最大编号，这里本来是要建立序列的，这里直接简单处理了
	public String getSqueNoticeID(){
		return adminNewsDao.getSqueNoticeID();
	}
	
	//删除留言信息
	public int deleteMsg(MessageInfo msg){
		return adminNewsDao.deleteMsg(msg);
	}
	
	//删除公告信息
	public int deleteNotice(SiteNotice notice){
		return adminNewsDao.deleteNotice(notice);
	}
	
	//删除新闻信息
	public int deleteNews(NewsInfo news){
		return adminNewsDao.deleteNews(news);
	}
	
	//修改公告信息
	public int updateNotice(SiteNotice notice){
		return adminNewsDao.updateNotice(notice);
	}
	
	//更新修改新闻信息
	public int updateNews(NewsInfo news){
		return adminNewsDao.updateNews(news);
	}

}
