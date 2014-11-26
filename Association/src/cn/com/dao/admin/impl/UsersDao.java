package cn.com.dao.admin.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.com.actionform.ValueToolVo;
import cn.com.common.Constants;
import cn.com.dao.admin.IUsersDao;
import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;
import cn.com.model.MembersInfo;

public class UsersDao implements IUsersDao {
	
	private HibernateTemplate adminUsersTemplate;

	public void setAdminUsersTemplate(HibernateTemplate adminUsersTemplate) {
		this.adminUsersTemplate = adminUsersTemplate;
	}
	
	//分页查询社员信息
	public List queryMember(){
		List list = (List) adminUsersTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.QUERY_MEMBER_INFO);
				return query.list();
				}
			});
		return list;
	}
	
	//查询新注册待审核社员信息
	public List getNotDealMember(final String status){
		List list = (List) adminUsersTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.QUERY_MEMBER_STATUS).setString(
						"status", status).list();
			}
		});
		return list;
	}
	
	//通过社员编号查询该社员所属的社团
	public Map queryAssoByMemberId(final String memberId){
		Map map = new HashMap();
		List list = (List) adminUsersTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.QUERY_ASSO_BYMEMID).setString(
						"memberId", memberId).list();
			}
		});
		ValueToolVo toolVo = new ValueToolVo();
		toolVo.setList(list);
		map.put(""+memberId, toolVo);
		return map;
	}
	
	//后台查询申请加入社团而未审核的信息
	public List showNotDealContact(final String status){
		List list = (List) adminUsersTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.GET_ALL_BYID_STATUS).setString(
						"status", status).list();
			}
		});
		return list;
	}
	
	//社员入社审批
	public int dealJoinAssoInfo(ContactInfo contact){
		try{
			adminUsersTemplate.update(contact);
		}catch(Exception e){
			return 0;
		}
		return 1;
	}
	
	//查询待审批或已审批的社团信息
	public List showDealAsso(final String status){
		List list = (List) adminUsersTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.DEAL_ASSO_STATUS).setString(
						"assoStatus", status).list();
			}
		});
		return list;
	}
	
	//社团审批
	public int dealApplyAsso(AssociationInfo asso){
		try{
			adminUsersTemplate.update(asso);
		}catch(Exception e){
			return 0;
		}
		return 1;
	}
	
	//更新社员状态信息
	public int updateMemberInfo(MembersInfo member){
		try{
			adminUsersTemplate.update(member);
		}catch(Exception e){
			return 0;
		}
		return 1;
	}
	
	public int updateEmberStatus(MembersInfo member){
		try{
			adminUsersTemplate.update(member);
		}catch(Exception e){
			return 0;
		}
		return 1;
	}
}
