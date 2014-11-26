package cn.com.common;

import cn.com.actionform.ValueToolVo;

public class SubStrTool {
	
	public static ValueToolVo subStrToVo(String str,String regex){
		ValueToolVo valueVo = new ValueToolVo();
		if((str.split(regex)).length==2){
			valueVo.setColumn(""+str.split(regex)[0]);
			valueVo.setChoice(""+str.split(regex)[1]);
		}else{
			valueVo.setColumn(""+str.split(regex)[0]);
			valueVo.setChoice("");
		}
		return valueVo;
	}
	
	public static void main(String args[]){
		SubStrTool.subStrToVo("name=pan","=");
		SubStrTool.subStrToVo("name=pan","@");
		SubStrTool.subStrToVo("name=pan","");
		SubStrTool.subStrToVo("all",":");
	}
	
}
