package com.gx.soft.weeklywork.web;

import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.mapper.BeanMapper;
import com.gx.core.page.Page;
import com.gx.core.util.StringUtils;
import com.gx.soft.common.util.DateUtil;
import com.gx.soft.sys.persistence.domain.GxSysUser;
import com.gx.soft.sys.persistence.domain.GxSysUserInOrg;
import com.gx.soft.sys.persistence.domain.VUser;
import com.gx.soft.weeklywork.persistence.domain.DicMeetroom;
import com.gx.soft.weeklywork.persistence.domain.MeetingArrangement;
import com.gx.soft.weeklywork.persistence.domain.MeetroomUse;
import com.gx.soft.weeklywork.persistence.manager.DicMeetroomManager;
import com.gx.soft.weeklywork.persistence.manager.MeetingArrangementManager;
import com.gx.soft.weeklywork.persistence.manager.MeetroomUseManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("meetingRoom")
@SessionAttributes("user_session")
public class MeetingRoomController {
    @Autowired
    private DicMeetroomManager dicMeetroomManager;
    @Autowired
    private MeetingArrangementManager meetingArrangementManager;
    @Autowired
    private MeetroomUseManager meetroomUseManager;

    private BeanMapper beanMapper = new BeanMapper();

    @RequestMapping("list")
    public String list(@ModelAttribute Page page, Model model, @ModelAttribute("user_session") VUser user,@RequestParam Map<String, Object> parameterMap){
        List<PropertyFilter> propertyFilterList=PropertyFilter.buildFromMap(parameterMap);
        page=dicMeetroomManager.pagedQuery(page,propertyFilterList);
        model.addAttribute("page",page);
        return "notice/meetingroom-list";
    }

    @RequestMapping("remove")
    public @ResponseBody Map<String, Object> remove(String delids){
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "删除成功";
        try {
            if (delids != null && delids.length() > 0) {
                Map<String, Object> parameterMap = new HashMap<String, Object>();
                String[] ids = delids.split(",");

                for (String id : ids) {
                    DicMeetroom dicMeetroom=dicMeetroomManager.get(id);
                    dicMeetroomManager.removeById(id);
                    List<MeetingArrangement> list=meetingArrangementManager.findBy("meetingRoomName",dicMeetroom.getMtName());
                    for(MeetingArrangement meetingArrangement:list){
                        meetingArrangementManager.remove(meetingArrangement);
                    }
                    List<MeetroomUse> meetroomUseList=meetroomUseManager.findBy("meetingRoomName",dicMeetroom.getMtName());
                    for(MeetroomUse meetroomUse:meetroomUseList){
                        meetroomUseManager.remove(meetroomUse);
                    }
                }
            }
        } catch (Exception e) {
            statusCode = "300";
            message = "删除失败";
            e.printStackTrace();
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);
        resMap.put("divid", "user-manager-user-list");
        return resMap;
    }

    /**
     * 前往用户的添加/修改页面
     *
     * @param
     *  model
     * @return
     */
    @RequestMapping("input")
    public String input(
            @RequestParam(value = "rowId", required = false) String rowId,
            String orgId, Model model) {
        DicMeetroom dicMeetroom = null;
        if (rowId != null) {
            dicMeetroom = dicMeetroomManager.get(rowId);
        } else {
            dicMeetroom = new DicMeetroom();
        }
        model.addAttribute("orgId", orgId);
        model.addAttribute("model", dicMeetroom);
        return "notice/meetingroom-input";
    }

    /**
     * 会议室的保存/更新
     *
     *
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> save(DicMeetroom dicMeetroom,String rowId) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String statusCode = "200", message = "操作成功";
        Timestamp ts = DateUtil.getDate();
        try {
            DicMeetroom dest = null;
            String id = dicMeetroom.getRowId();
            if (id != null && id.length() > 0) {
                dest = dicMeetroomManager.get(id);
                beanMapper.copy(dicMeetroom, dest);
            } else {
                dest = dicMeetroom;
                dest.setRowId(null);
            }
            if(!dest.getMtName().equals(dicMeetroom.getMtName())){
                List<MeetingArrangement> list=meetingArrangementManager.findBy("meetingRoomName",dest.getMtName());
                for(MeetingArrangement meetingArrangement:list){
                    meetingArrangement.setMeetingRoomName(dicMeetroom.getMtName());
                    meetingArrangementManager.save(meetingArrangement);
                }
                List<MeetroomUse> meetroomUseList=meetroomUseManager.findBy("meetingRoomName",dest.getMtName());
                for(MeetroomUse meetroomUse:meetroomUseList){
                    meetroomUse.setMeetingRoomName(dicMeetroom.getMtName());
                    meetroomUseManager.save(meetroomUse);
                }
            }
            dest.setDicFunctionId("xzbg-meetroom");
            dicMeetroomManager.save(dest);
        } catch (Exception e) {
            statusCode = "300";
            message = "操作失败";
            message+="——"+e.getMessage();
            e.printStackTrace();
        }
        resMap.put("statusCode", statusCode);
        resMap.put("message", message);

        resMap.put("closeCurrent", true);
        return resMap;
    }

}
