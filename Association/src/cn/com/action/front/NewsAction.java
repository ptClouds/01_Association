package cn.com.action.front;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.com.actionform.PageForm;
import cn.com.common.PageBean;
import cn.com.service.front.INewsService;

public class NewsAction {
	private INewsService newsService;
	private int page;//第几页
	private PageForm pageBean;//封装分页信息的bean对象
	private String strChoice;//条件查询新闻信息，设置条件，之后进行分割
	private String newsFlag;
	public INewsService getNewsService() {
		return newsService;
	}
	
	public String getNewsFlag() {
		return newsFlag;
	}

	public void setNewsFlag(String newsFlag) {
		this.newsFlag = newsFlag;
	}



	public void setNewsService(INewsService newsService) {
		this.newsService = newsService;
	}

	public String getStrChoice() {
		return strChoice;
	}

	public void setStrChoice(String strChoice) {
		this.strChoice = strChoice;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageForm getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageForm pageBean) {
		this.pageBean = pageBean;
	}


	//分页查询新闻信息
	public String queryNewsForPage(){
		this.pageBean = PageBean.queryForPage(newsService, 3, page,strChoice);
		List newsListById = this.pageBean.getList();
		
		this.pageBean = PageBean.queryForPage(newsService, 3, page,"");
		List msgList = this.pageBean.getList();
		
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("newsList", msgList);
		request.put("newsListById", newsListById);
		return "showNewsForPage";
	}
	
	//查询社员留言信息
	public String showNewsInfo(){
		this.pageBean = PageBean.queryForPage(newsService, 10000, 1,"");
		List msgList = this.pageBean.getList();
		
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("newsList", msgList);
		request.put("newsFlag", newsFlag);
		return "showNewsInfo";
	}

}
