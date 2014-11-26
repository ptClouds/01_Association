package cn.com.common;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTool {
	
	public static Date strToDate(String strDate){
		return null;
	}
	
	public static String DateToStr(Date date){
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");  
		String str = "";
		str = format1.format(date); 
		return str;
	}
	
	public static String DateToStrFormat2(Date date){
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String str = "";
		str = format1.format(date); 
		return str;
	}
	
	public static void main(String args[]){
		System.out.println("-------------"+DateTool.DateToStr(new Date()));
	}

}
