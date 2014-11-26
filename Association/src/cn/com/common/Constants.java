package cn.com.common;

/**
 * title:
 * @author Administrator
 *
 */
public interface Constants {
	//处理前台用户登录
	String MEMBER_LOGIN="from MembersInfo m where m.memberId=:memberId and m.memberPass=:password and m.status=1";
	//处理后台用户登录
	String ADMIN_LOGIN = "from AdminInfo a where a.adminId=:adminId and a.adminPass=:adminPass and a.adminType=:adminType";
	//通过编号查询管理员信息
	String GETADMIN_BY_ID = "from AdminInfo a where a.adminId=:adminId";
	
	//用户登录后获取其信息
	String GET_MEMBER_INFO="from MembersInfo m where m.memberId=?";
	
	//进入主页时查询网站公告信息
	String QUERY_NOTICE_INFO="from SiteNotice s order by s.sendTime desc";
	//进入主页时查询学院新闻信息
	String QUERY_NEWS_INFO = "from NewsInfo n where n.newsStatus=0";
	//进入主页时查询头条新闻信息
	String QUERY_TOPNEWS_INFO = "from NewsInfo n where n.newsStatus=1";
	//进入主页时查询社团信息
	String QUERY_ASSOCIATION_INFO = "from AssociationInfo a where a.assoStatus=1 order by a.assoId desc";
	//进入主页时查询活跃社员信息
	String QUERY_MEMBER_INFO = "from MembersInfo m where m.status=1 order by m.memberId desc";
	//通过社员编号查询该社员所属的社团
	String QUERY_ASSO_BYMEMID = "select c.associationInfo.assoName from ContactInfo c where c.membersInfo.memberId=:memberId";
	
	//分页查询新闻记录
	String GETNEWSFORPAGE = "from NewsInfo order by publishDate desc";
	//通过编号查询新闻信息
	String GETNEWSBYID = "from NewsInfo where newsId=:newsId";
	
	//分页按条件查询社员信息
	String QUERYMEMBERFORPAGE= "from MembersInfo m where m.memberId=:memberId and m.status=1 order by m.memberId desc";
	
	//按条件查询社团信息
	String QUERYASSOBYID = "from AssociationInfo a where a.assoId=:assoId and a.assoStatus=1 order by a.assoId desc";
	
	//查询社团人数(and c.status=1表示社员已经申请，0表示审核中，审核中的不计入统计)
	String QUERYASSONUM = "from ContactInfo c where c.associationInfo.assoId=:assoId and c.status=1";
	
	//查询指定社团编号的社团活动数
	String QUERYASSOACTIVNUM = "from AssoActivities a where a.assoId=:assoId";
	
	//查询社员留言信息
	String QUERYMSGINFO = "from MessageInfo m order by m.msgTime desc";
	
	//查询社团活动信息
	String QUERYASSOACTIV = "from AssoActivities aa order by aa.sendTime desc";
	
	//查询管理员信息
	String QUERYADMININFO = "from AdminInfo";
	
	//查询社团名及其社员人数
	String ASSOIMGREPORT = "select a.assoName, count(a.assoId) from ContactInfo c,AssociationInfo a where c.associationInfo.assoId=a.assoId and c.status=1 group by a.assoName ";
	
	//获取新闻的最大编号，这里本来是要建立序列的，这里直接简单处理了
	String GETSEQUNEWSID = "from NewsInfo n order by n.newsId desc";
	//获取新闻的最大编号，这里本来是要建立序列的，这里直接简单处理了
	String GET_SEQUE_NOTICEID = "from SiteNotice s order by s.noticeId desc";
	
	/*----------------------个人空间---------------------*/
	//按用户编号查询其详细信息
	String GET_SPACE_USER_BYID = "from MembersInfo m where m.memberId=:memberId";
	//按编号查询社员留言信息
	String GET_SPACE_MSG_BYID = "from MessageInfo msg where msg.membersInfo.memberId=:memberId";
	//按编号查询社员参加的社团信息
	String GET_SPACE_ASSO_BYID = "select c.associationInfo from ContactInfo c where c.membersInfo.memberId=:memberId and c.status=1 and c.associationInfo.assoStatus=1";
	//添加社团与社员的关联信息时获取主键最大编号
	String GET_SEQUE_CONTACTID = "from ContactInfo c order by c.contactId desc";
	//判断该社员是否已经加入了该社团
	String GET_MEMBER_ASSO_BYID = "select c.associationInfo from ContactInfo c where c.membersInfo.memberId=:memberId and c.associationInfo.assoId=:assoId";
	// 查询指定编号社员申请的未审核的社团信息
	String GET_ASSO_BYID_STATUS = "select c.associationInfo from ContactInfo c where c.membersInfo.memberId=:memberId and c.status=0";
	// 获取所有社员申请的未审核的社团信息
	String GET_ALL_BYID_STATUS = "from ContactInfo c where c.status=:status order by c.joinDate desc";
	//查询待审批或已审批的社团信息
	String DEAL_ASSO_STATUS = "from AssociationInfo a where a.assoStatus=:assoStatus order by a.regDate desc";
	//添加社团时获取主键最大编号
	String GET_SEQUE_ASSOID = "from AssociationInfo a order by a.assoId desc";
	//查询新注册的社团信息
	String SHOWASSOALLINFO = "from AssociationInfo a order by a.regDate desc";
	
	//新社员注册
	String GET_SEQUE_MEMBERID = "from MembersInfo m order by m.memberId desc";
	//查询新注册待审核社员信息
	String QUERY_MEMBER_STATUS = "from MembersInfo m where m.status=:status order by m.memberId desc";
}
