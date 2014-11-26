package cn.com.common;

import java.awt.Color;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.rtf.RtfWriter2;

/**
 * 创建word文档 步骤: 
 * 1,建立文档 
 * 2,创建一个书写器 
 * 3,打开文档 
 * 4,向文档中写入数据 
 * 5,关闭文档
 */
public class CreateWord {

	public CreateWord() {
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Document document = new Document(PageSize.A4);// 创建word文档,并设置纸张的大小
		try {
			RtfWriter2.getInstance(document,
					new FileOutputStream("E:/word.doc"));
			RtfWriter2.getInstance(document,
					new FileOutputStream("E:/word.rtf"));

			document.open();
			/*
			 * 关于rtf格式的文件: RTF格式是许多软件都能够识别的文件格式。比如Word、WPS
			 * Office、Excel等都可以打开RTF格式的文件，这说明这种格式是较为通用的。
			 * 
			 * RTF是Rich Text
			 * Format的缩写，意即多文本格式。这是一种类似DOC格式（Word文档）的文件，有很好的兼容性，使用Windows
			 * “附件”中的“写字板
			 * ”就能打开并进行编辑。使用“写字板”打开一个RTF格式文件时，将看到文件的内容；如果要查看TRF格式文件的源代码
			 * ，只要使用“记事本”将它打开就行了。这就是说，你完全可以像编辑HTML文件一样，使用“记事本”来编辑RTF格式文件。
			 * 
			 * 对普通用户而言，RTF格式是一个很好的文件格式转换工具，用于在不同应用程序之间进行格式化文本文档的传送。
			 * 
			 * 通用兼容性应该是RTF的最大有点，但同时也就具有它的缺点，比如文件一般相对较大（可能因为嵌入了兼容各种应用程序的控制符号吧）、
			 * WORD等应用软件特有的格式可能无法正常保存等。
			 */
			// 设置中文字体
			// BaseFont bfFont =
			// BaseFont.createFont("STSongStd-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
			// Font chinaFont = new Font();
			/*
			 * 创建有三列的表格
			 */
			Table table = new Table(3);
			document.add(new Paragraph("生成表格"));
			table.setBorderWidth(1);
			table.setBorderColor(Color.RED);
			table.setPadding(5);
			table.setSpacing(5);

			/*
			 * 添加表头的元素
			 */
			Cell cell = new Cell("表头");//单元格
			cell.setHeader(true);
			cell.setColspan(3);//设置表格为三列
			cell.setRowspan(3);//设置表格为三行
			table.addCell(cell);
			table.endHeaders();// 表头结束

			// 表格的主体
			cell = new Cell("Example cell with colspan 1 and rowspan 2");
			cell.setRowspan(2);//当前单元格占两行,纵向跨度
			table.addCell(cell);
			table.addCell("1,1");
			table.addCell("1,2");
			table.addCell("1,3");
			table.addCell("1,4");
			table.addCell("1,5");
			table.addCell(new Paragraph("用java生成的表格1"));
			table.addCell(new Paragraph("用java生成的表格2"));
			table.addCell(new Paragraph("用java生成的表格3"));
			table.addCell(new Paragraph("用java生成的表格4"));
			document.add(new Paragraph("用java生成word文件"));
			document.add(table);
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
