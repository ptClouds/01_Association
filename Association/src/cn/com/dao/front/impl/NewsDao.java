package cn.com.dao.front.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.com.actionform.ValueToolVo;
import cn.com.common.Constants;
import cn.com.common.SubStrTool;
import cn.com.dao.front.INewsDao;

public class NewsDao implements INewsDao{

	private HibernateTemplate newsTemplate;
	
	private ValueToolVo valueVo;
	
	public HibernateTemplate getNewsTemplate() {
		return newsTemplate;
	}

	public void setNewsTemplate(HibernateTemplate newsTemplate) {
		this.newsTemplate = newsTemplate;
	}

	//查询新闻总记录数
	public int getNewsCount() {
		// TODO Auto-generated method stub
		List list = (List) newsTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.GETNEWSFORPAGE);
				return query.list();
				}
			});
		System.out.println(list.size()+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$******************"+list.get(0));
		return list.size();
	}
	
	//查询新闻总记录数
	public int getNewsCount(String strChoice) {
		// TODO Auto-generated method stub
		valueVo = SubStrTool.subStrToVo(strChoice,":");
		List list = (List) newsTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = null;
				if(valueVo.getColumn().equals("newsId")){
					query = session.createQuery(Constants.GETNEWSBYID).setString(
							"newsId", valueVo.getChoice());
				}else{
					query = session.createQuery(Constants.GETNEWSFORPAGE);
				}
				return query.list();
				}
			});
		System.out.println(list.size()+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$******************"+list.get(0));
		return list.size();
	}

	//分页显示新闻信息
	public List queryNewsForPage(final int offset, final int length,String strChoice) {
		// TODO Auto-generated method stub
		valueVo = SubStrTool.subStrToVo(strChoice,":");
		System.out.println(valueVo.getColumn()+"########################%%%%%%%%%%%%%%%"+valueVo.getChoice());
		List list = (List) newsTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = null;
				if(valueVo.getColumn().equals("newsId")){
					query = session.createQuery(Constants.GETNEWSBYID).setString(
							"newsId", valueVo.getChoice());
				}else{
					query = session.createQuery(Constants.GETNEWSFORPAGE);
					query.setFirstResult(offset);
					query.setMaxResults(length);
				}
				List list = query.list();
				return list;
				}
			});
		return list;
	}
	
	//查询社员留言信息
	public List queryMsgInfo(){
		List list = (List) newsTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.QUERYMSGINFO);
				query.setFirstResult(0);
				query.setMaxResults(5);
				return query.list();
				}
			});
		return list;
	}
	

}
