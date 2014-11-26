package cn.com.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import cn.com.actionform.AssoActivVo;
import cn.com.actionform.AssociationVo;
import cn.com.model.AssoActivities;
import cn.com.model.AssociationInfo;

public class ModelToVoTool {

	public static AssociationVo queryAssoAndNum(AssociationInfo asso){
		AssociationVo assoVo = new AssociationVo();
		assoVo.setAssoId(asso.getAssoId());
		assoVo.setAssoName(asso.getAssoName());
		assoVo.setAssoDesc(asso.getAssoDesc());
		assoVo.setApplicant(asso.getApplicant());
		assoVo.setRegDate(asso.getRegDate());
		assoVo.setAssoStatus(asso.getAssoStatus());
		assoVo.setApprove(asso.getApprove());
		assoVo.setApplicantTel(asso.getApplicantTel());
		assoVo.setApplicantEmail(asso.getApplicantEmail());
		assoVo.setApplicantId(asso.getApplicantId());
		assoVo.setRegSchool(ModelToVoTool.getSchoolName(""+asso.getRegSchool()));
		assoVo.setRevokeDate(asso.getRevokeDate());
		assoVo.setAssoPhoto(asso.getAssoPhoto());
		assoVo.setRemarks(asso.getRemarks());
		assoVo.setContactInfos(asso.getContactInfos());
		//assoVo.setStrRegDate(DateTool.DateToStr(asso.getRegDate()));
		//assoVo.setStrRevokeDate(DateTool.DateToStr(asso.getRevokeDate()));
		return assoVo;
	}
	
	public static String getSchoolName(String statue){
		String schoolName = "未填写";
		if(statue.equals("1")){
			schoolName = "湖南商学院";
		}
		return schoolName;
	}
	
	public static String dateToString(Date date){
		String string=date.toString();
		System.out.println(string+"-------");
		return string;
	}
	
	public static void main(String args[]){
		System.out.println(ModelToVoTool.dateToString(new Date())+"-------");
	}
	
	public static AssoActivVo queryAssoActiv(AssoActivities activ){
		AssoActivVo actiVo = new AssoActivVo();
		actiVo.setActivId(activ.getActivId());
		actiVo.setAssoId(activ.getAssoId());
		actiVo.setActivTopic(activ.getActivTopic());
		actiVo.setActivContent(activ.getActivContent());
		actiVo.setActivDate(activ.getActivDate());
		actiVo.setActivAddress(activ.getActivAddress());
		actiVo.setNoticeMatter(activ.getNoticeMatter());
		actiVo.setSendTime(activ.getSendTime());
		actiVo.setRemarks(activ.getRemarks());
		actiVo.setStrActivDate(DateTool.DateToStr(activ.getActivDate()));
		actiVo.setStrSendDate(DateTool.DateToStr(activ.getSendTime()));
		
		return actiVo;
	}
	
	
	
}
