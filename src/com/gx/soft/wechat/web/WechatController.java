package com.gx.soft.wechat.web;

import com.alibaba.fastjson.JSONObject;
import com.gx.core.hibernate.PropertyFilter;
import com.gx.core.util.StringUtils;
import com.gx.soft.common.util.DateUtil;
import com.gx.soft.common.util.FileUtil;
import com.gx.soft.common.util.HttpRequest;
import com.gx.soft.common.util.SendMessage;
import com.gx.soft.mobile.persistence.vo.JsonResult;
import com.gx.soft.mobile.web.MobileLoginController;
import com.gx.soft.sms.ws.SendSMS;
import com.gx.soft.sys.persistence.domain.GxSysOrg;
import com.gx.soft.sys.persistence.domain.GxSysRoleHasUser;
import com.gx.soft.sys.persistence.domain.GxSysUser;
import com.gx.soft.sys.persistence.domain.VUser;
import com.gx.soft.sys.persistence.manager.GxRoleHasUserManager;
import com.gx.soft.sys.persistence.manager.GxSysOrgManager;
import com.gx.soft.sys.persistence.manager.SysUserManager;
import com.gx.soft.sys.persistence.manager.VUserManager;
import com.gx.soft.weeklywork.persistence.domain.DicMeetroom;
import com.gx.soft.weeklywork.persistence.domain.FileRecord;
import com.gx.soft.weeklywork.persistence.domain.MeetingArrangement;
import com.gx.soft.weeklywork.persistence.domain.MeetroomUse;
import com.gx.soft.weeklywork.persistence.manager.*;
import com.gx.soft.weeklywork.web.WeeklyworkController;
import com.sun.xml.internal.bind.XmlAccessorFactory;
import org.apache.http.entity.StringEntity;
import org.apache.poi.util.Internal;
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

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
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
    private VUserManager vUserManager;
    @Autowired
    private SendMessage sendMessage;
    @Autowired
    private MeetroomUseManager meetroomUseManager;
    //    @Autowired
//    private MeetingArrangementManager meetingArrangementManager;
    private static Logger logger = LoggerFactory
            .getLogger(WechatController.class);
    @Autowired
    private MeetingArrangementManager meetingArrangementManager;
    @Autowired
    private GxRoleHasUserManager gxRoleHasUserManager;

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
//                String mFilePath = "C:\\tom\\apache-tomcat-7.0.79-pkgd\\webapps\\wechat-file\\file" + decodeFileName;
                String mFilePath = "C:\\developTools\\apache-tomcat-7.0.75_64\\webapps\\wechat-file\\file" + decodeFileName;
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
        return gxSysOrgManager.find("from GxSysOrg where isShow=1 order by dataOrder asc");
    }

    @RequestMapping("get-user")
    @ResponseBody
    public List<GxSysUser> getUser() {
        return sysUserManager.find("from GxSysUser where userLevel=100 order by dataOrder asc");
    }

    /**
     * @param address   手输会议地点
     * @param msg       会议内容
     * @param result1   选择人员
     * @param result    选择部门
     * @param result2   选择会议地点
     * @param result4   上下午
     * @param result4   上下午
     * @param date
     * @param userRowId
     * @param buMen     手输部门
     * @param person    手输人员
     * @param time      2020-1-15 11:0
     * @param openid    openid
     * @cBbuMen         手输承办部门
     * @result8         承办部门
     * @result9         出席领导
     * @lingdao         手输出席领导
     * @return
     * @throws Exception
     */
    @RequestMapping("save-form")
    @ResponseBody
    public String saveForm(String address, String msg, String result1, String result, String result2, String result4,
                           String date, String userRowId, String buMen, String person, String time, String openid,
                           String cBbuMen,String result8,String result9,String lingdao) throws Exception {
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
        if(cBbuMen!=null&&cBbuMen.length()!=0){
            if(result8!=null&result8.length()!=0){
                meetingArrangement.setUseOrgName(cBbuMen+","+result8);
            }
        }else {
            meetingArrangement.setUseOrgName(result8);
        }
        if(lingdao!=null&&lingdao.length()!=0){
            if(result9!=null&result9.length()!=0){
                meetingArrangement.setCallLeaderName(lingdao+","+result9);
            }
        }else {
            meetingArrangement.setCallLeaderName(result9);
        }
        int resultOrder=200;
        for(String name:meetingArrangement.getCallLeaderName().split(",")){
            VUser vUser=vUserManager.findUniqueBy("userName",name);
            if(vUser!=null&&vUser.getDataOrder()!=null){
                if(vUser.getDataOrder()<resultOrder){
                    resultOrder=vUser.getDataOrder();
                }
            }
        }
        meetingArrangement.setPeriod(resultOrder);
//
//        if (result != null && result.length() > 0 && !result.equals("null")) {
//            String[] col = result.split(",");
//            if (col.length > 0) {
//                for (String c : col) {
//                    if (c.equals("办公室")) {
//                        meetingArrangement.setExt2("1");
//                    }
//                }
//            }
//        }
        //判断是否为管理员
//        List<GxSysRoleHasUser> gxSysRoleHasUsers=gxRoleHasUserManager.findBy("userId",gxSysUser.getUserId());
//        boolean flag=true;
//        for(GxSysRoleHasUser gxSysRoleHasUser:gxSysRoleHasUsers){
//            if(gxSysRoleHasUser.getRoleId().equals("sys-manager-role")){
//                flag=false;
//                break;
//            }
//        }
//        if(flag){
//            meetingArrangement.setExt2("1");
//        }else {
//            meetingArrangement.setExt2("2");
//        }
        meetingArrangement.setExt2("1");

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

    /**
     * 根据姓名查找一周安排 召集人员召集领导，会议通知审核=2 ，会议通知审核过=3
     * @param userName
     * @return
     * @throws Exception
     */
    @RequestMapping("get-meeting")
    @ResponseBody
    public List<com.gx.soft.weeklywork.persistence.domain.WVo> getMeeting(String userName) throws Exception {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Integer> map=DateUtil.getWeekAndYear(df.format(new Date()));
        String year=map.get("year").toString();
        String week=map.get("week").toString();
//        and startTime > ? and  endTime< ?
//        Timestamp.valueOf(df.format(new Date())+" 00:00:00"), Timestamp.valueOf(getFetureDate(7)+" 00:00:00")
        // 领导一周安排
        String hql1 = "from WVo where (callLeaderName like ?  or  callUsersName like ?) and year=? and week=? and ext2=1 order by startTime asc";
        List<com.gx.soft.weeklywork.persistence.domain.WVo> list1=wvoManager.find(hql1, "%" + userName + "%", "%" + userName + "%",year,week);
        //待审核的会议通知
        String hql2 = "from WVo where year=? and (week=? or week=? or week=?) and auditorName=? and ext2=2 order by startTime asc";
        List<com.gx.soft.weeklywork.persistence.domain.WVo> list2=wvoManager.find(hql2, year,week,String.valueOf(Integer.valueOf(week)+1),String.valueOf(Integer.valueOf(week)+2),userName);
        if(list2!=null&&list2.size()>0){
            list1.addAll(list2);
        }
        List<VUser> userList=vUserManager.findBy("userName",userName);
        if(userList!=null&&userList.size()>0){
            VUser vUser=userList.get(0);
            //属于部门一周安排
            String hql33 = "from WVo where callUsersName like ? and year=? and week=? and ext2=1 order by startTime asc";
            List<com.gx.soft.weeklywork.persistence.domain.WVo> list33=wvoManager.find(hql33,  "%" + vUser.getOrgShowName() + "%",year,week);
            //可能还有bug 当有建设办公室和总工程师办公室时有误(但因办公室改名办公室（党办）)
            if(vUser.getOrgShowName().equals("办公室")){
                if(list33!=null&&list33.size()>0){
                    for(com.gx.soft.weeklywork.persistence.domain.WVo wVo:list33){
                        if(wVo.getCallUsersName().contains("总工程师办公室")&&(wVo.getCallUsersName()+"1").split("办公室").length<=2){
                            continue;
                        }
                        list1.add(wVo);
                    }
                }
            }else{
                list1.addAll(list33);
            }

            //各分部门处长 看到领导审核过的会议通知
            if(vUser.getUserLevel()!=null&&vUser.getUserLevel().equals("90")){
                String hql3 = "from WVo where (callLeaderName like ?  or  callUsersName like ?) and year=? and week=? and ext2=3 order by startTime asc";
                List<com.gx.soft.weeklywork.persistence.domain.WVo> list3=wvoManager.find(hql3, "%" + userName + "%", "%" + vUser.getOrgShowName() + "%",year,week);
                if(list3!=null&&list3.size()>0){
                    for(com.gx.soft.weeklywork.persistence.domain.WVo wVo:list3){
                        if(wVo.getCallUsersName().contains("总工程师办公室")&&(wVo.getCallUsersName()+"1").split("办公室").length<=2){
                            continue;
                        }
                        list1.add(wVo);
                    }
                }
            }else {
                String hql5 = "from WVo where (callLeaderName like ?  or  callUsersName like ?) and year=? and week=? and ext2=3 order by startTime asc";
                List<com.gx.soft.weeklywork.persistence.domain.WVo> list5=wvoManager.find(hql5, "%" + userName + "%", "%" + userName + "%",year,week);
                list1.addAll(list5);
            }

//            if(vUser.getUserLevel()!=null&&vUser.getUserLevel().equals("80")){
//                //可以看到办公室的会议通知
//                String hql3 = "from WVo where callUsersName like ? and year=? and week=? and ext2=3 order by startTime asc";
//                List<com.gx.soft.weeklywork.persistence.domain.WVo> list4=wvoManager.find(hql3, "%办公室%",year,week);
//                List<com.gx.soft.weeklywork.persistence.domain.WVo> list5=new ArrayList<>();
//                if(list4!=null&&list4.size()>0){
//                    for(com.gx.soft.weeklywork.persistence.domain.WVo wVo:list4){
//                        if(wVo.getCallUsersName().contains("总工程师办公室")&&(wVo.getCallUsersName()+"1").split("办公室").length<=2){
//                            continue;
//                        }
//                        list5.add(wVo);
//                    }
//                    list1.addAll(list5);
//                }
//            }
        }
        for(com.gx.soft.weeklywork.persistence.domain.WVo wVo:list1){
            String dayofweek=wVo.getDayOfWeek();
            if(dayofweek.equals("星期一")){
                wVo.setDayOfWeek("1");
            }else if(dayofweek.equals("星期二")){
                wVo.setDayOfWeek("2");
            }else if(dayofweek.equals("星期三")){
                wVo.setDayOfWeek("3");
            }else if(dayofweek.equals("星期四")){
                wVo.setDayOfWeek("4");
            }else if(dayofweek.equals("星期五")){
                wVo.setDayOfWeek("5");
            }else if(dayofweek.equals("星期六")){
                wVo.setDayOfWeek("6");
            }else if(dayofweek.equals("星期七")){
                wVo.setDayOfWeek("7");
            }
        }
        return list1;
    }

    /**
     * 获取本周 一周工作会议(公司一周安排会议)
     * @return
     * @throws Exception
     */
    @RequestMapping("get-meeting-all")
    @ResponseBody
    public List<com.gx.soft.weeklywork.persistence.domain.WVo> getMeetingAll() throws Exception{
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Integer> map=DateUtil.getWeekAndYear(df.format(new Date()));
        String year=map.get("year").toString();
        String week=map.get("week").toString();
//        and startTime > ? and  endTime< ?
//        Timestamp.valueOf(df.format(new Date())+" 00:00:00"), Timestamp.valueOf(getFetureDate(7)+" 00:00:00")
        String hql = "from WVo where year=? and week=? and ext2=1 order by startTime asc";
        System.out.println();
        List<com.gx.soft.weeklywork.persistence.domain.WVo> list=wvoManager.find(hql,year,week);
        for(com.gx.soft.weeklywork.persistence.domain.WVo wVo:list){
            String dayofweek=wVo.getDayOfWeek();
            if(dayofweek.equals("星期一")){
                wVo.setDayOfWeek("1");
            }else if(dayofweek.equals("星期二")){
                wVo.setDayOfWeek("2");
            }else if(dayofweek.equals("星期三")){
                wVo.setDayOfWeek("3");
            }else if(dayofweek.equals("星期四")){
                wVo.setDayOfWeek("4");
            }else if(dayofweek.equals("星期五")){
                wVo.setDayOfWeek("5");
            }else if(dayofweek.equals("星期六")){
                wVo.setDayOfWeek("6");
            }else if(dayofweek.equals("星期七")){
                wVo.setDayOfWeek("7");
            }
        }
        return list;
    }

    /**
     * 0/有权限 1没权限 通过判断是否有登录账号和密码
     * @param openId
     * @return
     * @throws Exception
     */
    @RequestMapping("authorization")
    @ResponseBody
    public String authorization(String openId) throws Exception{
        GxSysUser gxSysUser=sysUserManager.findUniqueBy("openid",openId);
        if(gxSysUser!=null&&gxSysUser.getUserId()!=null&&gxSysUser.getUserEnName()!=null){
            return "0";
        }
        return "1";
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
     * 领导审核填写召集人
     * @param rowId 会议安排主键
     * @param callUsers 参会人员
     * @param callOrgs 参会部门
     * @return
     * @throws Exception
     */
    @RequestMapping("pass-action")
    @ResponseBody
    public String passAction(String rowId,String callUsers,String callOrgs) throws Exception {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<MeetingArrangement> list=meetingArrangementManager.findBy("rowId",rowId);
        if(list!=null&&list.size()>0){
            MeetingArrangement meetingArrangement=list.get(0);
            //判断是否有领导 有则上一周工作安排 无则是会议通知（只推送给部门长）
            if(callUsers!=null&&!callUsers.equals("")){
                //有领导上一周工作安排 状态为1
                Map<String, String> resultStauts = useMeetingRoomIsOk(sdf.format(meetingArrangement.getStartTime()), sdf.format(meetingArrangement.getEndTime())
                        , meetingArrangement.getMeetingRoomName(), callUsers);
                if (resultStauts.get("flag").equals("1")) {
                    meetingArrangement.setCallUsersName(callUsers+","+callOrgs);
                    meetingArrangement.setExt2("1");
                }else {
                    return resultStauts.get("message");
                }
            }else {
                //无领导上会议通知 状态为3
                meetingArrangement.setCallUsersName(callOrgs);
                meetingArrangement.setExt2("3");
            }
            meetingArrangementManager.save(meetingArrangement);
            return "success";
        }
        return "服务器网络异常";
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

    @RequestMapping("send-msg2")
//    @ResponseBody
//    @Scheduled(cron = "0/5 * *  * * ? ")
    public void sendMsg2() throws InterruptedException {
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
        wVo.setPage("pages/index/index");
        JSONObject jsonObject1 = JSONObject.parseObject(JSONObject.toJSON(wVo).toString());
        System.out.println(jsonObject1);
        System.out.println(JSONObject.toJSON(wVo).toString());
        String wwc = HttpRequest.sendPost("https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + jsonObject.getString("access_token"), JSONObject.toJSON(wVo).toString());
        System.out.println(wwc);
//            Thread.sleep(10000);
    }

    @RequestMapping("send-msg1")
//    @ResponseBody
//    @Scheduled(cron = "0/5 * *  * * ? ")
    public void sendMsg1(String biaoti,String didian,String time,String openId) throws InterruptedException {
        String ss = HttpRequest.sendPost("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential", "&appid=wxb28503062b535ddf&secret=71763677e5f0c9cfa3660d6b74257ea2");
        JSONObject jsonObject = JSONObject.parseObject(ss);
        thing1 thing1 = new thing1(biaoti);
        thing2 thing2 = new thing2(didian);
        thing3 thing3 = new thing3(time);
        Data data = new Data(thing1, thing2, thing3);
        System.out.println("南京地铁"+thing1.toString());
        System.out.println("新街口"+thing2.toString());
        WVo wVo = new WVo();
        wVo.setData(data);
        wVo.setTemplate_id("3asQKBC1H4HJGdNR1WruXLs3keCJJ6lJOWa6tzXbK7M");
        wVo.setTouser(openId);
        wVo.setPage("pages/index/index");
        JSONObject jsonObject1 = JSONObject.parseObject(JSONObject.toJSON(wVo).toString());
        System.out.println(jsonObject1);
        System.out.println(JSONObject.toJSON(wVo).toString());
        String wwc = HttpRequest.sendPost("https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + jsonObject.getString("access_token"), JSONObject.toJSON(wVo).toString());
        System.out.println(wwc);
//            Thread.sleep(10000);
    }
    @RequestMapping("sendWeChat")
    @Scheduled(cron="0 0 8 * * ?")
    public void sendWeChat() throws Exception{
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        logger.info(simpleDateFormat.format(date)+"定时发送短信");
        System.out.println(simpleDateFormat.format(date)+"定时发送短信");
        String dayofweek=DateUtil.dayForWeekByCh(simpleDateFormat.format(date));
        Map<String, Integer> map=DateUtil.getWeekAndYear(simpleDateFormat.format(new Date()));
        String year=map.get("year").toString();
        String week=map.get("week").toString();
        String hql1 = "from WVo where dayOfWeek=? and year=? and week=? and ext2=1 order by startTime asc";
        List<com.gx.soft.weeklywork.persistence.domain.WVo> list1=wvoManager.find(hql1,dayofweek,year,week);
        List<GxSysUser> users=sysUserManager.findBy("userLevel","100");
        for(com.gx.soft.weeklywork.persistence.domain.WVo meetingArrangement:list1){
            String callUsers=meetingArrangement.getCallUsersName()+","+meetingArrangement.getCallLeaderName();
            for(GxSysUser gxSysUser:users){
                if(gxSysUser.getOpenid()==null||gxSysUser.equals("")){
                    continue;
                }
                if(callUsers!=null&&callUsers.contains(gxSysUser.getUserName())){
                    System.out.println(meetingArrangement.getTitle()+meetingArrangement.getMeetingRoomName()+simpleDateFormat.format(meetingArrangement.getStartTime())+gxSysUser.getOpenid());
                    logger.info(meetingArrangement.getTitle()+meetingArrangement.getMeetingRoomName()+simpleDateFormat.format(meetingArrangement.getStartTime())+gxSysUser.getOpenid());
                    sendMsg1(meetingArrangement.getTitle(),meetingArrangement.getMeetingRoomName(),simpleDateFormat.format(meetingArrangement.getStartTime()),gxSysUser.getOpenid());
                    sendMsg1(meetingArrangement.getTitle(),meetingArrangement.getMeetingRoomName(),simpleDateFormat.format(meetingArrangement.getStartTime()),"oqCt55MNlEsGzpaysjBhQmUATM7w");
                }
            }
        }
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

    /**
     * 定时早上8点推送12点之前会议的会议
     * @throws Exception
     */
    @RequestMapping("sendMessageMorning")
    @Scheduled(cron="0 0 8 * * ?")
    public void sendMessageMorning() throws Exception {
        if(InetAddress.getLocalHost().getHostAddress().equals("192.168.50.5")) {
            sendMessage("0");
        }
//        SendSMS sendSMS=new SendSMS();
//        sendSMS.SendSMS("贵部门上午9:30在4A办公室有关于召开中山门大街和万家楼互通管综规划方案对接会的通知的会议","13770715730");
//        sendSMS.SendSMS("测试","13770715730");

    }

    /**
     * 定时中午12点推送12点之后的会议
     * @throws Exception
     */
    @RequestMapping("sendMessageAfternoon")
    @Scheduled(cron="0 0 12 * * ?")
    public void sendMessageAfternoon() throws Exception {
        if(InetAddress.getLocalHost().getHostAddress().equals("192.168.50.5")){
            sendMessage("1");
        }
//        SendSMS sendSMS=new SendSMS();
//        sendSMS.SendSMS("贵部门上午9:30在4A办公室有关于召开中山门大街和万家楼互通管综规划方案对接会的通知的会议","13770715730");
//        sendSMS.SendSMS("测试","13770715730");

    }

    /**
     * type = 0说明是上午
     * type = 1说明是下午
     * @param type
     * @throws Exception
     */
    public void sendMessage(String type) throws Exception{
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String time=simpleDateFormat.format(new Date());
        String endTime = "";
        String startTime = "";
        String timeStutus="";
        if(type.equals("0")){
            startTime = time+" 00:00:00";
            endTime = time+" 12:00:00";
            timeStutus="上午";
        }else {
            startTime = time+" 14:00:00";
            endTime = time+" 23:59:59";
            timeStutus="下午";
        }
        List<MeetingArrangement> list=meetingArrangementManager.find("from MeetingArrangement where startTime<STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s') and startTime>STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s') order by startTime asc",endTime,startTime);
        List<VUser> users=sysUserManager.find("from VUser where userMobileNum is not null");
        String regex="^[1][358][0-9]{9}$";
        for(int i=0;i<users.size();i++){
            VUser vUser=users.get(i);
            for(String num:vUser.getUserMobileNum().split(",")){
                if(!num.matches(regex)){
                    users.remove(i);
                }
            }
        }
        if(list!=null){
            for(MeetingArrangement meetingArrangement:list){
                String hour = new SimpleDateFormat("HH").format(meetingArrangement.getStartTime()); //09:00
                int hh = Integer.parseInt(hour);
                if(hh>12){
                    hh=hh-12;
                }
                String startString = new SimpleDateFormat("HH:mm").format(meetingArrangement.getStartTime()); //开始时间（时、分）
                String resultTime=String.valueOf(hh)+startString.substring(startString.indexOf(":"));
                if(meetingArrangement.getCallUsersName()!=null&&!meetingArrangement.getExt2().equals("2")){
                    String callUsers=meetingArrangement.getCallUsersName()+","+meetingArrangement.getCallLeaderName();
                    for(VUser vUser:users){
                        if(callUsers!=null&&(callUsers.contains(vUser.getUserName())||(vUser.getOrgShowName()!=null&&callUsers.contains(vUser.getOrgShowName())))){
                            String[] mobileList=vUser.getUserMobileNum().split(",");
                            if(vUser.getUserLevel().equals("100")){
                                for(String mobileNum:mobileList){
                                    sendMessage.send(mobileNum,new String[]{timeStutus+resultTime,meetingArrangement.getMeetingRoomName(),meetingArrangement.getTitle()},"547879");
                                }
                            }else {
                                //如果是会议通知 人的级别不是90(部门长) continue
                                if(meetingArrangement.getExt2().equals("3")){
                                    if(!vUser.getUserLevel().equals("90")){
                                        continue;
                                    }
                                }
                                //办公室contain在总工程师办公室 ，二次校验
                                if(vUser.getOrgShowName().equals("办公室")){
                                    if(meetingArrangement.getCallUsersName().contains("总工程师办公室")){
                                        if((meetingArrangement.getCallUsersName()+"1").split("办公室").length<3){
                                            continue;
                                        }
                                    }else {
                                        if((meetingArrangement.getCallUsersName()+"1").split("办公室").length<2){
                                            continue;
                                        }
                                    }
                                }
                                //判断是一周安排/会议通知
                                if(meetingArrangement.getExt2().equals("3")){
                                    //会议通知
                                    for(String mobileNum:mobileList){
                                        sendMessage.send(mobileNum,new String[]{meetingArrangement.getTitle()},"550131");
                                    }
                                }else {
                                    //一周工作安排通知
                                    for(String mobileNum:mobileList){
                                        sendMessage.send(mobileNum,new String[]{timeStutus+resultTime,meetingArrangement.getMeetingRoomName(),meetingArrangement.getTitle()},"547883");
                                    }
                                }
                            }
                        }
                    }
                }else {
                    GxSysUser gxSysUser=sysUserManager.findUniqueBy("userName",meetingArrangement.getAuditorName());
                    //领导审核通知 判读是否有审核人 参会人员是否为空(审核时需选择参会人员)
                    if(gxSysUser!=null&&(meetingArrangement.getCallUsersName()==null||meetingArrangement.getCallUsersName().replaceAll(" ","").equals(""))){
                        for(String mobileNum:gxSysUser.getUserMobileNum().split(",")){
                            sendMessage.send(mobileNum,new String[]{meetingArrangement.getTitle()},"547884");
                        }
                    }
                }
            }
        }

    }

}