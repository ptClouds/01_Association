<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="cn.com.mail.GetMail"%>

<jsp:useBean id="receiver" class="cn.com.mail.GetMail" scope="session"></jsp:useBean>
<jsp:setProperty name="receiver" property="*"/>

<html>
  <head>
    <title>�ҵ��ռ���</title>
  </head>
  
  <body>
    <h2>�ҵ��ռ���</h2>
    <hr>
    <table border=1 width=700>
	    <tr height=30 bgcolor=#dddddd>
	    	<td align=center>�ʼ�����</td>
	    	<td width=150 align=center>������</td>
	    	<td width=180 align=center>����ʱ��</td>
	    	<td width=80 align=center>�ʼ���С</td>
	    	<td width=50 align=center>����</td>
	    </tr>
		<%
			//ȡ���ʼ��б���Ϣ
			Iterator it = receiver.getMailInfo(receiver.getAllMail()).iterator();
			Map map = null;
			//���ʼ���Ϣ�б���ʾ
			while (it.hasNext()){
				map = (Map)it.next();
				out.println("<tr height=30 valign=middle align=center>");	
				out.println("<td><a href='readMail.jsp?id="+map.get("ID")+"' target='_blank'>"+map.get("subject")+"</a></td>");
				out.println("<td>"+map.get("sender")+"</td>");	
				out.println("<td>"+map.get("senddate")+"</td>");	
				out.println("<td>"+map.get("size")+"</td>");	
				out.println("<td>"+map.get("hasAttach")+"</td>");
				out.println("</tr>");					
			}
		%>
	</table>    
  </body>
</html>
