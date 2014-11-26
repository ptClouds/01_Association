package cn.com.action.front;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.com.actionform.MembersVo;
import cn.com.model.AdminInfo;
import cn.com.model.MembersInfo;
import cn.com.service.front.ILoginService;

public class LoginAction {
	private ILoginService frootLoginService;
	Map map;
	
	private MembersVo memberVo;
	
	private String messid;
	
	private String userType;

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public void setFrootLoginService(ILoginService frootLoginService) {
		this.frootLoginService = frootLoginService;
	}
	
	public String login(){
		System.out.println("----userType------"+userType);
		if(userType.equals("1")){
			return login1();
		}else if(userType.equals("2")){
			return login2();
		}else if(userType.equals("3")){
			return login3();
		}else{
			return login4();
		}
	}
	

	// 前台用户登录
	public String login1() {
		MembersInfo member = new MembersInfo();
		member.setMemberId(memberVo.getMemberId());
		member.setMemberPass(memberVo.getMemberPass());
		if (frootLoginService.login(member) > 0) {
			
			map= ActionContext.getContext().getSession();
			Iterator it = frootLoginService.queryMemberInfo(memberVo.getMemberId()).iterator();
			while(it.hasNext()){
				member = (MembersInfo) it.next();
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!"+member.getMemberName());
			}
			System.out.println(member.getMemberName()+"%%%%%%%"+member);
			map.put("memberId", member.getMemberId());
			map.put("memberName", member.getMemberName());
			map.put("memberInfo", member);
			System.out.println((MembersInfo) map.get("memberInfo")
					+ "&&&&&&&&&&111111&&&&" + map.get("memberName"));
			return "flogin";
		} else {
			return "loginErro";
		}
	}
	
	public String login2(){
		return "shezhang";
	}
	
	public String login3(){
		AdminInfo admin = new AdminInfo();
		admin.setAdminId(memberVo.getMemberId());
		admin.setAdminPass(memberVo.getMemberPass());
		admin.setAdminType("0");
		if (frootLoginService.login4(admin).size() > 0) {
			map= ActionContext.getContext().getSession();
			System.out.println(admin.getAdminId()+"%%%%%%%"+admin.getAdminName());
			
			List adminlist = frootLoginService.login4(admin);
			Iterator it = adminlist.iterator();
			while(it.hasNext()){
				admin = (AdminInfo) it.next();
			}
			
			map.put("adminId", admin.getAdminId());
			map.put("adminName", admin.getAdminName());
			map.put("admin", admin);
			return "siteAdmin";
		} else {
			return "loginErro";
		}
	}
	
	public String login4(){
		AdminInfo admin = new AdminInfo();
		admin.setAdminId(memberVo.getMemberId());
		admin.setAdminPass(memberVo.getMemberPass());
		admin.setAdminType("1");
		if (frootLoginService.login4(admin).size() > 0) {
			map= ActionContext.getContext().getSession();
			System.out.println(admin.getAdminId()+"%%%%%%%"+admin.getAdminName());
			
			List adminlist = frootLoginService.login4(admin);
			Iterator it = adminlist.iterator();
			while(it.hasNext()){
				admin = (AdminInfo) it.next();
			}
			
			map.put("adminId", admin.getAdminId());
			map.put("adminName", admin.getAdminName());
			map.put("admin", admin);
			return "siteAdmin";
		} else {
			return "loginErro";
		}
	}
	
	
	public MembersVo getMemberVo() {
		return memberVo;
	}

	public void setMemberVo(MembersVo memberVo) {
		this.memberVo = memberVo;
	}

	public String getMessid() {
		return messid;
	}

	public void setMessid(String messid) {
		this.messid = messid;
	}

}
