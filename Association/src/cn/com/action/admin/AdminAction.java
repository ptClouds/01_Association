package cn.com.action.admin;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import cn.com.actionform.AdminVo;
import cn.com.model.AdminInfo;
import cn.com.service.admin.IAdminService;

import com.opensymphony.xwork2.ActionContext;

public class AdminAction {
	
	private IAdminService adminService;
	private String adminName;
	
	private AdminVo adminVo;

	public AdminVo getAdminVo() {
		return adminVo;
	}
	public void setAdminVo(AdminVo adminVo) {
		this.adminVo = adminVo;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	//查询管理员信息
	public String queryAdminInfo(){
		List adminList = (List) adminService.queryAdminInfo();
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("adminList", adminList);
		return "queryAdminInfo";
	}
	
	//修改密码时，查询管理员信息
	public String updateAdminInfo(){
		Map map= ActionContext.getContext().getSession();
		AdminInfo admin = new AdminInfo();
		admin=(AdminInfo) map.get("admin");
		List list = (List)adminService.queryAdminInfo(admin.getAdminId());
		Iterator it = list.iterator();
		while(it.hasNext()){
			admin=(AdminInfo)it.next();
		}
		adminVo = new AdminVo();
		adminVo.setAdminId(admin.getAdminId());
		adminVo.setAdminName(admin.getAdminName());
		adminVo.setAdminPass(admin.getAdminPass());
		adminVo.setAdminStatus(admin.getAdminStatus());
		adminVo.setAdminType(admin.getAdminType());
		System.out.println(adminVo.getAdminId()+"----"+adminVo.getAdminName()+"---"+adminVo.getAdminPass()+"--"+admin.getAdminStatus()+"--"+admin.getAdminType());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("adminVo", adminVo);
		return "updateAdminInfo";
	}
	
	public String showAdminInfo(){
		Map map= ActionContext.getContext().getSession();
		String adminName = (String) map.get("adminName");
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("adminName", adminName);
		return "showAdminMain";
	}
	
	//处理管理员退出（注销）
	public String adminExit(){
		Map map = ActionContext.getContext().getSession();
		map.remove("adminName");
		map.remove("adminId");
		map.remove("admin");
		return "adminExit";
	}
	
	//添加管理员信息
	public String addAdminInfo(){
		AdminInfo admin = new AdminInfo();
		admin.setAdminId(adminVo.getAdminId());
		admin.setAdminName(adminVo.getAdminName());
		admin.setAdminPass(adminVo.getAdminPass());
		admin.setAdminStatus("1");
		admin.setAdminType(adminVo.getAdminType());
		System.out.println("----------getAdminType---------"+adminVo.getAdminType());
		if(adminService.addAdminInfo(admin)>0){
			return "addAdminInfo";
		}
		return "error";
	}
	
	//删除管理员信息（其实是做更新操作，将员工状态设置为冻结）
	public String deleteAdmin(){
		AdminInfo admin = new AdminInfo();
		admin.setAdminId(adminVo.getAdminId());
		admin.setAdminName(adminVo.getAdminName());
		admin.setAdminPass(adminVo.getAdminPass());
		admin.setAdminType(adminVo.getAdminType());
		System.out.println(adminVo.getDealFlag()+"----------------+++++++++++++++===========");
		if(adminVo.getDealFlag().equals("todelete")){
			if(adminVo.getAdminStatus().trim().equals("0")){
				admin.setAdminStatus("1");
			}else{
				admin.setAdminStatus("0");
			}
		}else{
			admin.setAdminStatus(adminVo.getAdminStatus());
		}
		System.out.println(admin.getAdminId()+"----"+admin.getAdminName()+"---"+admin.getAdminPass()+"--"+admin.getAdminStatus()+"--"+admin.getAdminType());
		if(adminService.deleteAdmin(admin)>0){
			return "deleteAdmin";
		}
		return "error";
	}

}
