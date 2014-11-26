package cn.com.dao.front.impl;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.com.common.Constants;
import cn.com.common.SubStrTool;
import cn.com.dao.front.ISpaceDao;
import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;
import cn.com.model.SiteNotice;

public class SpaceDao implements ISpaceDao {

	private HibernateTemplate spaceTemplate;

	public void setSpaceTemplate(HibernateTemplate spaceTemplate) {
		this.spaceTemplate = spaceTemplate;
	}

	// 按编号查询社员详细信息
	public List querySpaceUserByID(final String memberId) {
		List list = (List) spaceTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session
						.createQuery(Constants.GET_SPACE_USER_BYID).setString(
								"memberId", memberId);
				return query.list();
			}
		});
		return list;
	}

	// 按编号查询社员留言信息
	public List querySpaceMsgByID(final String memberId) {
		List list = (List) spaceTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(Constants.GET_SPACE_MSG_BYID)
						.setString("memberId", memberId);
				return query.list();
			}
		});
		return list;
	}

	// 按编号查询社员参加的社团信息
	public List querySpaceAssoByID(final String memberId) {
		List list = (List) spaceTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session
						.createQuery(Constants.GET_SPACE_ASSO_BYID).setString(
								"memberId", memberId);
				return query.list();
			}
		});
		return list;
	}
	
	// 查询指定编号社员申请的未审核的社团信息
	public List queryAssoByIDStatus(final String memberId) {
		List list = (List) spaceTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session
						.createQuery(Constants.GET_ASSO_BYID_STATUS).setString(
								"memberId", memberId);
				return query.list();
			}
		});
		return list;
	}

	// 查询指定编号的社团的社员人数
	public int queryAssoNum(final String assoId) {
		List list = (List) spaceTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.QUERYASSONUM).setString(
						"assoId", assoId).list();
			}
		});
		return list.size();
	}

	// 处理社员申请社团
	public int addContact(final ContactInfo contact) {
		System.out.println(contact.getMembersInfo().getMemberName()
				+ "========contact.getMembersInfo().getMemberId()==="
				+ contact.getAssociationInfo().getAssoId() + "=========="
				+ contact.getMembersInfo().getMemberId());
		// 判断该社员是否已经加入了该社团
		List list = (List) spaceTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session
						.createQuery(Constants.GET_MEMBER_ASSO_BYID).setString(
								"memberId",
								contact.getMembersInfo().getMemberId())
						.setString("assoId",
								contact.getAssociationInfo().getAssoId());
				return query.list();
			}
		});
		if(list.size()==0){
			try {
				contact.setContactId(getSequeContactId());
				System.out.println("-----contactid----" + contact.getContactId());
				System.out.println(contact.getMembersInfo().getMemberName()
						+ "========contact.getMembersInfo().getMemberId()==="
						+ contact.getAssociationInfo().getAssoId() + "=========="
						+ contact.getMembersInfo().getMemberId());
				// adminnewsTemplate.saveOrUpdate(news.getNewsId(), news);
				spaceTemplate.save(contact);
			} catch (Exception e) {
				return 0;
			}
			return 1;
		}
		else{
			System.out.println("---已加入过了-");
			return 0;
		}
	}

	// 设置主键编号
	public String getSequeContactId() {
		List list = spaceTemplate.find(Constants.GET_SEQUE_CONTACTID);
		Iterator it = list.iterator();
		ContactInfo ct = new ContactInfo();
		String sequeID = "110000";
		while (it.hasNext()) {
			ct = (ContactInfo) it.next();
			System.out.println("----------seque------------"
					+ ct.getContactId());
		}
		if (spaceTemplate.find(Constants.GET_SEQUE_CONTACTID).size() != 0) {
			ct = (ContactInfo) spaceTemplate
					.find(Constants.GET_SEQUE_CONTACTID).get(0);
			sequeID = String
					.valueOf(Integer.parseInt("" + ct.getContactId()) + 1);
		}
		System.out.println("----------sequeID------------" + sequeID);
		return sequeID;
	}
	
	
	// 设置社团主键编号
	public String getSequeAssoId() {
		String sequeID = "110000";
		AssociationInfo ass;
		if (spaceTemplate.find(Constants.GET_SEQUE_ASSOID).size() != 0) {
			ass = (AssociationInfo) spaceTemplate
					.find(Constants.GET_SEQUE_ASSOID).get(0);
			sequeID = String
					.valueOf(Integer.parseInt("" + ass.getAssoId()) + 1);
		}
		System.out.println("----------sequeID------------" + sequeID);
		return sequeID;
	}
	
	// 注册社团
	public int addAssoInfo(AssociationInfo asso){
		try {
			asso.setAssoId(""+getSequeAssoId());
			spaceTemplate.save(asso);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	// 查询新注册的社团信息
	public List queryAssoAllInfo(){
		List list = (List) spaceTemplate.executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(Constants.SHOWASSOALLINFO);
				query.setFirstResult(0);
				query.setMaxResults(1);
				return query.list();
				}
			});
		return list;
	}

}
