package cn.com.dao.front.impl;

import org.springframework.orm.hibernate3.HibernateTemplate;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import cn.com.common.Constants;
import cn.com.dao.front.ILoginDao;
import cn.com.model.AdminInfo;
import cn.com.model.MembersInfo;

public class LoginDao implements ILoginDao {
	private HibernateTemplate frootLoginTemplate;

	public void setFrootLoginTemplate(HibernateTemplate frootLoginTemplate) {
		this.frootLoginTemplate = frootLoginTemplate;
	}

	public int login(final MembersInfo member) {
		// TODO Auto-generated method stub
		List list = (List) frootLoginTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.MEMBER_LOGIN).setString(
						"memberId", member.getMemberId()).setString("password",
						member.getMemberPass()).list();
			}
		});
		return list.size();
	}
	
	//查询登录用户的详细信息
	public List queryMemberInfo(String memberId) {
		// TODO Auto-generated method stub
		List list = frootLoginTemplate.find(Constants.GET_MEMBER_INFO, memberId);
		return list;
	}
	
	//后台用户登录
	public List login4(final AdminInfo admin){
		List list = (List) frootLoginTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.ADMIN_LOGIN).setString(
						"adminId", admin.getAdminId()).setString("adminPass",
								admin.getAdminPass()).setString("adminType", admin.getAdminType()).list();
			}
		});
		return list;
	}

}
