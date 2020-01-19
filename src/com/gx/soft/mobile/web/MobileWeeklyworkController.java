package com.gx.soft.mobile.web;

import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.page.Page;
import com.gx.soft.mobile.persistence.vo.JsonResult;
import com.gx.soft.sys.persistence.domain.VUser;
import com.gx.soft.sys.persistence.manager.VUserManager;
import com.gx.soft.weeklywork.persistence.manager.MeetingArrangementManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("mobile-weeklyWork")
public class MobileWeeklyworkController {

    private static Logger logger = LoggerFactory
            .getLogger(MobileContectController.class);
    @Autowired
    private VUserManager vUserManager;
    @Autowired
    private MeetingArrangementManager meetingArrangementManager;
    @RequestMapping(value = "list", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    JsonResult list(@ModelAttribute Page page,String startTime,String endTime,String meetingRoomName,String userId) {
        String hql="";
        VUser user = vUserManager.findUniqueBy("userId",userId);
        Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("filter_LIKES_meetingRoomName",meetingRoomName);
        parameterMap.put("filter_GED_startTime",startTime);
        parameterMap.put("filter_LED_endTime",endTime);

        String statusCode = "1";// 成功
        String message = "获取列表成功";
        Map<String, Object> resMap = new HashMap<String, Object>();
        try {
                if(user!=null){
                    if(user.getUserId().equals("admin")){
                        page = meetingArrangementManager.pagedQuery(page,PropertyFilter.buildFromMap(parameterMap));
                    }else {
                        hql="from MeetingArrangement where (callLeaderId like ? or callUsersId like ? or callOrgsId like ?)";
                        if(meetingRoomName!=null&&!meetingRoomName.equals("")){
                            hql+="and meetingRoomName like '%"+meetingRoomName+"%'";
                        }
                        if(startTime!=null&&!startTime.equals("")){
                            hql+="and startTime >'"+startTime+"'";
                        }
                        if(endTime!=null&&!endTime.equals("")){
                            hql+="and endTime <'"+endTime+"'";
                        }
                        page = meetingArrangementManager.pagedQuery(hql,page.getPageCurrent(),page.getPageSize(),"%"+user.getUserId()+"%","%"+user.getUserId()+"%","%"+user.getOrgId()+"%");
                    }
                }else {
                    message="userId不为空";
                }
        } catch (Exception ex) {
            statusCode = "-1";
            message = "获取列表失败";
            logger.error("mobile-weeklyWork------->flist 出错了");
            ex.printStackTrace();
        }

        return new JsonResult(statusCode, page.getResult(), message);
    }

}
