package cn.com.common;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.com.model.AssociationInfo;

public class AssoReportData {
	private HibernateTemplate reportDataTemplate;

	public void setReportDataTemplate(HibernateTemplate reportDataTemplate) {
		this.reportDataTemplate = reportDataTemplate;
	}
	
	//查询指定编号的社团的社员人数
	public List getAssoReportInfo(){
		List list = reportDataTemplate.find(Constants.QUERY_ASSOCIATION_INFO);
		//先将社团人数排名前五位的选出来
		Iterator it = list.iterator();
		AssociationInfo asso;
		List ListNum = new ArrayList();
		while(it.hasNext()){
			asso = (AssociationInfo) it.next();
			ListNum.add(queryAssoNum(asso.getAssoId()));//将人数添加到list中
		}
		Collections.sort(ListNum); //对list进行排序，这里默认是升序
		int len = 0;
		//控制条件，选择前五个
		if((ListNum.size()-5)>0){
			len=ListNum.size()-5;
		}
		//Map mapAssoId
		for(int i=ListNum.size();i>=len;i--){
			
		}
		int theLastNum = Integer.parseInt(""+ListNum.get(len));//将前五位中最小的那个的人数记录下来，便于后面进行比较
		Iterator it1 = list.iterator();
		AssociationInfo asso1;
		List assoList = new ArrayList();
		Map map;
		int flag=0;//定义标记，控制只从结果集中取出前五个，因为theLastNum可能有很多重复相等的，那样的话，我就不止取出五个了
		while(it1.hasNext()){
			asso1 = (AssociationInfo) it1.next();
			map = new HashMap();
			if(queryAssoNum(asso1.getAssoId())>=theLastNum){//当人数大于等于排名前五的最小的人数时添加到map中
				map.put("name", asso1.getAssoName());//将社团名添加到map中，这样方便获取值
				map.put("number", queryAssoNum(asso1.getAssoId()));
				flag++;//大于theLastNum的肯定是排名前五的，让标记加1
				assoList.add(map);//将map再添加到list中
			}else if((queryAssoNum(asso1.getAssoId())==theLastNum)&&(flag<5)){//取出部分人数等于排名前五的最小的人数时添加到map，如果没相等的，则只把排名第五的取出
				map.put("name", asso1.getAssoName());//将社团名添加到map中，这样方便获取值
				map.put("number", queryAssoNum(asso1.getAssoId()));
				flag++;//取完后标记加1
				assoList.add(map);//将map再添加到list中
			}
		}
		return assoList;
	}
	
	//查询指定编号的社团的社员人数
	public int queryAssoNum(final String assoId){
		List list = (List) reportDataTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.QUERYASSONUM).setString(
						"assoId", assoId).list();
			}
		});
		return list.size();
	}
	
	//查询指定编号的社团活动数
	public int getAssoActiv(final String assoId){
		List list = (List) reportDataTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(Constants.QUERYASSOACTIVNUM).setString(
						"assoId", assoId).list();
			}
		});
		return list.size();
	}
	
	
	//查询指定编号的社团活动数与社团名
	public List getAssoActivReport(){
		List list = reportDataTemplate.find(Constants.QUERY_ASSOCIATION_INFO);
		//先将社团人数排名前五位的选出来
		Iterator it = list.iterator();
		AssociationInfo asso;
		List ListNum = new ArrayList();
		while(it.hasNext()){
			asso = (AssociationInfo) it.next();
			ListNum.add(getAssoActiv(asso.getAssoId()));//将人数添加到list中
		}
		Collections.sort(ListNum); //对list进行排序，这里默认是升序
		int len = 0;
		//控制条件，选择前五个
		if((ListNum.size()-5)>0){
			len=ListNum.size()-5;
		}
		int theLastNum = Integer.parseInt(""+ListNum.get(len));//将前五位中最小的那个的人数记录下来，便于后面进行比较
		System.out.println("------------------"+theLastNum);
		Iterator it1 = list.iterator();
		AssociationInfo asso1;
		List assoList = new ArrayList();
		Map map;
		int flag=0;
		while(it1.hasNext()){
			asso1 = (AssociationInfo) it1.next();
			map = new HashMap();
			if(getAssoActiv(asso1.getAssoId())>theLastNum){//当人数大于等于排名前五的最小的人数时添加到map中
				System.out.println(asso1.getAssoName()+"------getAssoActiv(asso1.getAssoId())------"+getAssoActiv(asso1.getAssoId()));
				map.put("name", asso1.getAssoName());//将社团名添加到map中，这样方便获取值
				map.put("number", getAssoActiv(asso1.getAssoId()));
				flag++;
				assoList.add(map);//将map再添加到list中	
			}else if((getAssoActiv(asso1.getAssoId())==theLastNum)&&(flag<5)){//当人数大于等于排名前五的最小的人数时添加到map中
				System.out.println(asso1.getAssoName()+"------getAssoActiv(asso1.getAssoId())------"+getAssoActiv(asso1.getAssoId()));
				map.put("name", asso1.getAssoName());//将社团名添加到map中，这样方便获取值
				map.put("number", getAssoActiv(asso1.getAssoId()));
				flag++;
				assoList.add(map);//将map再添加到list中	
			}
		}
		return assoList;
	}

}
