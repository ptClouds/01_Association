<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="cn.com.mail.GetMail"%>
<%
	//��session��ȡ��receiver
	GetMail receiver = (GetMail)session.getAttribute("receiver");
%>
<html>
  <head>
    <title>�Ķ��ʼ�</title>
  </head>
  
  <body>
    <h2>�Ķ��ʼ�</h2>
    <hr>
    <table border=1 width=700 cellpadding=4>
		<%
			//ȡ���������
			String id = request.getParameter("id");
			//ȡ�õ�ǰĿ¼������·��
			String basePath = request.getRealPath(".");
			//ȡ��ָ�����ʼ�����
			Map result = receiver.readMail(basePath,id);
		%>    
	    <tr>
	    	<td width=100 align=right bgcolor=#dddddd>�ʼ�����</td>
	    	<td><%=result.get("subject")%></td>
	    </tr>
	    <tr>
	    	<td width=100 align=right bgcolor=#dddddd>�� �� ��</td>
	    	<td><%=result.get("sender")%></td>
	    </tr>
	    <%
	    	String attach =result.get("attach").toString();
	    	//�и���ʱ����ʾ�����һ��
	    	if (attach.trim().length()>0){
	    %>
	    <tr>
	    	<td width=100 align=right bgcolor=#dddddd>��������</td>
	    	<td><a href="<%=result.get("attach")%>"><%=result.get("attach")%></a></td>
	    </tr>
	    <%}%>
	    <tr>
	    	<td width=100 valign=top align=right bgcolor=#dddddd>�ڡ�����</td>
	    	<td><BLOCKQUOTE><%=result.get("content")%></BLOCKQUOTE></td>
	    </tr>
	</table>    
  </body>
</html>
