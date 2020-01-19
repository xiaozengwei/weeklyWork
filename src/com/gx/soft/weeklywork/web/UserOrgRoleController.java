package com.gx.soft.weeklywork.web;

import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.mapper.BeanMapper;
import com.gx.core.page.Page;
import com.gx.soft.common.util.DateUtil;
import com.gx.soft.sys.persistence.domain.GxSysRole;
import com.gx.soft.sys.persistence.domain.GxSysUser;
import com.gx.soft.sys.persistence.manager.SysUserManager;
import com.gx.soft.weeklywork.persistence.domain.GxSysOrgRoleHasUser;
import com.gx.soft.weeklywork.persistence.domain.GxSysUserOrgRole;
import com.gx.soft.weeklywork.persistence.domain.VOrgRoleUser;
import com.gx.soft.weeklywork.persistence.manager.GxSysOrgRoleHasUserManager;
import com.gx.soft.weeklywork.persistence.manager.GxSysUserOrgRoleManager;
import com.gx.soft.weeklywork.persistence.manager.VOrgRoleUserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 一周工作安排控制器
 */
@Controller
@RequestMapping("roleuserorg")
@SessionAttributes("user_session")
public class UserOrgRoleController {
    @Autowired
    GxSysUserOrgRoleManager gxSysUserOrgRoleManager;
    @Autowired
    GxSysOrgRoleHasUserManager gxSysOrgRoleHasUserManager;
    @Autowired
    VOrgRoleUserManager vOrgRoleUserManager;
    @Autowired
    SysUserManager gxUserManager;
    private BeanMapper beanMapper = new BeanMapper();

    /**
     * 前往角色列表页面
     *
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("role-list")
    public String list(@ModelAttribute Page page,
                       @ModelAttribute String orderField,
                       @ModelAttribute String orderDirection,
                       @RequestParam Map<String, Object> parameterMap, Model model) {

        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.addOrder("dataOrder","asc");
        page = gxSysUserOrgRoleManager.pagedQuery(page, propertyFilters);
        List<GxSysUserOrgRole> roleList = (List<GxSysUserOrgRole>) page.getResult();
        page.setResult(roleList);
        model.addAttribute("page", page);
        model.addAttribute("orderField", orderField);
        model.addAttribute("orderDirection", orderDirection);

        return "role/role_list1";

    }

    /**
     * 前往角色的添加/修改页面
     *
     * @param
     * @param model
     * @return
     */
    @RequestMapping("role-input")
    public String input(
            @RequestParam(value = "rowId", required = false) String rowId,
            Model model) {
        GxSysUserOrgRole gxSysRole = null;
        if (rowId != null) {
            gxSysRole = gxSysUserOrgRoleManager.get(rowId);
        } else {
            gxSysRole = new GxSysUserOrgRole();
        }
        model.addAttribute("model", gxSysRole);
        return "role/role-input1";
    }

    /**
     * 角色的保存/更新
     *
     * @param gxSysRole
     * @param
     * @return
     */
    @RequestMapping(value = "role-save", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> save(GxSysUserOrgRole gxSysRole) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "操作成功";
        Timestamp ts = DateUtil.getDate();
        try {
            GxSysUserOrgRole dest = null;
            String id = gxSysRole.getRowId();

            if (id != null && id.length() > 0) {
                dest = gxSysUserOrgRoleManager.get(id);
                beanMapper.copy(gxSysRole, dest);
            } else {
                dest = gxSysRole;
                dest.setRowId(null);
                dest.setCreateTime(ts);
            }
            gxSysUserOrgRoleManager.save(dest);

        } catch (Exception e) {
            statusCode = "300";
            message = "操作失败";
            e.printStackTrace();
        }

        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("closeCurrent", true);

        return resMap;

    }

    /**
     * 角色的删除
     *
     * @return
     */
    @RequestMapping("role-remove")
    public @ResponseBody
    Map<String, Object> roleRemove(String delids) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "删除成功";
        try {
            if (delids != null && delids.length() > 0) {
                String[] ids = delids.split(",");
                for (String rowId : ids) {
                    if (rowId != null) {
                        GxSysUserOrgRole sysRole = gxSysUserOrgRoleManager.get(rowId);
                        String roleId = sysRole.getRoleId();
                        List<GxSysOrgRoleHasUser> roleUserList = gxSysOrgRoleHasUserManager.findBy("roleId", roleId);


						/* 删除角色用户关联表中的该角色对应的数据 */

                        if (roleUserList != null && roleUserList.size() > 0) {
                            for (GxSysOrgRoleHasUser roleHasUser : roleUserList) {
                                if (roleHasUser != null) {
                                    gxSysOrgRoleHasUserManager.remove(roleHasUser);
                                }
                            }
                        }
                    }
                    gxSysUserOrgRoleManager.removeById(rowId);
                }

            }
        } catch (Exception e) {
            statusCode = "300";
            message = "删除失败";
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("reload", true);
        return resMap;
    }

    /**
     * 前往角色关联用户界面
     *
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("role-userlist")
    public String userlist(@RequestParam(value = "rowId") String rowId,
                           @ModelAttribute Page page,
                           @RequestParam Map<String, Object> parameterMap, Model model) {
        GxSysUserOrgRole sysRole = gxSysUserOrgRoleManager.get(rowId);
        String roleId = "####";
        if (sysRole != null) {
            roleId = sysRole.getRoleId();
        }
        parameterMap.put("filter_EQS_roleId", roleId);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = vOrgRoleUserManager.pagedQuery(page, propertyFilters);
        @SuppressWarnings("unchecked")
        List<VOrgRoleUser> roleHasUserList = (List<VOrgRoleUser>) page.getResult();
        page.setResult(roleHasUserList);
        model.addAttribute("page", page);
        model.addAttribute("roleRowId", rowId);
        return "role/role-userlist1";
    }

    @RequestMapping("role-user-add")
    public String roleUserAdd(String rowId, Model model) {
        model.addAttribute("rowId", rowId);
        return "role/role-adduser1";
    }

    /**
     * 角色关联用户的删除
     *
     * @return
     */
    @RequestMapping("role-removeUser")
    public @ResponseBody
    Map<String, Object> roleUserRemove(String delids) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "删除成功";
        try {
            if (delids != null && delids.length() > 0) {
                String[] rowids = delids.split(",");
				/* 其次遍历指定的rowId获取到指定的roleHasUser对象并删除 */
                for (String rowId : rowids) {
                    gxSysOrgRoleHasUserManager.removeById(rowId);
                }
            }
        } catch (Exception e) {
            statusCode = "300";
            message = "删除失败";
            e.printStackTrace();
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("reload", true);
        return resMap;
    }

    /**
     * 选择关联用户页面
     *
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("role-userlookup")
    public String userlookup(@ModelAttribute Page page, String roleRowid,
                             @RequestParam Map<String, Object> parameterMap, Model model) {
        GxSysUserOrgRole role = gxSysUserOrgRoleManager.get(roleRowid);

        String hqlu = " SELECT u.userId FROM GxSysOrgRoleHasUser u WHERE u.roleId = ?";
        List<String> userIdList = gxSysOrgRoleHasUserManager.find(hqlu,
                role.getRoleId());
        Map<String, Object> paraMap = new HashMap<String, Object>();
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(paraMap);
        List<GxSysUser>  gxuserList = gxUserManager.find(propertyFilters);
        List<GxSysUser>  uuserList = new ArrayList<GxSysUser>();
        for(GxSysUser user : gxuserList){
            if(!userIdList.contains(user.getUserId())){
                uuserList.add(user);
            }
        }

        //Object[] userids = userIdList.toArray();
        String useridString = "";
        for (GxSysUser user : uuserList) {
            String id = user.getUserId();
            if (id != null) {
                useridString += id + ",";
            }
        }
        if (useridString.length() > 0) {
            useridString = useridString.substring(0, useridString.length() - 1);
        }
        parameterMap.put("filter_INS_userId", useridString);
        propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = gxUserManager.pagedQuery(page, propertyFilters);
        List<GxSysUser> userList = (List<GxSysUser>) page.getResult();
        page.setResult(userList);
        model.addAttribute("page", page);
        model.addAttribute("roleRowid", roleRowid);
        return "role/role-userlookup1";
    }


    /**
     * 角色关联用户的保存
     *
     * @param
     */
    @RequestMapping("role-saveUserToRole")
    public @ResponseBody
    Map<String, Object> saveUserToRole(String roleRowId,
                                       @RequestParam(value = "userId", required = false) String userIds) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "保存成功";
        try {
            GxSysUserOrgRole gxSysRole = gxSysUserOrgRoleManager
                    .findUniqueBy("rowId", roleRowId);
            String roleId = gxSysRole.getRoleId();
            String[] userIdGroup = userIds.split(",");
            Timestamp ts = DateUtil.getDate();
            List<String> uIdList = new ArrayList<String>();
            for (String id : userIdGroup) {// 去重复的值
                if (!uIdList.contains(id)) {
                    uIdList.add(id);
                }
            }
            for (String userId : uIdList) {
                if (userId != null && roleId != null) {
                    GxSysOrgRoleHasUser roleUser = new GxSysOrgRoleHasUser();
                    roleUser.setUserId(userId);
                    roleUser.setRoleId(roleId);
                    roleUser.setRlType(gxSysRole.getRoleType());
                    roleUser.setCreateTime(ts);
                    gxSysOrgRoleHasUserManager.save(roleUser);
                }
            }

        } catch (Exception e) {
            statusCode = "300";
            message = "保存失败";
            e.printStackTrace();
        }

        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("closeCurrent", true);

        return resMap;

    }


    /**
     * 查找带回-组织页面
     *
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("role-lookup")
    public String orgLookupList(@ModelAttribute Page page,String name,String id,
                                @RequestParam Map<String, Object> parameterMap, Model model) {

        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = gxSysUserOrgRoleManager.pagedQuery(page, propertyFilters);
        List<GxSysUserOrgRole> orgList = (List<GxSysUserOrgRole>) page.getResult();
        page.setResult(orgList);
        model.addAttribute("page", page);
        model.addAttribute("id", id);
        model.addAttribute("name", name);

        return "role/role-lookup";

    }


}
