package cn.com.action.front;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import cn.com.actionform.AssociationVo;
import cn.com.actionform.ContactVo;
import cn.com.common.ModelToVoTool;
import cn.com.model.AssociationInfo;
import cn.com.model.ContactInfo;
import cn.com.model.MembersInfo;
import cn.com.service.front.ISpaceService;

import com.opensymphony.xwork2.ActionContext;

public class SpaceAction {

	private ISpaceService spaceService;
	private String userId;
	private AssociationVo assoVo;

	private ContactVo contactVo;

	public ContactVo getContactVo() {
		return contactVo;
	}

	public void setContactVo(ContactVo contactVo) {
		this.contactVo = contactVo;
	}

	public AssociationVo getAssoVo() {
		return assoVo;
	}

	public void setAssoVo(AssociationVo assoVo) {
		this.assoVo = assoVo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setSpaceService(ISpaceService spaceService) {
		this.spaceService = spaceService;
	}

	// 显示其他社员的个人主页信息
	public String showSpaceInfo() {
		Map map = ActionContext.getContext().getSession();
		String strId1 = "" + map.get("memberId");
		System.out.println("----------userId------" + userId);
		if ((userId == null) || userId.equals("")) {
			if (!(strId1.equals(""))) {
				userId = strId1;
			} else {
				userId = "100001";
			}
		}
		System.out.println("----------memberId------" + userId);
		List spaceUserByIdList = (List) spaceService.getSpaceInfo("" + userId)
				.get("querySpaceUserByID");
		List spaceMsgByIdList = (List) spaceService.getSpaceInfo("" + userId)
				.get("querySpaceMsgByID");
		List spaceAssoByIdList = (List) spaceService.getSpaceInfo("" + userId)
				.get("querySpaceAssoByID");
		List assoByIDStatusList = (List) spaceService.getSpaceInfo("" + userId)
				.get("queryAssoByIDStatus");
		List assoAllInfoList = (List) spaceService.getSpaceInfo("" + userId)
		.get("queryAssoAllInfo");
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("spaceUserByIdList", spaceUserByIdList);
		request.put("spaceMsgByIdList", spaceMsgByIdList);
		request.put("spaceAssoByIdList", getAssoWithNum(spaceAssoByIdList));
		request.put("assoByIDStatusList", assoByIDStatusList);
		request.put("assoAllInfoList", assoAllInfoList);
		return "showSpaceInfo";
	}

	// 显示自己的个人主页信息
	public String showMySpaceInfo() {
		Map map = ActionContext.getContext().getSession();
		String strId1 = "" + map.get("memberId");
		if (!(strId1.equals(""))) {
			userId = strId1;
		} else {
			userId = "100001";
		}
		System.out.println("----------memberId------" + userId);
		List spaceUserByIdList = (List) spaceService.getSpaceInfo("" + userId)
				.get("querySpaceUserByID");
		List spaceMsgByIdList = (List) spaceService.getSpaceInfo("" + userId)
				.get("querySpaceMsgByID");
		List spaceAssoByIdList = (List) spaceService.getSpaceInfo("" + userId)
				.get("querySpaceAssoByID");
		List assoByIDStatusList = (List) spaceService.getSpaceInfo("" + userId)
				.get("queryAssoByIDStatus");
		
		List assoAllInfoList = (List) spaceService.getSpaceInfo("" + userId)
		.get("queryAssoAllInfo");
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("spaceUserByIdList", spaceUserByIdList);
		request.put("spaceMsgByIdList", spaceMsgByIdList);
		request.put("spaceAssoByIdList", getAssoWithNum(spaceAssoByIdList));
		request.put("assoByIDStatusList", assoByIDStatusList);
		request.put("assoAllInfoList", assoAllInfoList);
		return "showSpaceInfo";
	}

	// 查询社团对应的人数，将其包含人数的信息重新封装
	public List getAssoWithNum(List assolist) {
		List list1 = new ArrayList();
		if (assolist != null) {
			Iterator it = assolist.iterator();
			AssociationInfo asso;
			int memNum = 0;
			while (it.hasNext()) {
				asso = (AssociationInfo) it.next();
				memNum = spaceService.queryAssoNum(asso.getAssoId());
				System.out.println("---------test----------num-----" + memNum);
				assoVo = ModelToVoTool.queryAssoAndNum(asso);
				assoVo.setMemberNum("" + memNum);
				list1.add(assoVo);
			}
		}
		return list1;
	}

	// 处理社员申请社团
	public String addContact() {
		MembersInfo member = new MembersInfo();
		AssociationInfo asso = new AssociationInfo();
		ContactInfo contact = new ContactInfo();
		Map map = ActionContext.getContext().getSession();
		String memberId = "" + map.get("memberId");
		System.out.println("-----看看你是神马--------" + memberId);
		if (("".equals(memberId)) || (memberId == null)
				|| ("null".equals(memberId))
				|| ("".equals(contactVo.getAssoId()))) {
			return "error";
		} else {
			member.setMemberId(memberId);
			asso.setAssoId(contactVo.getAssoId());
			contact.setMembersInfo(member);
			contact.setAssociationInfo(asso);
			contact.setAssoDuty("社员");
			contact.setJoinDate(new Date());
			contact.setStatus("0");// 未审核
			if (spaceService.addContact(contact) > 0) {
				return "addContact";
			} else {
				return "error";
			}
		}
	}

	// 处理社员申请社团
	public String addAssoInfo() {
		AssociationInfo asso = new AssociationInfo();
		try {
			BeanUtils.copyProperties(asso,assoVo);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		asso.setRegDate(new Date());
		asso.setAssoStatus("0");
		if (spaceService.addAssoInfo(asso) > 0) {
			return "addAssoInfo";
		} else {
			return "error";
		}
	}

}
