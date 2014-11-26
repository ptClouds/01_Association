package cn.com.dao.admin.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.com.common.Constants;
import cn.com.dao.admin.INewsDao;
import cn.com.model.MessageInfo;
import cn.com.model.NewsInfo;
import cn.com.model.SiteNotice;

public class NewsDao implements INewsDao {
	private HibernateTemplate adminnewsTemplate;

	public void setAdminnewsTemplate(HibernateTemplate adminnewsTemplate) {
		this.adminnewsTemplate = adminnewsTemplate;
	}

	//发布新闻信息
	public int addNews(NewsInfo news) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		try {
			System.out.println("========newsID============="+news.getNewsId());
			//adminnewsTemplate.saveOrUpdate(news.getNewsId(), news);
			adminnewsTemplate.save(news);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	//获取新闻的最大编号，这里本来是要建立序列的，这里直接简单处理了
	public String getSqueNewsID(){
		List list= adminnewsTemplate.find(Constants.GETSEQUNEWSID);
		Iterator it = list.iterator();
		NewsInfo news = new NewsInfo();
		while(it.hasNext()){
			news = (NewsInfo) it.next();
			System.out.println("----------seque------------"+news.getNewsId());
		}
		news = (NewsInfo) adminnewsTemplate.find(Constants.GETSEQUNEWSID).get(0);
		String sequeID = String.valueOf(Integer.parseInt(""+news.getNewsId())+1);
		System.out.println("----------sequeID------------"+sequeID);
		return sequeID;
	}
	
	//发布公告信息
	public int addNotice(SiteNotice notice){
		try {
			System.out.println("========newsID============="+notice);
			//adminnewsTemplate.saveOrUpdate(news.getNewsId(), news);
			adminnewsTemplate.save(notice);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	//获取公告的最大编号，这里本来是要建立序列的，这里直接简单处理了
	public String getSqueNoticeID(){
		List list= adminnewsTemplate.find(Constants.GET_SEQUE_NOTICEID);
		Iterator it = list.iterator();
		SiteNotice notice = new SiteNotice();
		String sequeID = "110000";
		while(it.hasNext()){
			notice = (SiteNotice) it.next();
			System.out.println("----------seque------------"+notice.getNoticeId());
		}
		if(adminnewsTemplate.find(Constants.GET_SEQUE_NOTICEID).size()!=0){
			notice = (SiteNotice) adminnewsTemplate.find(Constants.GET_SEQUE_NOTICEID).get(0);
			sequeID = String.valueOf(Integer.parseInt(""+notice.getNoticeId())+1);
		}
		System.out.println("----------sequeID------------"+sequeID);
		return sequeID;
	}
	
	//删除留言信息
	public int deleteMsg(MessageInfo msg){
		try {
			adminnewsTemplate.delete(msg);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	//删除公告信息
	public int deleteNotice(SiteNotice notice){
		try {
			adminnewsTemplate.delete(notice);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	//删除新闻信息
	public int deleteNews(NewsInfo news){
		try {
			adminnewsTemplate.delete(news);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	//修改公告信息
	public int updateNotice(SiteNotice notice){
		try {
			adminnewsTemplate.update(notice);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	//更新修改新闻信息
	public int updateNews(NewsInfo news){
		try {
			adminnewsTemplate.update(news);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}

}
