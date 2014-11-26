package cn.com.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import cn.com.model.AssociationInfo;

import com.opensymphony.xwork2.ActionContext;

public class Jfreechar {
	private AssoReportData reportData;
	
	public void setReportData(AssoReportData reportData) {
		this.reportData = reportData;
	}

	//社团信息统计
	public String  showAssoReport() throws IOException{
		Jfreechar.bingtu(reportData.getAssoReportInfo());
		Jfreechar.zhuxing(reportData.getAssoActivReport());
		Map request = (Map) ActionContext.getContext().get("request");
		reportData.getAssoReportInfo();
		return "showAssoImg";
	}
	
	/**
	 * 生成饼图
	 * @param list 传入参数为一个list，list中包含多个map，这个list是从数据库中获取得到的结果集
	 * @throws IOException
	 */
	public static void bingtu(List<Map> list) throws IOException{
		DefaultPieDataset data = getDataSet(list);
		JFreeChart chart = ChartFactory.createPieChart3D("社团人数排名前五的社团统计图",  // 图表标题
		data, 
		true, // 是否显示图例
		false,
		false
		);
		FileOutputStream fos_jpg = null;
		try {
			fos_jpg = new FileOutputStream(getImgPath()+"jfreechar/bingtu.jpg");//图片路径，这里可以自己设置
			ChartUtilities.writeChartAsJPEG(fos_jpg,1.0f,chart,500,350,null);
		} finally {
			try {
				fos_jpg.close();
			} catch (Exception e) {}
		}
	}
	
	/**
	 * 获取一个数据集对象
	 * @return
	 */
	private static DefaultPieDataset getDataSet(List<Map> list) {
		DefaultPieDataset dataset = new DefaultPieDataset();
		Iterator it = list.iterator();//对list进行遍历
		Map map;//定义map，map通过键值对获取社团名和社员人数
		while(it.hasNext()){
			map = (Map) it.next();
			dataset.setValue(""+map.get("name"),Integer.parseInt(""+map.get("number")));//将名字和数量添加到数据集中
		}
		return dataset;
	}
	
	/**
	 * 生成柱形图
	 * @param list 传入参数为一个list，list中包含多个map，这个list是从数据库中获取得到的结果集
	 * @throws IOException
	 */
	public static void zhuxing(List<Map> list) throws IOException{
		CategoryDataset dataset = getDataSet2(list);
		JFreeChart chart = ChartFactory.createBarChart3D(
							"活动数排名前五的社团统计柱形图", // 图表标题
							"社团", // 目录轴的显示标签
							"活动数", // 数值轴的显示标签
							dataset, // 数据集
							PlotOrientation.VERTICAL, // 图表方向：水平、垂直
							true, 	// 是否显示图例(对于简单的柱状图必须是false)
							false, 	// 是否生成工具
							false 	// 是否生成URL链接
							);
		FileOutputStream fos_jpg = null;
		try {
			fos_jpg = new FileOutputStream(getImgPath()+"jfreechar/zhuxing.jpg");//图片路径
			ChartUtilities.writeChartAsJPEG(fos_jpg,1.0f,chart,500,350,null);
		} finally {
			try {
				fos_jpg.close();
			} catch (Exception e) {}
		}
	}
	
	
	/**
	 * 获取一个组合数据集对象，同样对list进行遍历，再将值取出设置到数据集中
	 * @return
	 */
	private static CategoryDataset getDataSet2(List<Map> list) {
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		Iterator it = list.iterator();
		AssociationInfo asso;
		Map map;
		while(it.hasNext()){
			map = (Map) it.next();
			dataset.addValue(Integer.parseInt(""+map.get("number")),"",""+map.get("name"));
		}
		return dataset;
	}
	
	public static void main(String args[]) throws IOException{
		System.out.println("----"+Jfreechar.class.getResource(""));
		System.out.println("----"+Jfreechar.class.getResource("/"));    
		System.out.println("-path---"+Thread.currentThread().getContextClassLoader().getResource(""));   
		System.out.println("----"+new File("bingtu.jpg").getAbsolutePath());
		System.out.println(Jfreechar.class.getClassLoader().getResource(""));     
		System.out.println(ClassLoader.getSystemResource(""));    
		
		System.out.println("getImgPath------"+getImgPath()+"jfreechar/bingtu.jpg");    
		
		//Jfreechar.bingtu(reportData.);
		//Jfreechar.zhuxing();
	}
	public static String getImgPath(){
		String strPath="";
		strPath=""+Thread.currentThread().getContextClassLoader().getResource("");
		int len = strPath.length();
		strPath=strPath.substring(6,len-16);
		return strPath;
	}

}