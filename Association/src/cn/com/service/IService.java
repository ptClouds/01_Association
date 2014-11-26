package cn.com.service;

import java.util.List;

/**
 * 
 * @author Administrator
 *
 */
public interface IService {
	public int getAllRowCount();
	public List queryForPage(final int offset,final int length);
	
	public List queryForPage(final int offset,final int length,final String strChoice );
	public int getAllRowCount(final String id);
	
	public List queryPageByFlag(final int offset,final int length,final String id,final String flag );
	public int getRowCountByFlag(final String id,final String flag);
	
	public List queryForPageAblum(final int typeid,final int offset,final int length,String flag);
	public int getAllRowCount( int typeid );
	
}
