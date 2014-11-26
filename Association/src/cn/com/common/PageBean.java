package cn.com.common;

import java.util.List;

import cn.com.actionform.PageForm;
import cn.com.service.IService;

public class PageBean {

	public static PageForm queryForPage(IService service, int pageSize, int page) {
		int allRow = service.getAllRowCount();// 总记录数
		int totalPage = PageForm.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageForm.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageForm.countCurrentPage(page);
		List list = service.queryForPage(offset, length);// "一页"的记录
		// 把分页信息保存到Bean中
		PageForm PageForm = new PageForm();
		PageForm.setPageSize(pageSize);
		PageForm.setCurrentPage(currentPage);
		PageForm.setAllRow(allRow);
		PageForm.setTotalPage(totalPage);
		PageForm.setList(list);
		PageForm.init();
		return PageForm;
	}
	
	//通过编号分页查询
	public static PageForm queryForPage(IService service, int pageSize, int page, String id) {
		int allRow = service.getAllRowCount(id);// 总记录数
		int totalPage = PageForm.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageForm.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageForm.countCurrentPage(page);
		List list = service.queryForPage(offset, length,id);// "一页"的记录
		// 把分页信息保存到Bean中
		PageForm PageForm = new PageForm();
		PageForm.setPageSize(pageSize);
		PageForm.setCurrentPage(currentPage);
		PageForm.setAllRow(allRow);
		PageForm.setTotalPage(totalPage);
		PageForm.setList(list);
		PageForm.init();
		return PageForm;
	}
	
	
	//通过编号分页查询，并通过一个标志来确定要执行的方法
	public static PageForm queryForPage(IService service, int pageSize, int page, String id,String flag) {
		int allRow = service.getRowCountByFlag(id, flag);// 总记录数
		int totalPage = PageForm.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageForm.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageForm.countCurrentPage(page);
		List list = service.queryPageByFlag(offset, length, id, flag);// "一页"的记录
		// 把分页信息保存到Bean中
		PageForm PageForm = new PageForm();
		PageForm.setPageSize(pageSize);
		PageForm.setCurrentPage(currentPage);
		PageForm.setAllRow(allRow);
		PageForm.setTotalPage(totalPage);
		PageForm.setList(list);
		PageForm.init();
		return PageForm;
	}
	
	//分类进行分页查询
	public static PageForm queryForPageAblum(IService service,int typeid, int pageSize, int page, String flag ) {
		int allRow = 0;
		
		if( typeid == 0 ){  //不分类的总记录数
			allRow = service.getAllRowCount( flag );// 总记录数
			System.out.println( allRow + " allRow ======== =====allRow" );
		} else{  //分类的总记录数
			allRow = service.getAllRowCount(typeid);// 总记录数
			System.out.println( allRow + " =====allRow" );
		}
		
		int totalPage = PageForm.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageForm.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageForm.countCurrentPage(page);
		List list = service.queryForPageAblum( typeid,offset,length,flag );// "一页"的记录
		
		// 把分页信息保存到Bean中
		PageForm PageForm = new PageForm();
		PageForm.setPageSize(pageSize);
		PageForm.setCurrentPage(currentPage);
		PageForm.setAllRow(allRow);
		PageForm.setTotalPage(totalPage);
		PageForm.setList(list);
		PageForm.init();
		return PageForm;
	}
	
}
