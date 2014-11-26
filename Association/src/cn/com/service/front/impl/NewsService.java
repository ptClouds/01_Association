package cn.com.service.front.impl;

import java.util.List;

import cn.com.dao.front.IMemberDao;
import cn.com.dao.front.INewsDao;
import cn.com.service.front.INewsService;

public class NewsService implements INewsService {
	private INewsDao newsDao;
	
	public INewsDao getNewsDao() {
		return newsDao;
	}
	public void setNewsDao(INewsDao newsDao) {
		this.newsDao = newsDao;
	}
	
	//分页查询新闻信息
	public List queryForPage(int offset, int length, String strChoice) {
		// TODO Auto-generated method stub
		return newsDao.queryNewsForPage(offset, length,strChoice);
	}
	
	public List queryForPage(int offset, int length) {
		// TODO Auto-generated method stub
		return null;
	}
	//查询新闻总记录数
	public int getAllRowCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//查询社员留言信息
	public List queryMsgInfo(){
		return newsDao.queryMsgInfo();
	}

	public int getAllRowCount(String id) {
		// TODO Auto-generated method stub
		return newsDao.getNewsCount(id);
	}

	public int getAllRowCount(int typeid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getRowCountByFlag(String id, String flag) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List queryForPageAblum(int typeid, int offset, int length,
			String flag) {
		// TODO Auto-generated method stub
		return null;
	}

	public List queryPageByFlag(int offset, int length, String id, String flag) {
		// TODO Auto-generated method stub
		return null;
	}

}
