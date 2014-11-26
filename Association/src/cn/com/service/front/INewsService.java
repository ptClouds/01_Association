package cn.com.service.front;

import java.util.List;

import cn.com.service.IService;

/**
 * 定义公告信息的service接口
 * @author 潘志祥
 *
 */
public interface INewsService extends IService{
	//查询社员留言信息
	public List queryMsgInfo();
	
}
