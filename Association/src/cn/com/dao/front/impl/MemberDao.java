package cn.com.dao.front.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.com.actionform.AssoActivVo;
import cn.com.actionform.ValueToolVo;
import cn.com.common.Constants;
import cn.com.common.ModelToVoTool;
import cn.com.common.SubStrTool;
import cn.com.dao.front.IMemberDao;
import cn.com.model.AssoActivities;
import cn.com.model.AssociationInfo;
import cn.com.model.MembersInfo;

public class MemberDao implements IMemberDao {
	
	private HibernateTemplate memberTemplate;
	private ValueToolVo valueVo;

	public void setMemberTemplate(HibernateTemplate memberTemplate) {
		this.memberTemplate = memberTemplate;
	}

	//进入主页时查询网站公告信息
	public List queryNotice(){
		return memberTemplate.find(Constants.QUERY_NOTICE_INFO);
	}
	
	//进入主页时查询学院新闻信息
	public List queryNews(){
		List list = (List) memberTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.QUERY_NEWS_INFO);
				query.setFirstResult(0);
				query.setMaxResults(3);
				return query.list();
				}
			});
		return list;
	}
	
	//进入主页时查询头条新闻信息
	public List queryTopNews(){
		List list = (List) memberTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.QUERY_TOPNEWS_INFO);
				query.setFirstResult(0);
				query.setMaxResults(1);
				return query.list();
				}
			});
		return list;
	}
	
	//进入主页时查询社团信息
	public List queryAssociation(){
		List list = (List) memberTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.QUERY_ASSOCIATION_INFO);
				query.setFirstResult(0);
				query.setMaxResults(5);
				return query.list();
				}
			});
		return list;
	}
	
	//进入主页时查询活跃社员信息
	public List queryMember(){
		List list = (List) memberTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.QUERY_MEMBER_INFO);
				query.setFirstResult(0);
				query.setMaxResults(5);
				return query.list();
				}
			});
		return list;
	}
	
	//通过社员编号查询该社员所属的社团
	public Map queryAssoByMemberId(final String memberId){
		Map map = new HashMap();
		List list = (List) memberTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.QUERY_ASSO_BYMEMID).setString(
						"memberId", memberId).list();
			}
		});
		ValueToolVo toolVo = new ValueToolVo();
		toolVo.setList(list);
		map.put(""+memberId, toolVo);
		System.out.println(map.get(memberId)+"$$$$$$$$$$$$$$$$$$$$$$$$$"+list.size());
		return map;
	}
	
	//按条件分页查询社员信息
	public List queryMemberForPage(String strChoice){
		valueVo = SubStrTool.subStrToVo(strChoice,":");
		List list = (List) memberTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = null;
				if(valueVo.getColumn().equals("memberId")){
					query = session.createQuery(Constants.QUERYMEMBERFORPAGE).setString(
							"memberId", valueVo.getChoice());
				}else{
					query = session.createQuery(Constants.QUERY_MEMBER_INFO);
				}
				return query.list();
				}
			});
		return list;
	}
	
	//查询指定编号的社团的社员人数
	public int queryAssoNum(final String assoId){
		List list = (List) memberTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.QUERYASSONUM).setString(
						"assoId", assoId).list();
			}
		});
		return list.size();
	}
	
	//按条件查询社团信息
	public List queryAssoForPage(String strChoice){
		valueVo = SubStrTool.subStrToVo(strChoice,":");
		List list = (List) memberTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = null;
				if(valueVo.getColumn().equals("assoId")){
					query = session.createQuery(Constants.QUERYASSOBYID).setString(
							"assoId", valueVo.getChoice());
				}else{
					query = session.createQuery(Constants.QUERY_ASSOCIATION_INFO);
				}
				return query.list();
				}
			});
		return list;
	}
	
	//查询社员留言信息
	public List queryMsgInfo(){
		List list = new ArrayList();
		List list2 = memberTemplate.find(Constants.QUERYMSGINFO);//查询了全部记录
		//只查询了五条显示记录
		List list1 = (List) memberTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.QUERYMSGINFO);
				query.setFirstResult(0);
				query.setMaxResults(5);
				return query.list();
				}
			});
		list.add(list1);
		list.add(list2);
		return list;
	}
	
	//查询社团活动信息
	public List queryAssoActiv(){
		List list = new ArrayList();
		List list2 = memberTemplate.find(Constants.QUERYASSOACTIV);//查询了全部记录
		//只查询了五条显示记录
		List list1 = (List) memberTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.QUERYASSOACTIV);
				query.setFirstResult(0);
				query.setMaxResults(5);
				return query.list();
				}
			});
		list.add(changeActivList(list1));
		list.add(changeActivList(list2));
		return list;
	}
	
	//将社团活动信息重新封装,查询出指定id的社团名，并重新封装成Vo
	public List changeActivList(List list){
		List list1 = new ArrayList();
		Iterator it = list.iterator();
		AssoActivities activ ;
		AssoActivVo actiVo ;
		while(it.hasNext()){
			activ = (AssoActivities) it.next();
			actiVo = ModelToVoTool.queryAssoActiv(activ);
			String str = "";
			str = "assoId:"+activ.getAssoId();
			List asslist = null;
			asslist = queryAssoForPage(str);
			Iterator it2 = asslist.iterator();
			AssociationInfo asso;
			while(it2.hasNext()){
				asso = (AssociationInfo) it2.next();
				actiVo.setAssoName(asso.getAssoName()+":");
			}
			list1.add(actiVo);
		}
		return list1;
	}
	
	//新社员注册
	public int addMemberInfo(MembersInfo member){
		try {
			member.setMemberId(""+getSequeMemberId());
			memberTemplate.save(member);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	// 设置社员主键编号
	public String getSequeMemberId() {
		String sequeID = "110000";
		MembersInfo member;
		if (memberTemplate.find(Constants.GET_SEQUE_MEMBERID).size() != 0) {
			member = (MembersInfo) memberTemplate
					.find(Constants.GET_SEQUE_MEMBERID).get(0);
			sequeID = String
					.valueOf(Integer.parseInt("" + member.getMemberId()) + 1);
		}
		System.out.println("----------sequeID------------" + sequeID);
		return sequeID;
	}
	
}
