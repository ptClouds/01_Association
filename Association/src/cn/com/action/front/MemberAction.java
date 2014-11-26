package cn.com.action.front;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import cn.com.actionform.AssoActivVo;
import cn.com.actionform.AssociationVo;
import cn.com.actionform.MembersVo;
import cn.com.actionform.ValueToolVo;
import cn.com.common.ModelToVoTool;
import cn.com.common.DateTool;
import cn.com.model.AssoActivities;
import cn.com.model.AssociationInfo;
import cn.com.model.MembersInfo;
import cn.com.model.MessageInfo;
import cn.com.service.front.IMemberService;

import com.opensymphony.xwork2.ActionContext;

public class MemberAction {
	
	private IMemberService memberService;
	private String memChoice="";
	
	private String assoChoice="";
	private String msgFlag;
	private String noticeFlag;
	Map map;
	
	private MembersVo memberVo;
	private AssociationVo assoVo;
	private AssoActivVo actiVo;
	
	public String getNoticeFlag() {
		return noticeFlag;
	}

	public void setNoticeFlag(String noticeFlag) {
		this.noticeFlag = noticeFlag;
	}

	public String getMsgFlag() {
		return msgFlag;
	}

	public void setMsgFlag(String msgFlag) {
		this.msgFlag = msgFlag;
	}

	public AssoActivVo getActiVo() {
		return actiVo;
	}

	public void setActiVo(AssoActivVo actiVo) {
		this.actiVo = actiVo;
	}

	public void setAssoVo(AssociationVo assoVo) {
		this.assoVo = assoVo;
	}

	public MembersVo getMemberVo() {
		return memberVo;
	}

	public void setMemberVo(MembersVo memberVo) {
		this.memberVo = memberVo;
	}

	public String getMemChoice() {
		return memChoice;
	}

	public String getAssoChoice() {
		return assoChoice;
	}

	public void setAssoChoice(String assoChoice) {
		this.assoChoice = assoChoice;
	}

	public void setMemChoice(String memChoice) {
		this.memChoice = memChoice;
	}

	
	/**
	 * 显示前台主页信息
	 * @return
	 */
	public String showMainInfo(){
		memberVo = new MembersVo();
		map= ActionContext.getContext().getSession();
		List noticeList = (List) memberService.showMainInfo().get("queryNotice");
		List newsList = (List) memberService.showMainInfo().get("queryNews");
		List newTopList = (List) memberService.showMainInfo().get("queryTopNews");
		List associationList = (List) memberService.showMainInfo().get("queryAssociation");
		List associationList1 = MemberAction.changeList(associationList,13);
		List memberList = (List) memberService.showMainInfo().get("queryMember");
		List msgInfoList = new MemberAction().changeMsgList((List)memberService.showMainInfo().get("queryMsgInfo")) ;
		List msgNotSubList = new MemberAction().changeMsgListNotSub((List)memberService.showMainInfo().get("queryMsgAll")) ;
		
		List activInfoList = (List)memberService.showMainInfo().get("queryActivInfo");
		List activAllList = (List)memberService.showMainInfo().get("queryActivAll") ;
		
		//遍历社员集合，通过社员编号取出其对应的一个或多个社团（也可能为0个）
		Iterator it = memberList.iterator();
		MembersInfo member1;
		Map<String,Map> assoMap = new HashMap();
		//每个社员编号都会对应一个map，map通过键值对取出对应的社团集合list
		Map memberMap = new HashMap();
		while(it.hasNext()){
			member1 = (MembersInfo) it.next();
			memberMap = memberService.queryAssoByMemberId(member1.getMemberId());
			//将社员map添加到一个map集合中，通过社员编号能够取出某个社员的map
			assoMap.put(""+member1.getMemberId(), memberMap);
		}
		List memberList1 = new MemberAction().changeList(memberList,assoMap);
		
		Map request = (Map) ActionContext.getContext().get("request");
		memberVo.setMemberName(""+map.get("memberName"));
		String loginName=""+map.get("memberName");
		request.put("loginName", loginName);
		request.put("noticeList", noticeList);
		request.put("newsList", newsList);
		request.put("newTopList", newTopList);
		request.put("associationList", associationList1);
		request.put("memberList", memberList1);
		request.put("msgInfoList", msgInfoList);
		request.put("msgNotSubList", msgNotSubList);
		request.put("activInfoList", activInfoList);
		request.put("activAllList", activAllList);
		memberService.queryAssoByMemberId("100000");
		return "showMainInfo";
	}

	public void setMemberService(IMemberService memberService) {
		this.memberService = memberService;
	}
	
	//将比较长的字符截取前部分显示，后面部分用...代替
	public static String subStrFun(String str,int len){
		return str.substring(0,len) + "...";
	}
	
	/**
	 * 
	 * @param list 查询社团信息的list
	 * @param len  页面统一规定显示的长度
	 * @return	   返回处理后重新封装的list
	 */
	public static List changeList(List list,int len){
		List list1 = new ArrayList();
		Iterator it = list.iterator();
		AssociationInfo asso ;
		while(it.hasNext()){
			asso = (AssociationInfo) it.next();
			if((asso.getAssoDesc()+asso.getAssoName()).length()>len&&len>asso.getAssoName().length()){
				asso.setAssoDesc(MemberAction.subStrFun(asso.getAssoDesc(), (len-asso.getAssoName().length())));
			}
			list1.add(asso);
		}
		return list1;
	}
	
	public List changeList(List list,Map<String,Map> map){
		List list1 = new ArrayList();
		Iterator it = list.iterator();
		MembersInfo member;
		ValueToolVo list2;
		String str = "";
		Iterator it1 = null;
		while(it.hasNext()){
			member = (MembersInfo) it.next();
			list2 =(ValueToolVo) map.get(""+member.getMemberId()).get(""+member.getMemberId());
			it1 = list2.getList().iterator();
			StringBuffer str1=new StringBuffer();
			while(it1.hasNext()){
				str1 = str1.append("  "+(String)it1.next());
			}
			str = member.getMemberName()+" ( "+member.getClass_()+"  "+str1+" ) ";
			if(str.length()>25){
				str = str.substring(0,25) + "...)";
			}
			list2.setUserId(member.getMemberId());
			list2.setStrValue(str);
			list1.add(list2);
		}
		return list1;
	}
	
	//按条件分页查询社员信息
	public String queryMemberForPage(){
		if(memChoice==null){
			memChoice="";
		}
		List memberList = (List) memberService.queryMemberForPage(memChoice);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("memberPageList",memberList);
		return "memberForPage";
	}
	
	//按条件分页查询社团信息
	public String queryAssoForPage(){
		if(assoChoice==null){
			assoChoice="";
		}
		List assoPageList = (List) memberService.queryAssoForPage(assoChoice);
		int memNum = 0;
		Iterator it = assoPageList.iterator();
		List list1 = new ArrayList();
		AssociationInfo asso;
		while(it.hasNext()){
			asso = (AssociationInfo) it.next();
			memNum = memberService.queryAssoNum(asso.getAssoId());
			assoVo = ModelToVoTool.queryAssoAndNum(asso);
			assoVo.setMemberNum(""+memNum);
			list1.add(assoVo);
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("assoPageList",list1);
		return "assoForPage";
	}
	
	//将社员留言信息重新封装
	public List changeMsgList(List list){
		List list1 = new ArrayList();
		Iterator it = list.iterator();
		MessageInfo msg;
		ValueToolVo toolVo = null;
		String str = "";
		Iterator it1 = null;
		while(it.hasNext()){
			toolVo = new ValueToolVo();
			msg = (MessageInfo) it.next();
			String str1 = ""+msg.getMsgContent();
			String str2 = ""+msg.getMembersInfo().getMemberName();
			if(str2.length()>10){
				str2 = str2.substring(0,10);
			}
			if(str1.length()>12){
				str1 = str1.substring(0,12)+"..";
			}
			str=str2+" : "+str1;
			if(str.length()>20){
				str = str.substring(0,20) + "..";
			}
			System.out.println(str+"************so good*****************"+str);
			toolVo.setStrValue(str);
			list1.add(toolVo);
		}
		System.out.println(list1+"************so goodlist1list1list1*****************"+list1);
		return list1;
	}
	
	//将社员留言信息重新封装
	public List changeMsgListNotSub(List list){
		List list1 = new ArrayList();
		Iterator it = list.iterator();
		MessageInfo msg;
		ValueToolVo toolVo = null;
		//String str = "";
		Iterator it1 = null;
		while(it.hasNext()){
			toolVo = new ValueToolVo();
			msg = (MessageInfo) it.next();
			String str1 = msg.getMsgContent();
		//	String str2 = msg.getMembersInfo().getMemberName();
			
			StringBuffer str = new StringBuffer();
			str = str.append(msg.getMembersInfo().getMemberName()).append("      于     "). append(DateTool.DateToStrFormat2(msg.getMsgTime())).append("        发表留言   ");
			
			//str=str2+"      于     "+DateTool.DateToStrFormat2(msg.getMsgTime())+"        发表留言   ";
			toolVo.setValue2(msg.getMembersInfo().getMemberPhoto());
			toolVo.setValue1(str.toString());
			toolVo.setValue3(str1);
			list1.add(toolVo);
		}
		return list1;
	}
	
	//后台查询留言信息，这里为了简单化处理了，没去后台模板中写重复代码了
	public String showNewsInfo(){
		List msgAllList = (List)memberService.showMainInfo().get("queryMsgAll") ;
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("msgAllList", msgAllList);
		request.put("msgFlag", msgFlag);
		return "showAdminMsg";
	}
	
	//后台查询公告信息，这里为了简单化处理了，没去后台模板中写重复代码了
	public String showAdminNotice(){
		List adminNoticeList = (List) memberService.showMainInfo().get("queryNotice");
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("adminNoticeList", adminNoticeList);
		request.put("noticeFlag", noticeFlag);
		return "showAdminNotice";
	}
	
	//新社员注册，注册后需要审批才能登陆网站
	public String addMemberInfo(){
		MembersInfo member = new MembersInfo();
		System.out.println("------"+memberVo.getMemberName());
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
		if (memberService.addMemberInfo(member) > 0) {
			return "addMemberInfo";
		} else {
			return "error";
		}
	}

}
