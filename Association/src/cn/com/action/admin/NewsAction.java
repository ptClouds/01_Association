package cn.com.action.admin;

import java.util.Date;
import java.util.Map;

import cn.com.actionform.MsgVo;
import cn.com.actionform.NewsVo;
import cn.com.actionform.NoticeVo;
import cn.com.model.AdminInfo;
import cn.com.model.MessageInfo;
import cn.com.model.NewsInfo;
import cn.com.model.SiteNotice;
import cn.com.service.admin.INewsService;

import com.opensymphony.xwork2.ActionContext;

public class NewsAction {
	
	private INewsService adminNewsService;
	
	private NewsVo newsVo;
	
	private MsgVo msgVo;
	
	private NoticeVo noticeVo;
	
	private String noticeContent;
	
	public NoticeVo getNoticeVo() {
		return noticeVo;
	}

	public void setNoticeVo(NoticeVo noticeVo) {
		this.noticeVo = noticeVo;
	}

	public MsgVo getMsgVo() {
		return msgVo;
	}

	public void setMsgVo(MsgVo msgVo) {
		this.msgVo = msgVo;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public NewsVo getNewsVo() {
		return newsVo;
	}

	public void setNewsVo(NewsVo newsVo) {
		this.newsVo = newsVo;
	}

	public void setAdminNewsService(INewsService adminNewsService) {
		this.adminNewsService = adminNewsService;
	}
	
	//发布新闻信息
	public String addNews(){
		Map map = ActionContext.getContext().getSession();
		NewsInfo news = new NewsInfo();
		System.out.println(newsVo.getNewsTitle()+"------newsVo-------"+newsVo.getNewsContent());
		news.setNewsContent(newsVo.getNewsContent());
		news.setNewsId(""+adminNewsService.getSqueNewsID());
		news.setNewsImgLink("");
		news.setNewsPublisher(""+map.get("adminName"));
		news.setNewsStatus("0");
		news.setNewsTitle(newsVo.getNewsTitle());
		news.setPublishDate(new Date());
		if(adminNewsService.addNews(news)>0){
			return "addNews";
		}
		return "error";
	}
	
	//更新修改新闻信息
	public String updateNews(){
		Map map = ActionContext.getContext().getSession();
		NewsInfo news = new NewsInfo();
		news.setNewsContent(newsVo.getUpdateNewsContent());
		news.setNewsId(newsVo.getUpdateNewsId());
		news.setNewsImgLink("");
		news.setNewsPublisher(String.valueOf(map.get("adminName")));
		news.setNewsStatus("0");
		news.setNewsTitle(newsVo.getUpdateNewsTitle());
		news.setPublishDate(new Date());
		try{
			if(adminNewsService.updateNews(news)>0){
				return "updateNews";
			}
		}catch(Exception e){
			return "updateNews";
		}
		return "error";
	}
	
	
	//发布公告信息
	public String addNotice(){
		Map map = ActionContext.getContext().getSession();
		SiteNotice notice = new SiteNotice();
		Map noticemap = ActionContext.getContext().getSession();
		AdminInfo admin = new AdminInfo();
		admin.setAdminId(""+noticemap.get("adminId"));
		System.out.println(admin.getAdminId()+"------addNotice-------"+noticeContent);
		notice.setAdminInfo(admin);
		notice.setNoticeContent("");
		notice.setNoticeId(""+adminNewsService.getSqueNoticeID());
		notice.setNoticeTitle(""+noticeContent);
		notice.setSendTime(new Date());
		if(adminNewsService.addNotice(notice)>0){
			return "addNotice";
		}
		return "error";
	}
	
	//修改公告信息
	public String updateNotice(){
		SiteNotice notice = new SiteNotice();
		Map noticemap = ActionContext.getContext().getSession();
		AdminInfo admin = new AdminInfo();
		admin.setAdminId(String.valueOf(noticemap.get("adminId")));
		System.out.println(admin.getAdminId()+"------------"+noticeVo.getUpdateContent()+"----"+noticeVo.getUpdateNoticId()+"------addNotice-------"+noticeContent);
		notice.setAdminInfo(admin);
		notice.setNoticeContent("");
		notice.setNoticeId(noticeVo.getUpdateNoticId());
		notice.setNoticeTitle(noticeVo.getUpdateContent());
		notice.setSendTime(new Date());
		try{
			if(adminNewsService.updateNotice(notice)>0){
				return "updateNotice";
			}
		}catch(Exception e){
			return "notCheck";
		}
		return "error";
	}
	
	//删除留言信息
	public String deleteMsg(){
		MessageInfo msg = new MessageInfo();
		msg.setMsgId(msgVo.getMsgId());
		if(adminNewsService.deleteMsg(msg)>0){
			return "deleteMsg";
		}else{
			return "error";
		}
		
	}
	
	//删除公告信息
	public String deleteNotice(){
		SiteNotice notice = new SiteNotice();
		notice.setNoticeId(noticeVo.getNoticeId());
		if(adminNewsService.deleteNotice(notice)>0){
			return "deleteNotice";
		}else{
			return "error";
		}
	}
	
	//删除新闻信息
	public String deleteNews(){
		NewsInfo news = new NewsInfo();
		news.setNewsId(newsVo.getNewsId());
		if(adminNewsService.deleteNews(news)>0){
			return "deleteNews";
		}else{
			return "error";
		}
	}
	
	
}
