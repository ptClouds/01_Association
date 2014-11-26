package cn.com.dao.front;

import java.util.List;

public interface INewsDao {
	
	//分页显示新闻信息
	public List queryNewsForPage(int offset, int length,String strChoice);
	//查询新闻总记录数
	public int getNewsCount(String strChoice);
	
	//查询社员留言信息
	public List queryMsgInfo();

}
