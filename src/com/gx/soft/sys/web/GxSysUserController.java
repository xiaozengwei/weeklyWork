package com.gx.soft.sys.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.gx.soft.common.util.DateUtil;
import com.gx.soft.common.util.FileUtil;
import com.gx.soft.home.persistence.domain.SxpzRecord;
import com.gx.soft.home.persistence.manager.SxpzRecordManager;
import com.gx.soft.mobile.persistence.domain.GxOaMobileRoleHasUser;
import com.gx.soft.mobile.persistence.domain.GxOaMobileRoleHasUserId;
import com.gx.soft.mobile.persistence.domain.GxSysOrgCopy;
import com.gx.soft.mobile.persistence.domain.VUserCopy;
import com.gx.soft.mobile.persistence.manager.GxOaMobileRoleHasUserManager;
import com.gx.soft.mobile.persistence.manager.GxSysOrgCopyManager;
import com.gx.soft.mobile.persistence.manager.VUserCopyManager;
import com.gx.soft.sys.persistence.domain.*;
import com.gx.soft.sys.persistence.manager.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.mapper.BeanMapper;
import com.gx.core.page.Page;
import com.gx.core.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("sysuser")
@SessionAttributes("user_session")
public class GxSysUserController {
	private GxSysOrgManager gxSysOrgManager;
	private VUserManager vUserManager;
	private SysUserManager gxUserManager;
	private GxSysUserInOrgManager gxSysUserInOrgManger;
	private BeanMapper beanMapper = new BeanMapper();
	private ArrayList<String> rowIdList=new ArrayList<>();
	@Autowired
	private SysUserManager sysUserManager;
	@Autowired
	private SxpzRecordManager sxpzRecordManager;
	@Autowired
	private GxOaMobileRoleHasUserManager gxOaMobileRoleHasUserManager;
	/**
	 * 前往用户列表页面
	 * 
	 *  page
	 *  parameterMap
	 *  model
	 * @return
	 */
	@RequestMapping("user-list")
	public String list(@ModelAttribute Page page, String orgId,
			@RequestParam Map<String, Object> parameterMap, Model model) {
		parameterMap.put("filter_EQS_orgId", orgId);
		page.addOrder("dataOrder", "asc");
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = vUserManager.pagedQuery(page, propertyFilters);
		List<VUser> userList = (List<VUser>) page.getResult();

		page.setResult(userList);
		model.addAttribute("page", page);
		model.addAttribute("orgId", orgId);

		return "sys/user/user-list";
	}

	/**
	 * 前往用户列表页面Copy
	 *
	 *  page
	 *  parameterMap
	 *  model
	 * @return
	 */
	@RequestMapping("user-list1")
	public String list1(@ModelAttribute Page page, String orgId,
					   @RequestParam Map<String, Object> parameterMap, Model model) {
		parameterMap.put("filter_EQS_orgId", orgId);
		page.addOrder("dataOrder", "asc");
		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = vUserCopyManager.pagedQuery(page, propertyFilters);
		List<VUserCopy> userList = (List<VUserCopy>) page.getResult();

		page.setResult(userList);
		model.addAttribute("page", page);
		model.addAttribute("orgId", orgId);

		return "sys/user/user-list1";

	}
	@RequestMapping("user-tz-list")
	public String userTzList(@ModelAttribute Page page, String bdId,
						@RequestParam Map<String, Object> parameterMap, Model model,@ModelAttribute("user_session")VUser user) {
		if(user.getComBdId()==null) {
			parameterMap.put("filter_EQS_bdId", bdId);
			page.addOrder("createTime", "desc");
			List<PropertyFilter> propertyFilters = PropertyFilter
					.buildFromMap(parameterMap);
			page = sysUserManager.pagedQuery(page, propertyFilters);
			List<GxSysUser> userList = (List<GxSysUser>) page.getResult();
			page.setResult(userList);
		}else if(user.getComBdId().equals(bdId)){
			parameterMap.put("filter_EQS_bdId", bdId);
			page.addOrder("createTime", "desc");
			List<PropertyFilter> propertyFilters = PropertyFilter
					.buildFromMap(parameterMap);
			page = sysUserManager.pagedQuery(page, propertyFilters);
			List<GxSysUser> userList = (List<GxSysUser>) page.getResult();
			page.setResult(userList);
		}
		model.addAttribute("page", page);
		model.addAttribute("bdId", bdId);
		model.addAttribute("orgId", "123");
		return "sys/tz/user-list";

	}

	/**
	 * 前往用户的添加/修改页面
	 *
	 * @param
	 *  model
	 * @return
	 */
	@RequestMapping("user-input")
	public String input(
			@RequestParam(value = "rowId", required = false) String rowId,
			String orgId, Model model) {
		GxSysUser gxSysUser = null;
		if (rowId != null) {
			gxSysUser = gxUserManager.get(rowId);
		} else {
			gxSysUser = new GxSysUser();
		}
		model.addAttribute("orgId", orgId);
		model.addAttribute("model", gxSysUser);
		return "sys/user/user-input";
	}

	/**
	 * 前往用户的添加/修改页面Copy
	 *
	 *
	 *  model
	 * @return
	 */
	@RequestMapping("user-input1")
	public String input1(
			@RequestParam(value = "rowId", required = false) String rowId,
			String orgId, Model model) {
		GxSysUser gxSysUser = null;
		if (rowId != null) {
			gxSysUser = gxUserManager.get(rowId);
		} else {
			gxSysUser = new GxSysUser();
		}
		model.addAttribute("orgId", orgId);
		model.addAttribute("model", gxSysUser);
		return "sys/user/user-input1";
	}

	@RequestMapping("user-tz-look")
	public String lookTz(
			@RequestParam(value = "rowId", required = false) String rowId,
			String orgId, Model model) {
		GxSysUser gxSysUser = null;
		if (rowId != null) {
			gxSysUser = gxUserManager.get(rowId);
			String hql="from FileRecord where relationId=?";
		}
		model.addAttribute("orgId", orgId);
		model.addAttribute("model", gxSysUser);
		return "sys/tz/user-look-tz";
	}
	/**
	 * 用户的保存/更新
	 * 
	 *  gxsysUser
	 * @return
	 */
	@RequestMapping(value = "user-save", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> save(GxSysUser gxsysUser, String orgId,
			HttpSession session) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		String statusCode = "200", message = "操作成功";
		Timestamp ts = DateUtil.getDate();

		VUser gxuser = (VUser) (session.getAttribute("user_session") == null ? null
				: session.getAttribute("user_session"));
		try {
			if(!orgId.equals("")){
				if(gxUserManager.findUniqueBy("userId",gxsysUser.getUserId())!=null){
					throw new Exception("登录名已存在");
				}
			}

			GxSysUser dest = null;
			String id = gxsysUser.getRowId();
			String opt = "save";
			String oldUserId = "";
			if (id != null && id.length() > 0) {
				dest = gxUserManager.get(id);
				oldUserId = dest.getUserId();
				if(!oldUserId.equals(gxsysUser.getUserId())){
					if(gxUserManager.findUniqueBy("userId",gxsysUser.getUserId())!=null){
						throw new Exception("登录名已存在");
					}
				}
				if (dest != null) {
					beanMapper.copy(gxsysUser, dest);
					dest.setModifyTime(ts);
					opt = "update";
				}
			} else {
				dest = gxsysUser;
				dest.setRowId(null);
				dest.setCreateTime(ts);

			}
			gxUserManager.save(dest);
			if (opt.equals("save")) {// 保存操作：保存用户和组织机构关系
				GxSysUserInOrg gxSysUserInOrg = new GxSysUserInOrg();
				gxSysUserInOrg.setCreateTime(ts);
				gxSysUserInOrg.setCreateUserId(gxuser != null ? gxuser
						.getUserId() : "");
				gxSysUserInOrg.setOrgId(orgId);
				gxSysUserInOrg.setUserId(dest.getUserId());
				gxSysUserInOrg.setDataOrder(dest.getDataOrder());

				String hql = "SELECT max(t.dataOrder) FROM  GxSysUserInOrg t where t.orgId=?";
				List maxNum = gxSysUserInOrgManger.find(hql, orgId);
				int num = 1;
				if (maxNum.size() < 1) {
					num = 1;
				} else {
					Object obj = maxNum.get(0);
					num = !StringUtils.validateLong(obj) ? 1 : new BigDecimal(
							obj.toString()).intValue() + 1;

				}
				gxSysUserInOrg.setDataOrder(num);
				gxSysUserInOrgManger.save(gxSysUserInOrg);
				dest.setDataOrder(num);
				gxUserManager.save(dest);
			} else {// 更新操作
				Map<String, Object> parameterMap = new HashMap<String, Object>();
				parameterMap.put("filter_EQS_orgId", orgId);
				parameterMap.put("filter_EQS_userId", oldUserId);
				List<PropertyFilter> propertyFilters = PropertyFilter
						.buildFromMap(parameterMap);
				List<GxSysUserInOrg> userInOrgList = gxSysUserInOrgManger
						.find(propertyFilters);
				GxSysUserInOrg uio = userInOrgList != null
						&& userInOrgList.size() > 0 ? userInOrgList.get(0)
						: null;
				if (uio != null) {
					uio.setDataOrder(dest.getDataOrder());// 更新排序状态
					uio.setUserId(dest.getUserId());// 更新userId
					gxSysUserInOrgManger.save(uio);
				}
			}

		} catch (Exception e) {
			statusCode = "300";
			message = "操作失败";
			message+="——"+e.getMessage();
			e.printStackTrace();
		}

		resMap.put("statusCode", statusCode);
		resMap.put("message", message);
		resMap.put("closeCurrent", true);
		resMap.put("divid", "user-manager-user-list");

		return resMap;

	}



	/**
	 * 用户的删除
	 * 
	 *  delids
	 * @return
	 */
	@RequestMapping("user-remove")
	public @ResponseBody
	Map<String, Object> userRemove(String delids,
			@RequestParam(defaultValue = "####") String orgId) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		String statusCode = "200", message = "删除成功";
		try {
			if (delids != null && delids.length() > 0) {
				Map<String, Object> parameterMap = new HashMap<String, Object>();
				String[] ids = delids.split(",");

				for (String rowId : ids) {

					if (rowId != null) {
						GxSysUser sysUser = gxUserManager.get(rowId);
						if (sysUser != null) {
							gxUserManager.remove(sysUser);
						}
						String userId = sysUser.getUserId();
						// 删除组织机构-人员关联关系
						parameterMap.put("filter_EQS_userId", userId);
						parameterMap.put("filter_EQS_orgId", orgId);
						List<PropertyFilter> propertyFilters = PropertyFilter
								.buildFromMap(parameterMap);
						List<GxSysUserInOrg> userInOrgList = gxSysUserInOrgManger
								.find(propertyFilters);
						for (GxSysUserInOrg o : userInOrgList) {
							gxSysUserInOrgManger.remove(o);
						}
						parameterMap.clear();

					}

				}

			}
		} catch (Exception e) {
			statusCode = "300";
			message = "删除失败";
		}
		resMap.put("statusCode", statusCode);
		resMap.put("message", message);
		resMap.put("divid", "user-manager-user-list");
		return resMap;
	}





	/**
	 * 前往人员管理总页面（左侧是组织树，右侧是人员管理）
	 * 
	 * roleId
	 *  model
	 * @return
	 */
	@RequestMapping("user-manager-page")
	public String userManagerPage(Model model) {
		return "sys/user/user-manager";
	}


	/**
	 * 前往人员管理总页面（左侧是组织树，右侧是人员管理）Copy
	 *
	 *  roleId
	 *  model
	 * @return
	 */
	@RequestMapping("user-manager-page1")
	public String userManagerPage1(Model model) {
		return "sys/user/user-manager1";
	}



	/**
	 * 多组织人员添加页面
	 * 
	 *  rowId
	 *  orgId
	 *  model
	 * @return
	 */
	@RequestMapping("user-input-orgs")
	public String orgsUserinput(
			@RequestParam(value = "rowId", required = false) String rowId,
			String orgId, Model model) {
		GxSysUser gxSysUser = null;
		if (rowId != null) {
			gxSysUser = gxUserManager.get(rowId);
		} else {
			gxSysUser = new GxSysUser();
		}
		model.addAttribute("orgId", orgId);
		model.addAttribute("model", gxSysUser);
		return "sys/user/add-orgs-user";
	}

	/**
	 * 多组织人员添加页面
	 *
	 *  rowId
	 *  orgId
	 *  model
	 * @return
	 */
	@RequestMapping("user-input-orgs1")
	public String orgsUserinput1(
			@RequestParam(value = "rowId", required = false) String rowId,
			String orgId, Model model) {
		GxSysUser gxSysUser = null;
		if (rowId != null) {
			gxSysUser = gxUserManager.get(rowId);
		} else {
			gxSysUser = new GxSysUser();
		}
		model.addAttribute("orgId", orgId);
		model.addAttribute("model", gxSysUser);
		return "sys/user/add-orgs-user1";
	}


	/**
	 * 多组织人员添加-保存操作
	 *
	 *  gxsysUser
	 *  orgId
	 *  session
	 * @return
	 */
	@RequestMapping(value = "orgsuser-save", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> orgsUserSave(String userId, String orgId,
			HttpSession session) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		String statusCode = "200", message = "操作成功";
		Timestamp ts = DateUtil.getDate();

		VUser gxuser = (VUser) (session.getAttribute("user_session") == null ? null
				: session.getAttribute("user_session"));
		try {
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			if (StringUtils.validateString(userId)) {
				String[] userIdArr = userId.split(",");
				for (String eUserId : userIdArr) {
					parameterMap.put("filter_EQS_orgId", orgId);
					parameterMap.put("filter_EQS_userId", eUserId);
					List<PropertyFilter> propertyFilters = PropertyFilter
							.buildFromMap(parameterMap);
					List<GxSysUserInOrg> userInOrgList = gxSysUserInOrgManger
							.find(propertyFilters);
					GxSysUserInOrg uio = userInOrgList != null
							&& userInOrgList.size() > 0 ? userInOrgList.get(0)
							: null;
					if (uio == null) {
						String hql = "SELECT max(t.dataOrder) FROM  GxSysUserInOrg t where t.orgId=?";
						List maxNum = gxSysUserInOrgManger.find(hql, orgId);
						int num = 1;
						if (maxNum.size() < 1) {
							num = 1;
						} else {
							Object obj = maxNum.get(0);
							num = !StringUtils.validateLong(obj) ? 1
									: new BigDecimal(obj.toString()).intValue() + 1;
						}

						GxSysUserInOrg gxSysUserInOrg = new GxSysUserInOrg();
						gxSysUserInOrg.setCreateTime(ts);
						gxSysUserInOrg.setCreateUserId(gxuser != null ? gxuser
								.getUserId() : "");
						gxSysUserInOrg.setOrgId(orgId);
						gxSysUserInOrg.setUserId(eUserId);
						gxSysUserInOrg.setDataOrder(num);
						gxSysUserInOrgManger.save(gxSysUserInOrg);
					}
				}
			}
		} catch (Exception e) {
			statusCode = "300";
			message = "操作失败";
			e.printStackTrace();
		}

		resMap.put("statusCode", statusCode);
		resMap.put("message", message);
		resMap.put("closeCurrent", true);
		resMap.put("divid", "user-manager-user-list");

		return resMap;

	}



	/**
	 * 解除用户和组织关系
	 * 
	 *  delids
	 *  orgId
	 * @return
	 */
	@RequestMapping("user-orgs-remove")
	public @ResponseBody
	Map<String, Object> userOrgsRemove(String delids,
			@RequestParam(defaultValue = "####") String orgId) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		String statusCode = "200", message = "删除成功";
		try {
			if (delids != null && delids.length() > 0) {
				Map<String, Object> parameterMap = new HashMap<String, Object>();
				String[] ids = delids.split(",");

				for (String rowId : ids) {

					if (rowId != null) {

						GxSysUser sysUser = gxUserManager.get(rowId);
						if (sysUser != null) {
							// gxUserManager.remove(sysUser);
							String userId = sysUser.getUserId();
							// 删除组织机构-人员关联关系
							parameterMap.put("filter_EQS_userId", userId);
							parameterMap.put("filter_EQS_orgId", orgId);
							List<PropertyFilter> propertyFilters = PropertyFilter
									.buildFromMap(parameterMap);
							List<GxSysUserInOrg> userInOrgList = gxSysUserInOrgManger
									.find(propertyFilters);
							for (GxSysUserInOrg o : userInOrgList) {
								gxSysUserInOrgManger.remove(o);
							}
							parameterMap.clear();
						}
					}
				}
			}
		} catch (Exception e) {
			statusCode = "300";
			message = "删除失败";
		}
		resMap.put("statusCode", statusCode);
		resMap.put("message", message);
		resMap.put("divid", "user-manager-user-list");
		return resMap;
	}


	/**
	 * 选择关联用户页面
	 * 
	 *  rowId
	 *  userName
	 *  page
	 *  parameterMap
	 *  model
	 * @return
	 */
	@RequestMapping("userlookup")
	public String userlookup(@ModelAttribute Page page,
			@RequestParam Map<String, Object> parameterMap, Model model,String userId,String userName) {

		List<PropertyFilter> propertyFilters = PropertyFilter
				.buildFromMap(parameterMap);
		page = gxUserManager.pagedQuery(page, propertyFilters);
		page.addOrder("createTime","desc");
		List<GxSysUser> userList = (List<GxSysUser>) page.getResult();
		page.setResult(userList);
		page.setPageSize(15);
		model.addAttribute("page", page);
		model.addAttribute("userId", userId);
		model.addAttribute("userName", userName);
		return "sys/user/userlookup";
	}



	/**
	 * 文件的排序更新
	 * 
	 *  file
	 *  fileTypeId
	 *  session
	 * @return
	 */
	@RequestMapping(value = "updateOrder/{opt}", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, Object> updateOrder(String uioRowId, @PathVariable String opt,
			@ModelAttribute("user_session") VUser user, HttpSession session) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		String statusCode = "200", message = "操作成功";
		Timestamp ts = DateUtil.getDate();

		try {
			GxSysUserInOrg srcUio = gxSysUserInOrgManger.get(uioRowId);
			String orgId = srcUio.getOrgId();
			String userId = srcUio.getUserId();
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("filter_EQS_orgId", orgId);
			List<PropertyFilter> propertyFilters = PropertyFilter
					.buildFromMap(params);
			List<GxSysUserInOrg> userRList = gxSysUserInOrgManger.find(
					"dataOrder", true, propertyFilters);
			int srcIndex = userRList.indexOf(srcUio);// 该元素在列表中所在的索引号
			int count = userRList.size();
			int destCount = -1;// 准备交换的元素的索引
			if (srcIndex != -1) {// 不等于-1，表示在列表中能查找到

				int addend = 0;
				if (opt.equals("up")) {
					if (srcIndex != 0) {// 如果当前已经是第一个元素，不操作；否则查找上一个元素
						destCount = srcIndex - 1;
					} else {
						destCount = srcIndex;
					}
				} else if (opt.equals("down")) {// 若是降序操作，被加数为1
					if (srcIndex != count - 1) {// 如果当前已经是最后一个元素，不操作；否则查找下个元素
						destCount = srcIndex + 1;
					} else {
						destCount = srcIndex;
					}
				}
			}
			if (destCount != -1) {
				// 查找交换的实体，交换order后保存到数据库
				if (destCount == srcIndex) {// 当前元素索引和目标索引一致，说明是同一个元素，不需要调换顺序
					statusCode = "200";
					message = "当前已经是第一个/最后一个元素";
				} else {
					GxSysUserInOrg destUio = userRList.get(destCount);
					int srcOrder = srcUio.getDataOrder();
					int destOrder = destUio.getDataOrder();
					srcUio.setDataOrder(destOrder);
					destUio.setDataOrder(srcOrder);
					// 同步更新用户表中的排序字段
					GxSysUser srcUser = gxUserManager.findUniqueBy("userId",
							srcUio.getUserId());
					if (srcUser != null) {
						srcUser.setDataOrder(srcUio.getDataOrder());
						gxUserManager.save(srcUser);
					}
					GxSysUser destUser = gxUserManager.findUniqueBy("userId",
							destUio.getRowId());
					if (destUser != null) {
						destUser.setDataOrder(destUio.getDataOrder());
						gxUserManager.save(destUser);
					}

					gxSysUserInOrgManger.save(destUio);
					gxSysUserInOrgManger.save(srcUio);
				}
			}

		} catch (Exception e) {
			statusCode = "300";
			message = "操作失败";
			e.printStackTrace();
		}

		resMap.put("statusCode", statusCode);
		resMap.put("message", message);
		resMap.put("divid", "user-manager-user-list");
		return resMap;

	}



	/**
	 * 含有组织树总页面
	 * 
	 *  rowId用户ID
	 *  model
	 * @return
	 */
	@RequestMapping("org-page")
	public String getOrgs(
			String rowId,
			@RequestParam(defaultValue = "add", required = false) String group,
			@RequestParam(defaultValue = "", required = false) String boxId,
			@RequestParam(defaultValue = "navtab", required = false) String target,
			Model model) {
		String hql = "from GxSysOrg order by dataOrder asc";
		List<GxSysOrg> orgList = gxSysOrgManager.find(hql, new Object[] {});
		model.addAttribute("orgList", orgList);
		model.addAttribute("userId", rowId);
		model.addAttribute("target", target);
		model.addAttribute("group", group);
		model.addAttribute("boxId", boxId);
		return "sys/user/org-bring-back";
	}



	/**
	 * 用户的保存/更新
	 * 
	 *  gxsysUser
	 * @return
	 */
	@RequestMapping(value = "user-org-update", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> updateOrg(String orgId, String userId,
			HttpSession session) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		String statusCode = "200", message = "操作成功";
		Timestamp ts = DateUtil.getDate();

		if (statusCode.equals("200")) {
			try {
				GxSysUser dest = null;
				String oldUserId = "";
				if (StringUtils.validateString(userId)) {
					dest = gxUserManager.get(userId);
					oldUserId = dest.getUserId();
					// 更新操作
					Map<String, Object> parameterMap = new HashMap<String, Object>();
					// parameterMap.put("filter_EQS_orgId", orgId);
					parameterMap.put("filter_EQS_userId", oldUserId);
					List<PropertyFilter> propertyFilters = PropertyFilter
							.buildFromMap(parameterMap);
					List<GxSysUserInOrg> userInOrgList = gxSysUserInOrgManger
							.find(propertyFilters);
					GxSysUserInOrg uio = userInOrgList != null
							&& userInOrgList.size() > 0 ? userInOrgList.get(0)
							: null;
					if (uio != null) {
						// uio.setDataOrder(dest.getDataOrder());// 更新排序状态
						// uio.setUserId(dest.getUserId());// 更新userId
						String hql="select max(t.dataOrder) from GxSysUserInOrg t where t.orgId=?";
						List maxnum=gxSysUserInOrgManger.find(hql,"0"+orgId);
						int dataOrder;
						if(maxnum.size()<1){
							dataOrder=1;
						}else {
							Object object=maxnum.get(0);
							dataOrder=!StringUtils.validateLong(object)?1:new BigDecimal(object.toString()).intValue()+1;
						}
						uio.setOrgId("0"+orgId);
						uio.setDataOrder(dataOrder);
						uio.setCreateTime(ts);
						gxSysUserInOrgManger.save(uio);
					}
				}

			} catch (Exception e) {
				statusCode = "300";
				message = "操作失败";
				e.printStackTrace();
			}
		}

		resMap.put("statusCode", statusCode);
		resMap.put("message", message);
		resMap.put("closeCurrent", true);
		resMap.put("divid", "user-manager-user-list");

		return resMap;

	}







	@RequestMapping("user-import")
	public String userImports(Model model,String orgId) {
		model.addAttribute("orgId",orgId);
		return "sys/user/user-import";
	}



	@RequestMapping("test")
	public @ResponseBody Map<String, Object> test(String path) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		Workbook wb0=null;
		boolean flog=false;
		try {
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			InputStream in= new FileInputStream("C:\\Users\\Admin\\Desktop\\"+path);
//			wb0=new XSSFWorkbook(in);
			wb0=new HSSFWorkbook(in);
			Sheet sheet = wb0.getSheetAt(0);
			int i=0;
			for(Row row:sheet) {
				i++;
				if (i==1){
					continue;
				}
				if(row.getCell(1)==null){
					break;
				}
				VUserCopy user=vUserCopyManager.findUniqueBy("userName",row.getCell(0).getStringCellValue());
				if (user==null){
					resMap.put(row.getCell(0).getStringCellValue(),row.getCell(0).getStringCellValue());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}

	@Resource
	public void setGxSysOrgManager(GxSysOrgManager gxSysOrgManager) {
		this.gxSysOrgManager = gxSysOrgManager;
	}
	@Resource
	public void setvUserManager(VUserManager vUserManager) {
		this.vUserManager = vUserManager;
	}
	@Resource(name="vUserCopyManager")
	private VUserCopyManager vUserCopyManager;
	@Resource(name="gxSysOrgCopyManager")
	private GxSysOrgCopyManager gxSysOrgCopyManager;
	@Autowired
	private GxRoleHasUserManager gxRoleHasUserManager;
	@Resource
	public void setGxSysUserInOrgManger(
			GxSysUserInOrgManager gxSysUserInOrgManger) {
		this.gxSysUserInOrgManger = gxSysUserInOrgManger;
	}
	@Resource
	public void setGxUserManager(SysUserManager gxUserManager) {
		this.gxUserManager = gxUserManager;
	}
}
