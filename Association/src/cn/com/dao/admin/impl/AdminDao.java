package cn.com.dao.admin.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.com.common.Constants;
import cn.com.dao.admin.IAdminDao;
import cn.com.model.AdminInfo;

public class AdminDao implements IAdminDao {
	private HibernateTemplate adminTemplate;
	
	public void setAdminTemplate(HibernateTemplate adminTemplate) {
		this.adminTemplate = adminTemplate;
	}

	//查询管理员信息
	public List queryAdminInfo() {
		// TODO Auto-generated method stub
		return adminTemplate.find(Constants.QUERYADMININFO);
	}
	
	//添加管理员信息
	public int addAdminInfo(AdminInfo admin){
		try {
			adminTemplate.save(admin);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	//删除管理员信息（其实是做更新操作，将员工状态设置为冻结）
	public int deleteAdmin(AdminInfo admin){
		try{
			adminTemplate.update(admin);
		}catch(Exception e){
			return 0;
		}
		return 1;
	}
	
	//通过编号查询管理员信息
	public List queryAdminInfo(final String adminId){
		List list = (List) adminTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.GETADMIN_BY_ID).setString(
						"adminId", adminId).list();
			}
		});
		return list;
	}

}
