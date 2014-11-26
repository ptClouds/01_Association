package cn.com.action.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import cn.com.actionform.AssociationVo;
import cn.com.actionform.ContactVo;
import cn.com.actionform.MembersVo;
import cn.com.actionform.ValueToolVo;
import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;
import cn.com.model.MembersInfo;
import cn.com.service.admin.IUsersService;

import com.opensymphony.xwork2.ActionContext;

public class UsersAction {
	
	private IUsersService adminUsersService;
	private MembersVo memberVo ;
	private ContactVo contactVo;
	private AssociationVo assoVo;
	private String statusFlag;
	private String contactFlag;
	private MembersVo statusVo ;
	private String memberFlag;
	
	private String flag;
	
	public MembersVo getStatusVo() {
		return statusVo;
	}

	public void setStatusVo(MembersVo statusVo) {
		this.statusVo = statusVo;
	}

	public String getStatusFlag() {
		return statusFlag;
	}

	public void setStatusFlag(String statusFlag) {
		this.statusFlag = statusFlag;
	}

	public String getMemberFlag() {
		return memberFlag;
	}

	public void setMemberFlag(String memberFlag) {
		this.memberFlag = memberFlag;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public AssociationVo getAssoVo() {
		return assoVo;
	}

	public void setAssoVo(AssociationVo assoVo) {
		this.assoVo = assoVo;
	}

	public ContactVo getContactVo() {
		return contactVo;
	}

	public void setContactVo(ContactVo contactVo) {
		this.contactVo = contactVo;
	}

	public MembersVo getMemberVo() {
		return memberVo;
	}

	public void setMemberVo(MembersVo memberVo) {
		this.memberVo = memberVo;
	}

	public void setAdminUsersService(IUsersService adminUsersService) {
		this.adminUsersService = adminUsersService;
	}
	
	public String showUsersInfo(){
		List memberList = (List) adminUsersService.queryMember();
		//遍历社员集合，通过社员编号取出其对应的一个或多个社团（也可能为0个）
		Iterator it = memberList.iterator();
		MembersInfo member1;
		Map<String,Map> assoMap = new HashMap();
		//每个社员编号都会对应一个map，map通过键值对取出对应的社团集合list
		Map memberMap = new HashMap();
		while(it.hasNext()){
			member1 = (MembersInfo) it.next();
			memberMap = adminUsersService.queryAssoByMemberId(member1.getMemberId());
			//将社员map添加到一个map集合中，通过社员编号能够取出某个社员的map
			assoMap.put(member1.getMemberId(), memberMap);
		}
		List memberList1 = changeList(memberList,assoMap);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("memberList", memberList1);
		request.put("memberFlag", memberFlag);
		return "showUsersInfo";
	}
	
	//查询新注册待审核社员信息
	public String getNotDealMember(){
		List notDealMemList = (List) adminUsersService.getNotDealMember("0");
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("memberList", notDealMemList);
		request.put("memberFlag", memberFlag);
		return "getNotDealMember";
	}
	
	public List changeList(List list,Map<String,Map> map){
		List list1 = new ArrayList();
		try {
			Iterator it = list.iterator();
			MembersInfo member = null;
			ValueToolVo list2 = null;
			String str = "";
			Iterator it1 = null;
			while(it.hasNext()){
				member = (MembersInfo) it.next();
				list2 =(ValueToolVo) map.get(""+member.getMemberId()).get(""+member.getMemberId());
				it1 = list2.getList().iterator();
				StringBuffer str1=new StringBuffer();
				while(it1.hasNext()){
					str1 = str1.append(" "+(String)it1.next()+" ");
				}
				memberVo = new MembersVo();
				BeanUtils.copyProperties(memberVo,member);
				memberVo.setAssoName(""+str1);
				list1.add(memberVo);
			}
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list1;
	}
	
	//后台查询申请加入社团而未审核的信息
	public String showNotDealContact(){
		//未审核
		List assoStatusList = (List) adminUsersService.showNotDealContact("0");
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("assoStatusList", assoStatusList);
		return "showNotDealContact";
	}
	
	//后台查询已经审核的信息
	public String showHadDealContact(){
		//已审核
		List assoDealList = (List) adminUsersService.showNotDealContact("1");
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("assoDealList", assoDealList);
		request.put("contactFlag", contactFlag);
		return "showHadDealContact";
	}
	
	//查询待审批的社团信息
	public String showNotDealAsso(){
		List assoNotDealList = (List) adminUsersService.showDealAsso("0");
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("assoNotDealList", assoNotDealList);
		return "showNotDealAsso";
	}
	//查询已审批的社团信息
	public String showHadDealAsso(){
		List assoHadDealList = (List) adminUsersService.showDealAsso("1");
		Map request = (Map) ActionContext.getContext().get("request");
		System.out.println("--------flag------------"+flag);
		request.put("assoHadDealList", assoHadDealList);
		request.put("flag", flag);
		return "showHadDealAsso";
	}
	
	//社员入社审批
	public String dealJoinAssoInfo(){
		MembersInfo member = new MembersInfo();
		AssociationInfo asso = new AssociationInfo();
		ContactInfo contact = new ContactInfo();
		Map map = ActionContext.getContext().getSession();
		String adminName = ""+map.get("adminName");
		contact.setContactId(contactVo.getContactId());
		
		member.setMemberId(contactVo.getMembersInfo().getMemberId());
		asso.setAssoId(contactVo.getAssociationInfo().getAssoId());
		
		contact.setMembersInfo(member);
		contact.setAssociationInfo(asso);
		
		contact.setAssoDuty(contactVo.getAssoDuty());
		contact.setApprove(""+adminName);
		contact.setJoinDate(new Date());
		contact.setStatus("1");//审核
		if(adminUsersService.dealJoinAssoInfo(contact)>0){
			return "dealJoinAssoInfo";
		}else{
			return "error";
		}
	}
	
	//撤销社员与社团的关联
	public String revokeContactInfo(){
		MembersInfo member = new MembersInfo();
		AssociationInfo asso = new AssociationInfo();
		ContactInfo contact = new ContactInfo();
		Map map = ActionContext.getContext().getSession();
		String adminName = ""+map.get("adminName");
		contact.setContactId(contactVo.getContactId());
		
		member.setMemberId(contactVo.getMembersInfo().getMemberId());
		asso.setAssoId(contactVo.getAssociationInfo().getAssoId());
		
		contact.setMembersInfo(member);
		contact.setAssociationInfo(asso);
		
		contact.setAssoDuty(contactVo.getAssoDuty());
		contact.setJoinDate(contactVo.getJoinDate());
		contact.setApprove(""+adminName);
		contact.setExitDate(new Date());
		contact.setStatus("0");//审核
		contact.setRemarks(contactVo.getRemarks());
		if(adminUsersService.dealJoinAssoInfo(contact)>0){
			return "revokeContactInfo";
		}else{
			return "error";
		}
	}
	
	//社团审批
	public String dealApplyAsso(){
		AssociationInfo asso = new AssociationInfo();
		Map map = ActionContext.getContext().getSession();
		String adminName = ""+map.get("adminName");
		try {
			BeanUtils.copyProperties(asso,assoVo);
			System.out.println(asso.getApplicant()+"------asso-----------"+asso.getAssoName());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		asso.setAssoStatus("1");
		asso.setApprove(""+adminName);
		asso.setRegDate(new Date());
		if(adminUsersService.dealApplyAsso(asso)>0){
			return "dealApplyAsso";
		}else{
			return "error";
		}
	}
	
	//撤销冻结社团
	public String revokeAssoInfo(){
		AssociationInfo asso = new AssociationInfo();
		Map map = ActionContext.getContext().getSession();
		String adminName = ""+map.get("adminName");
		try {
			BeanUtils.copyProperties(asso,assoVo);
			System.out.println(asso.getApplicant()+"------asso-----------"+asso.getAssoName());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		asso.setAssoStatus("0");
		asso.setApprove(""+adminName);
		asso.setRevokeDate(new Date());
		if(adminUsersService.dealApplyAsso(asso)>0){
			return "revokeAssoInfo";
		}else{
			return "error";
		}
	}
	
	//删除社员信息
	public String updateMemberInfo(){
		MembersInfo member = new MembersInfo();
		try {
			BeanUtils.copyProperties(member,memberVo);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		member.setStatus("0");
		try{
			System.out.println(member.getStatus()+"----"+member.getMemberName());
			if(adminUsersService.updateMemberInfo(member)>0){
				return "deleteMemberInfo";
			}
		}catch(Exception e){
			e.printStackTrace();
			return "deleteMemberInfo";
		}
		return "error";
	}
	
	//审核新注册社员信息
	public String updateEmberStatus(){
		MembersInfo member = new MembersInfo();
		try {
			BeanUtils.copyProperties(member,memberVo);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		member.setStatus("1");
		System.out.println(member.getStatus()+"--"+member.getMemberName()+"----"+member.getMemberId());
		try{
			if(adminUsersService.updateEmberStatus(member)>0){
				return "memberInfoStatus";
			}
		}catch(Exception e){
			return "memberInfoStatus";
		}
		return "error";
	}

	public String getContactFlag() {
		return contactFlag;
	}

	public void setContactFlag(String contactFlag) {
		this.contactFlag = contactFlag;
	}

}
