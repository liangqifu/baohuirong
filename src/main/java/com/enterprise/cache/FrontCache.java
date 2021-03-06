package com.enterprise.cache;

import com.enterprise.entity.*;
import com.enterprise.entity.page.PageModel;
import com.enterprise.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.enterprise.core.SystemManage;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;


public class FrontCache implements ServletContextAware {
	private static SystemManage systemManage;
	@Autowired
	private SystemSettingService systemSettingService;
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private FriendLinksService friendLinksService;
	@Autowired
	private IndexImgService indexImgService;
    @Autowired
    private MessageService messageService;
	@Autowired
	private ArticleCategoryService articleCategoryService;
	@Autowired
	private ContactService contactService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private ServiceService serviceService;

	@Autowired
    public void setSystemManage(SystemManage systemManage) {
        FrontCache.systemManage = systemManage;
    }

	private ServletContext servletContext;
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	/**
	 * 载入全部缓存
	 * @throws Exception
	 */
	public void loadAllCache() throws Exception{
		loadFriendLinks();
		loadSystemSetting();
		loadRecruitments();
		loadIndexImg();
        loadMessage();
		loadArticleCategroy();
		loadContact();
		loadAbout();
		loadService();
	}
	/**
	 * 加载系统设置缓存
	 * @throws Exception
     */
	public void loadSystemSetting() throws  Exception{
		SystemSetting systemSetting = systemSettingService.selectOne(new SystemSetting());
		if (systemSetting == null) {
			throw new NullPointerException("未设置系统变量，请管理员在后台进行设置");
		}
		systemSetting.setServerInfo(servletContext.getServerInfo());
		systemSetting.setServerVersion(servletContext.getMajorVersion()+"."+servletContext.getMinorVersion());
		systemSetting.setJavaVersion(System.getProperty("java.version"));
		systemSetting.setJavaHome(System.getProperty("java.home"));
		systemSetting.setOsName(System.getProperty("os.name"));
		systemSetting.setOsVersion(System.getProperty("os.version"));
		systemSetting.setMysqlVersion(systemSettingService.selectVersion());
		systemManage.setSystemSetting(systemSetting);
	}
	/**
	 * 加载友情链接缓存
	 * @throws Exception
	 */
	public void loadFriendLinks() throws Exception{
		List<FriendLinks> friendLinksList = friendLinksService.selectList(new FriendLinks());
		systemManage.setFriendLinks(friendLinksList);
	}

	/**
	 * 加载招聘信息缓存
	 * @throws Exception
     */
	public void loadRecruitments() throws Exception{
		Recruitment e = new Recruitment();
		e.setStatus("y");
		List<Recruitment> recruitmentList = recruitmentService.selectList(e);
		systemManage.setRecruitments(recruitmentList);
	}

	/**
	 * 加载门户图片缓存
	 * @throws Exception
     */
	public void loadIndexImg() throws Exception{
		IndexImg indexImg = new IndexImg();
		indexImg.setStatus("y");
		List<IndexImg> indexImgs = indexImgService.selectList(indexImg);
		systemManage.setIndexImgs(indexImgs);
	}

    /**
     * 加载最近的五条留言
     * @throws Exception
     */
    public void loadMessage() throws Exception{
        Messages messages = new Messages();
        messages.setOffset(0);
        messages.setPageSize(5);
        PageModel page = messageService.selectPageList(messages);
        systemManage.setMessages(page.getList());
    }

	/**
	 * 加载文章分类
	 * @throws Exception
     */
	public void loadArticleCategroy() throws Exception{
		List<ArticleCategory> articleCategoryLIst = new ArrayList<ArticleCategory>();
		articleCategoryLIst = articleCategoryService.selectList(new ArticleCategory());
		systemManage.setArticleCategory(articleCategoryLIst);
		loadNavigation();
	}

	/**
	 * 加载联系我们
	 * @throws Exception
     */
	public void loadContact() throws Exception{
		List<Contact> contacts = new ArrayList<Contact>();
		contacts = contactService.selectList(new Contact());
		systemManage.setContact(contacts);
	}
	/**
	 * 加载关于我们
	 * @throws Exception
     */
	public void loadAbout() throws Exception{
		List<About> abouts = new ArrayList<About>();
		abouts = aboutService.selectList(new About());
		systemManage.setAbout(abouts);
	}

	/**
	 * 加载服务领域
	 * @throws Exception
     */
	public void loadService() throws Exception{
		Service e = new Service();
		e.setOffset(0);
		e.setPageSize(5);
		e.setOrderBy("orders");
		e.setSort("ASC");
		e.setStatus("y");
		PageModel pageModel = serviceService.selectPageList(e);
		systemManage.setService(pageModel.getList());
	}
	
	/**
	 * 加载导航栏
	 * @throws Exception
     */
	public void loadNavigation() throws Exception{
		List<Navigation> list = new ArrayList<Navigation>();
		List<ArticleCategory> articleCategories = articleCategoryService.selectList(new ArticleCategory(0));
		Navigation navigation = null;
		for (ArticleCategory articleCategory : articleCategories) {
			navigation = new Navigation();
			navigation.setId(String.valueOf(articleCategory.getId()));
			navigation.setName(articleCategory.getCatename());
			navigation.setUrl(articleCategory.getUrl());
			navigation.setCode(articleCategory.getCode());
			setNavigationChildren(navigation);
			list.add(navigation);
		}
		systemManage.setNavigations(list);
	}
	
	private void setNavigationChildren(Navigation navigation) {
		List<Navigation> children = new ArrayList<Navigation>();
		List<ArticleCategory> articleCategories = articleCategoryService.selectList(new ArticleCategory(Integer.valueOf(navigation.getId())));
		Navigation child = null;
		for (ArticleCategory articleCategory : articleCategories) {
			child = new Navigation();
			child.setId(String.valueOf(articleCategory.getId()));
			child.setName(articleCategory.getCatename());
			child.setUrl(articleCategory.getUrl());
			child.setCode(articleCategory.getCode());
			int count = articleCategoryService.selectCount(new ArticleCategory(Integer.valueOf(child.getId())));
			if (count > 0) {
				setNavigationChildren(child);
			}
			children.add(child);
		}
		if(!CollectionUtils.isEmpty(children)) {
			navigation.setFirstChild(children.get(0));
		}
		navigation.setChildren(children);
	}

}
