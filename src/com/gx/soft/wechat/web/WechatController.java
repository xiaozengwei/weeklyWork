package com.gx.soft.wechat.web;

import com.alibaba.fastjson.JSONObject;
import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.util.StringUtils;
import com.gx.soft.common.util.DateUtil;
import com.gx.soft.common.util.FileUtil;
import com.gx.soft.common.util.HttpRequest;
import com.gx.soft.mobile.persistence.vo.JsonResult;
import com.gx.soft.mobile.web.MobileLoginController;
import com.gx.soft.sys.persistence.domain.GxSysOrg;
import com.gx.soft.sys.persistence.domain.GxSysUser;
import com.gx.soft.sys.persistence.manager.GxSysOrgManager;
import com.gx.soft.sys.persistence.manager.SysUserManager;
import com.gx.soft.weeklywork.persistence.domain.DicMeetroom;
import com.gx.soft.weeklywork.persistence.domain.FileRecord;
import com.gx.soft.weeklywork.persistence.domain.MeetingArrangement;
import com.gx.soft.weeklywork.persistence.domain.MeetroomUse;
import com.gx.soft.weeklywork.persistence.manager.*;
import com.gx.soft.weeklywork.web.WeeklyworkController;
import org.apache.http.entity.StringEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("wechat")
public class WechatController {
    @Autowired
    private SysUserManager sysUserManager;

    @Autowired
    private FileRecordManager fileRecordManager;

    @Autowired
    private DicMeetroomManager dicMeetroomManager;

    @Autowired
    private GxSysOrgManager gxSysOrgManager;

    @Autowired
    private CalendarIndexManager calendarIndexManager;

    @Autowired
    private WvoManager wvoManager;

    @Autowired
    private MeetroomUseManager meetroomUseManager;
    //    @Autowired
//    private MeetingArrangementManager meetingArrangementManager;
    private static Logger logger = LoggerFactory
            .getLogger(WechatController.class);
    @Autowired
    private MeetingArrangementManager meetingArrangementManager;


    private List<String> rowIdList = new ArrayList<>();


    @RequestMapping("get-openID")
    @ResponseBody
    public JsonResult getOpenId(String code) {
        //发送 GET 请求
        String s = HttpRequest.sendPost("https://api.weixin.qq.com/sns/jscode2session?", "appid=wxb28503062b535ddf&secret=71763677e5f0c9cfa3660d6b74257ea2&" +
                "js_code=" + code + "&grant_type=authorization_code");
        return new JsonResult("200", s, "成功");
    }

    @RequestMapping("user-instance")
    @ResponseBody
    public GxSysUser getUserInstance(String openid) {
        GxSysUser user = null;
        user = sysUserManager.findUniqueBy("openid", openid);
        return user;
    }

    @ResponseBody
    @RequestMapping("user-save")
    public void szgmkxjUserSave(String city, String country, String gender, String language, String nickName, String province, String openid, String avatarUrl, String userMail, String userMobileNum, String userName, String age, String userRowId) {
        GxSysUser user = null;
        user = sysUserManager.findUniqueBy("openid", openid);
        Timestamp ts = DateUtil.getDate();
        if (user == null) {
            GxSysUser gxSysUser = new GxSysUser();
            gxSysUser.setRowId(null);
            gxSysUser.setCity(city);
            gxSysUser.setCountry(country);
            gxSysUser.setLanguage(language);
            gxSysUser.setNickName(nickName);
            gxSysUser.setProvince(province);
            if (Integer.valueOf(gender) == 0) {
                gxSysUser.setUserSex("未知");
            } else if (Integer.valueOf(gender) == 1) {
                gxSysUser.setUserSex("男");
            } else {
                gxSysUser.setUserSex("女");
            }
            gxSysUser.setOpenid(openid);
            gxSysUser.setAvatarUrl(avatarUrl);
            gxSysUser.setCreateTime(ts);
            if (age != null && age.length() > 0) {
                gxSysUser.setAge(Integer.valueOf(age));
            }
            sysUserManager.save(gxSysUser);
        } else {
            user.setUserMail(userMail);
            user.setUserMobileNum(userMobileNum);
            user.setUserName(userName);
            user.setModifyTime(ts);
            if (age != null && age.length() > 0) {
                user.setAge(Integer.valueOf(age));
            }
            sysUserManager.save(user);
        }
    }

    @RequestMapping("upload-img")
    @ResponseBody
    public String uploadImg(@RequestParam MultipartFile file, Model model, HttpSession session) {
        Map<String, Object> resMap = new HashMap<String, Object>();
        model.addAttribute("message", "File '" + file.getOriginalFilename());
        String fileOriginalName = file.getOriginalFilename();
        String statusCode = "200", message = "上传成功";
        FileRecord fileRecord = new FileRecord();
        try {
            if (!StringUtils.isEmpty(fileOriginalName)) {
                FileUtil fileHelper = new FileUtil();
                String decodeFileName = fileHelper.getDecodeFileName(fileOriginalName);// 文件名编码
                String mFilePath = "C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file" + decodeFileName;
                fileHelper.createFile(mFilePath, file.getBytes());
                fileRecord.setFilePath(mFilePath);
                fileRecord.setFileName("file" + decodeFileName);
                Timestamp time = new Timestamp(System.currentTimeMillis());
                fileRecord.setUploadTime(time);
                fileRecord.setFileType(file.getContentType());
                fileRecordManager.save(fileRecord);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (fileRecord.getRowId() != null) {
            rowIdList.add(fileRecord.getRowId());
        }
        return fileRecord.getFileName();
    }

    @RequestMapping("send-msg")
    @ResponseBody
//    @Scheduled(cron = "0/5 * *  * * ? ")
    public void sendMsg() {
        List<MeetingArrangement> meetingArrangementList = meetingArrangementManager.getAll();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String ss = HttpRequest.sendPost("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential", "&appid=wxb28503062b535ddf&secret=71763677e5f0c9cfa3660d6b74257ea2");
        JSONObject jsonObject = JSONObject.parseObject(ss);
        for (MeetingArrangement meetingArrangement : meetingArrangementList) {
            if (meetingArrangement.getStartTime().toString().split(" ")[0].equals(df.format(new Date()))) {
                String[] callLeaderNames = null;
                String[] callUsersNames = null;
                if (!StringUtils.isEmpty(meetingArrangement.getCallLeaderName())) {
                    callLeaderNames = meetingArrangement.getCallLeaderName().split(",");
                }
                if (!StringUtils.isEmpty(meetingArrangement.getCallUsersName())) {
                    callUsersNames = meetingArrangement.getCallUsersName().split(",");
                }
                if (callLeaderNames != null && callLeaderNames.length > 0 && !callLeaderNames.equals("null")) {
                    for (int i = 0; i < callLeaderNames.length; i++) {
                        String hql = "from GxSysUser where userName=?";
                        GxSysUser gxSysUser = null;
                        List<GxSysUser> gxSysUserList = new ArrayList<>();
                        System.out.println("&&&&&&&&&&&&&&&&&&&&" + callLeaderNames[i]);
                        if (callLeaderNames[i] != null && callLeaderNames[i].length() > 0 && !callLeaderNames[i].equals("null")) {
                            gxSysUserList = sysUserManager.find(hql, String.valueOf(callLeaderNames[i]));
                        }
                        if (gxSysUserList.size() > 0) {
                            gxSysUser = gxSysUserList.get(0);
//                    thing1 thing1=new thing1(meetingArrangement.getTitle());
//                    thing2 thing2=new thing2(meetingArrangement.getMeetingRoomName());
//                    thing3 thing3=new thing3("111");
                            thing1 thing1 = new thing1("1");
                            thing2 thing2 = new thing2("2");
                            thing3 thing3 = new thing3("3");
                            Data data = new Data(thing1, thing2, thing3);

                            WVo wVo = new WVo();
                            wVo.setData(data);
                            wVo.setTemplate_id("3asQKBC1H4HJGdNR1WruXLs3keCJJ6lJOWa6tzXbK7M");
                            wVo.setTouser("oqCt55H3p8W04nyK2Z_jkFYfm-uk");
                            wVo.setPage("index");

                            JSONObject jsonObject1 = JSONObject.parseObject(JSONObject.toJSON(wVo).toString());
                            System.out.println(jsonObject1);
                            System.out.println(JSONObject.toJSON(wVo).toString());

                            String wwc = HttpRequest.sendPost("https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + jsonObject.getString("access_token"), JSONObject.toJSON(wVo).toString());
                            System.out.println(wwc);

                        }
                    }
                }
//                if (callUsersNames != null && callUsersNames.length > 0 && !callUsersNames.equals("null")) {
//                    for (int i = 0; i < callUsersNames.length; i++) {
//                        GxSysUser gxSysUser = null;
//                        String hql = "from GxSysUser where userName=?";
//                        List<GxSysUser> gxSysUserList = new ArrayList<>();
//                        System.out.println("**************" + callUsersNames[i]);
//                        gxSysUserList = sysUserManager.find(hql, String.valueOf(callUsersNames[i]));
//                        if (gxSysUserList.size() > 0) {
//                            gxSysUser = gxSysUserList.get(0);
//
//
////                    thing1 thing1=new thing1(meetingArrangement.getTitle());
////                    thing2 thing2=new thing2(meetingArrangement.getMeetingRoomName());
////                    thing3 thing3=new thing3("111");
//                            thing1 thing1 = new thing1("1");
//                            thing2 thing2 = new thing2("2");
//                            thing3 thing3 = new thing3("3");
//                            Data data = new Data(thing1, thing2, thing3);
//
//                            WVo wVo = new WVo();
//                            wVo.setData(data);
//                            wVo.setTemplate_id("3asQKBC1H4HJGdNR1WruXLs3keCJJ6lJOWa6tzXbK7M");
//                            wVo.setTouser("oqCt55H3p8W04nyK2Z_jkFYfm-uk");
//                            wVo.setPage("index");
//
//                            JSONObject jsonObject1 = JSONObject.parseObject(JSONObject.toJSON(wVo).toString());
//                            System.out.println(jsonObject1);
//                            System.out.println(JSONObject.toJSON(wVo).toString());
//
//                            String wwc = HttpRequest.sendPost("https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + jsonObject.getString("access_token"), JSONObject.toJSON(wVo).toString());
//                            System.out.println(wwc);
//
//                        }
//                    }
//                }

            }
        }
    }

    @RequestMapping("get-meetingromm")
    @ResponseBody
    public List<DicMeetroom> getMeetingromm() {
        return dicMeetroomManager.getAll();
    }

    @RequestMapping("get-org")
    @ResponseBody
    public List<GxSysOrg> getOrg() {
        return gxSysOrgManager.getAll();
    }

    @RequestMapping("get-user")
    @ResponseBody
    public List<GxSysUser> getUser() {
        return sysUserManager.find("from GxSysUser where dataOrder is not null order by dataOrder asc");
    }

    /**
     * @param address   手输会议地点
     * @param msg       会议内容
     * @param result1   选择人员
     * @param result    选择部门
     * @param result2   选择会议地点
     * @param result4   上下午
     * @param date
     * @param userRowId
     * @param buMen     手输部门
     * @param person    手输人员
     * @param time      2020-1-15 11:0
     * @param openid    openid
     * @return
     * @throws Exception
     */
    @RequestMapping("save-form")
    @ResponseBody
    public String saveForm(String address, String msg, String result1, String result, String result2, String result4,
                           String date, String userRowId, String buMen, String person, String time, String openid) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        GxSysUser gxSysUser = sysUserManager.findUniqueBy("userId", userRowId);

        if(gxSysUser==null){
            return "该用户未授权";
        }

        MeetingArrangement meetingArrangement = new MeetingArrangement();
        meetingArrangement.setCreateUserId(gxSysUser.getUserId());
        if (msg != null && msg.length() > 0 && !msg.equals("null")) {
            meetingArrangement.setTitle(msg);
        }
        String meetingRoom = null;
        if (address != null && address.length() > 0 && !address.equals("null")) {
            System.out.println("#############" + address);

            meetingArrangement.setMeetingRoomName(address);
            meetingRoom = address;
        } else {
            System.out.println("#######################" + result2);

            meetingArrangement.setMeetingRoomName(result2);
            meetingRoom = result2;
        }
        if (person != null && person.length() > 0 && !person.equals("null")) {
            if (result1 != null && result1.length() > 0 && !result1.equals("null")) {
                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                System.out.println(person);
                System.out.println(result1);
                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                meetingArrangement.setCallUsersName(person + "," + result1);
            } else {
                meetingArrangement.setCallUsersName(person);
            }
        } else {
            if (result1 != null && result1.length() > 0 && !result1.equals("null")) {
                meetingArrangement.setCallUsersName(result1);
            }
        }
        if (buMen != null && buMen.length() > 0 && !buMen.equals("null")) {
            meetingArrangement.setCallOrgsName(buMen + "," + result);
        } else {
            meetingArrangement.setCallOrgsName(result);
        }

//
        if (result != null && result.length() > 0 && !result.equals("null")) {
            String[] col = result.split(",");
            if (col.length > 0) {
                for (String c : col) {
                    if (c.equals("办公室")) {
                        meetingArrangement.setExt2("1");
                    }
                }
            }
        }
        if (time.substring(time.indexOf(":") + 1, time.length()).length() == 1) {
            time += "0";
        }
        meetingArrangement.setStartTime(Timestamp.valueOf(time + ":00"));
        String sTime = time + ":00";
        String eTime = null;
        if (result4 != null && result4.length() > 0) {
            String[] dateList = result4.split(",");
            if (dateList.length == 2) {
                meetingArrangement.setEndTime(Timestamp.valueOf(time.split(" ")[0] + " 18:00:00"));
                eTime = time.split(" ")[0] + " 18:00:00";
            } else {
                meetingArrangement.setEndTime(Timestamp.valueOf(time.split(" ")[0] + " 12:00:00"));
                if(time.split(" ")[0].equals("上午")){
                    eTime = time.split(" ")[0] + " 12:00:00";
                }else {
                    eTime = time.split(" ")[0] + " 18:00:00";
                }
            }
            System.out.println("TIME：" + time);
        } else {
            meetingArrangement.setEndTime(Timestamp.valueOf(time.split(" ")[0] + " 12:00:00"));
            eTime = time.split(" ")[0] + " 12:00:00";
        }
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        meetingArrangement.setApplyDate(ts);
        meetingArrangement.setExt3(openid);
        Map<String, String> resultStauts = useMeetingRoomIsOk(sTime, eTime, meetingRoom, meetingArrangement.getCallUsersName());
        if (msg != null && !msg.equals("null") && msg.length() > 0) {
            if (resultStauts.get("flag").equals("1")) {
                System.out.println("11111111111111111111111111111111111111" + sTime);
                System.out.println("22222222222222222222222222222222222222" + sdf.format(sdf1.parse(sTime)));
                Map<String, Integer> map = DateUtil.getWeekAndYear(sdf.format(sdf1.parse(sTime)));
//
//
                meetingArrangement.setYear(map.get("year").toString());
                meetingArrangement.setWeek(map.get("week").toString());
                meetingArrangement.setDayOfWeek(String.valueOf(DateUtil.dayForWeekByCh(sdf.format(meetingArrangement.getStartTime()))));
//                if(meetingArrangement.getCallUsersName()!=null && meetingArrangement.getCallUsersName().length()>0
//                        &&meetingArrangement.getCallOrgsName()!=null && meetingArrangement.getCallOrgsName().length()>0 ) {
                meetingArrangement.setCallUsersName(meetingArrangement.getCallUsersName() + "," + meetingArrangement.getCallOrgsName());
//                }
                meetingArrangementManager.save(meetingArrangement);

                List<DicMeetroom> list = dicMeetroomManager.findBy("mtName", meetingArrangement.getMeetingRoomName());
                if (list != null && list.size() > 0) {
                    useMeetroom(meetingArrangement.getStartTime(), meetingArrangement.getEndTime(), meetingArrangement.getMeetingRoomName(), "1");
                }

            } else {
                return resultStauts.get("message");
            }
        }
        if (rowIdList.size() > 0) {
            FileRecord fileRecord1 = fileRecordManager.get(rowIdList.get(0));
            fileRecord1.setArrangementId(meetingArrangement.getRowId());
            fileRecordManager.save(fileRecord1);
        }
        rowIdList.clear();
        System.out.println("save-end");
        return "成功";
    }

    @RequestMapping("get-meeting")
    @ResponseBody
    public List<WVo> getMeeting(String userName) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//        and startTime > ? and  endTime< ?
//        Timestamp.valueOf(df.format(new Date())+" 00:00:00"), Timestamp.valueOf(getFetureDate(7)+" 00:00:00")
        String hql = "from WVo where (callLeaderName like ?  or  callUsersName like ?)  order by startTime asc";
        System.out.println();
        return wvoManager.find(hql, "%" + userName + "%", "%" + userName + "%");
    }

    public static String getFetureDate(int past) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + past);
        Date today = calendar.getTime();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String result = format.format(today);
        return result;
    }

    public Map<String, String> useMeetingRoomIsOk(String start, String end, String meetingRoom, String callUsersName) throws Exception {
        Map<String, String> result = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
        String flag = "0";
        String message = "";
        System.out.println("会议室：" + meetingRoom);
        System.out.println("开始时间：" + start);
        System.out.println("结束时间：" + end);

        //判断会议室是否被占用
        String hql1 = "from MeetingArrangement where meetingRoomName = ? " +
                "and (startTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                "and startTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
        Object[] values1 = {meetingRoom, start, end};
        List<MeetingArrangement> roomApplyList1 = meetingArrangementManager.find(hql1, values1);
        if (roomApplyList1 != null && roomApplyList1.size() > 0) {
            //已占用
            flag = "0";
            message = "该时间段已有会议安排";
        } else {
            String hql2 = "from MeetingArrangement where meetingRoomName = ? " +
                    "and startTime < DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s')";
            Object[] values2 = {meetingRoom, start, end};
            List<MeetingArrangement> roomApplyList2 = meetingArrangementManager.find(hql2, values2);
            if (roomApplyList2 != null && roomApplyList2.size() > 0) {
                //已占用
                flag = "0";
                message = "该时间段已有会议安排";
            } else {
                //未占用
                flag = "1";
            }
        }
        if (!flag.equals("0")) {
            String hql3 = "from MeetingArrangement where meetingRoomName = ? " +
                    "and (endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
            Object[] values3 = {meetingRoom, start, end};
            List<MeetingArrangement> roomApplyList3 = meetingArrangementManager.find(hql3, values3);
            if (roomApplyList3 != null && roomApplyList3.size() > 0) {
                //已占用
                flag = "0";
                message = "该时间段已有会议安排";
            } else {
                //未占用
                flag = "1";
            }
        }

        //如果会议室选填不存在即不需要判断是否被占用
        List<DicMeetroom> list = dicMeetroomManager.findBy("mtName", meetingRoom);
        if (!(list != null && list.size() > 0)) {
            flag = "1";
        }

        //判断时间段内是否有领导参加其他会议
        if (flag.equals("1")) {
            String userHql = "from MeetingArrangement where " +
                    "(startTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and startTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
            Object[] userValues1 = {start, end};
            List<MeetingArrangement> userList1 = meetingArrangementManager.find(userHql, userValues1);

            int i = 0;

            for (MeetingArrangement meetingArrangement : userList1) {
                for (String leaderName : callUsersName.split(",")) {
                    if (meetingArrangement.getCallUsersName() != null && meetingArrangement.getCallUsersName().contains(leaderName)) {
                        flag = "3";
                        message = leaderName + "在" + sdf.format(meetingArrangement.getStartTime()) + "点已有会议";
                        result.put("flag", flag);
                        result.put("message", message);
                        return result;
                    }
                }
            }

            String userHql2 = "from MeetingArrangement where " +
                    "startTime < DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s')";
            Object[] userValues2 = {start, end};
            List<MeetingArrangement> userList2 = meetingArrangementManager.find(userHql2, userValues2);

            for (MeetingArrangement meetingArrangement : userList2) {
                for (String leaderName : callUsersName.split(",")) {
                    if (meetingArrangement.getCallUsersName() != null && meetingArrangement.getCallUsersName().contains(leaderName)) {
                        flag = "3";
                        message = leaderName + "在" + sdf.format(meetingArrangement.getStartTime()) + "点已有会议";
                        result.put("flag", flag);
                        result.put("message", message);
                        return result;
                    }
                }
            }

            String userHql3 = "from MeetingArrangement where " +
                    "(endTime >= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s') " +
                    "and endTime <= DATE_FORMAT(?,'%Y-%m-%d %H:%i:%s'))";
            Object[] userValues3 = {start, end};
            List<MeetingArrangement> userList3 = meetingArrangementManager.find(userHql3, userValues3);
            for (MeetingArrangement meetingArrangement : userList3) {
                for (String leaderName : callUsersName.split(",")) {
                    if (meetingArrangement.getCallUsersName() != null && meetingArrangement.getCallUsersName().contains(leaderName)) {
                        flag = "3";
                        message = leaderName + "在" + sdf.format(meetingArrangement.getStartTime()) + "点已有会议";
                        result.put("flag", flag);
                        result.put("message", message);
                        return result;
                    }
                }
            }

        }
        result.put("flag", flag);
        result.put("message", message);
        return result;
    }

    /**
     * @param startTime    开始时间
     * @param endTime      结束时间
     * @param meetRoomName 会议室
     * @param status       解除/绑定 ，1/绑定 、0/解绑
     * @throws Exception
     */
    public void useMeetroom(Timestamp startTime, Timestamp endTime, String meetRoomName, String status) throws Exception {
        String startType = "";
        String endType = "";
        Map<String, Object> parameterMap = new HashMap<>();
        SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String meetStartTime = d.format(startTime);
        String meetEndTime = d.format(endTime);
        Date st = d.parse(meetStartTime);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(st);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        if (hour >= 0 && hour <= 12) {
            startType = "上午";
        } else {
            startType = "下午";
        }
        Date en = d.parse(meetEndTime);
        Calendar calendar1 = Calendar.getInstance();
        calendar1.setTime(en);
        int hour1 = calendar1.get(Calendar.HOUR_OF_DAY);
        if (hour1 >= 0 && hour1 <= 12) {
            endType = "上午";
        } else {
            endType = "下午";
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String startStartTime = df.format(st);
        String endStartTime = df.format(en);
        /*parameterMap.clear();*/
        //start +1
        Calendar start = Calendar.getInstance();
        start.setTime(df.parse(startStartTime));
        //compare with start
        Calendar end = Calendar.getInstance();
        end.setTime(df.parse(endStartTime));

        Map<String, Integer> map = DateUtil.getWeekAndYear(df.format(start.getTime()));
        String year = map.get("year").toString();
        String week = map.get("week").toString();
        parameterMap.put("filter_EQS_aWeek", week);
        parameterMap.put("filter_EQS_aYear", year);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        String calenderIndex = calendarIndexManager.find(propertyFilters).get(0).getRowId();
        int startWeekDay = DateUtil.dayForWeek(startStartTime);
        if (startStartTime.equals(endStartTime)) {
            if (startType.equals("上午") && endType.equals("上午")) {
                saveMeetRoomUse(startWeekDay, "上午", meetRoomName, calenderIndex, status);
            } else if (startType.equals("下午") && endType.equals("下午")) {
                saveMeetRoomUse(startWeekDay, "下午", meetRoomName, calenderIndex, status);
            } else if (startType.equals("上午") && endType.equals("下午")) {
                saveMeetRoomUse(startWeekDay, "下午", meetRoomName, calenderIndex, status);
                saveMeetRoomUse(startWeekDay, "上午", meetRoomName, calenderIndex, status);
            }
        } else {
            if (startType.equals("上午")) {
                saveMeetRoomUse(startWeekDay, "上午", meetRoomName, calenderIndex, status);
                saveMeetRoomUse(startWeekDay, "下午", meetRoomName, calenderIndex, status);
            } else {
                saveMeetRoomUse(startWeekDay, "下午", meetRoomName, calenderIndex, status);
            }
        }

        while (start.before(end)) {
            if (!df.format(start.getTime()).equals(startStartTime)) {
                map = DateUtil.getWeekAndYear(df.format(start.getTime()));
                year = map.get("year").toString();
                week = map.get("week").toString();
                parameterMap.put("filter_EQS_aWeek", week);
                parameterMap.put("filter_EQS_aYear", year);
                calenderIndex = calendarIndexManager.find(PropertyFilter
                        .buildFromMap(parameterMap)).get(0).getRowId();
                int weekDay = DateUtil.dayForWeek(df.format(start.getTime()));
                saveMeetRoomUse(weekDay, "上午", meetRoomName, calenderIndex, status);
                saveMeetRoomUse(weekDay, "下午", meetRoomName, calenderIndex, status);
            }
            start.add(Calendar.DATE, 1);
        }

        if (!startStartTime.equals(endStartTime)) {
            map = DateUtil.getWeekAndYear(df.format(end.getTime()));
            year = map.get("year").toString();
            week = map.get("week").toString();
            parameterMap.put("filter_EQS_aWeek", week);
            parameterMap.put("filter_EQS_aYear", year);
            calenderIndex = calendarIndexManager.find(PropertyFilter
                    .buildFromMap(parameterMap)).get(0).getRowId();
            int endWeekDay = DateUtil.dayForWeek(endStartTime);
            if (endType.equals("上午")) {
                saveMeetRoomUse(endWeekDay, "上午", meetRoomName, calenderIndex, status);
            } else {
                saveMeetRoomUse(endWeekDay, "上午", meetRoomName, calenderIndex, status);
                saveMeetRoomUse(endWeekDay, "下午", meetRoomName, calenderIndex, status);
            }
        }
    }

    /**
     * 保存会议室使用表
     *
     * @param weekDay（星期几）
     * @param dayType（上午、下午）
     * @param meetRoomName（会议室名称）
     * @param calenderIndex（周表主键）
     * @param type（会议室使用类型        1：已申请未确认、2：已确定、0：没占用）
     * @throws Exception
     */
    public void saveMeetRoomUse(int weekDay, String dayType, String meetRoomName, String calenderIndex, String type) throws Exception {
        String hql = "";
        if (dayType.equals("上午")) {
            hql = "select a from MeetroomUse a where a.meetingRoomName = ? " +
                    "and a.indexId =?" +
                    "and a.morning =?";
        } else if (dayType.equals("下午")) {
            hql = "select a from MeetroomUse a where a.meetingRoomName = ? " +
                    "and a.indexId =?" +
                    "and a.afternoon =?";
        }
        Object[] values = {meetRoomName, calenderIndex, "1"};
        MeetroomUse meetRoomUse = meetroomUseManager.findUnique(hql, values);
        if (meetRoomUse == null) {
            meetRoomUse = new MeetroomUse();
            meetRoomUse.setRowId(null);
            meetRoomUse.setIndexId(calenderIndex);
            meetRoomUse.setMeetingRoomName(meetRoomName);
            if (dayType.equals("上午")) {
                meetRoomUse.setMorning("1");
            } else if (dayType.equals("下午")) {
                meetRoomUse.setAfternoon("1");
            }
        }
        if (weekDay == 1) {
            meetRoomUse.setMonday(type);
        } else if (weekDay == 2) {
            meetRoomUse.setTuesday(type);
        } else if (weekDay == 3) {
            meetRoomUse.setWednesday(type);
        } else if (weekDay == 4) {
            meetRoomUse.setThursday(type);
        } else if (weekDay == 5) {
            meetRoomUse.setFriday(type);
        } else if (weekDay == 6) {
            meetRoomUse.setSaturday(type);
        } else if (weekDay == 7) {
            meetRoomUse.setSunday(type);
        }
        // 保存
        meetroomUseManager.save(meetRoomUse);
    }


    @RequestMapping("send-msg1")
    @ResponseBody
//    @Scheduled(cron = "0/5 * *  * * ? ")
    public void sendMsg1() throws InterruptedException {
        String ss = HttpRequest.sendPost("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential", "&appid=wxb28503062b535ddf&secret=71763677e5f0c9cfa3660d6b74257ea2");
        JSONObject jsonObject = JSONObject.parseObject(ss);
        thing1 thing1 = new thing1("南京地铁");
        thing2 thing2 = new thing2("新街口");
        thing3 thing3 = new thing3("2020-01-01");
        Data data = new Data(thing1, thing2, thing3);


        System.out.println("南京地铁"+thing1.toString());
        System.out.println("新街口"+thing2.toString());


        WVo wVo = new WVo();
        wVo.setData(data);
        wVo.setTemplate_id("3asQKBC1H4HJGdNR1WruXLs3keCJJ6lJOWa6tzXbK7M");
        wVo.setTouser("oqCt55H3p8W04nyK2Z_jkFYfm-uk");
        wVo.setPage("index");

        JSONObject jsonObject1 = JSONObject.parseObject(JSONObject.toJSON(wVo).toString());
        System.out.println(jsonObject1);
        System.out.println(JSONObject.toJSON(wVo).toString());
        String wwc = HttpRequest.sendPost("https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + jsonObject.getString("access_token"), JSONObject.toJSON(wVo).toString());
        System.out.println(wwc);

//            Thread.sleep(10000);
    }

    /**
     * 获取人的本周数量
     * @param userName
     * @return
     * @throws Exception
     */
    @RequestMapping("get-userName-count")
    @ResponseBody
    public String getUserNameCount(String userName) throws Exception{
        if(userName==null||userName.equals("")){
            return "0";
        }
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Integer> map=DateUtil.getWeekAndYear(simpleDateFormat.format(new Date()));

        String year=map.get("year").toString();
        String week=map.get("week").toString();

        String hql="from MeetingArrangement where week=? and year=? order by startTime desc";
        List<MeetingArrangement> meetingArrangements = meetingArrangementManager.find(hql,week,year);
        int i=0;
        for(MeetingArrangement meetingArrangement:meetingArrangements){
            if((meetingArrangement.getCallUsersName()!=null&&meetingArrangement.getCallUsersName().contains(userName))||
                    meetingArrangement.getCallLeaderName()!=null&&meetingArrangement.getCallLeaderName().contains(userName)){
                i++;
            }

        }
        return String.valueOf(i);
    }
}