package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "gx_sys_user", schema = "meeting", catalog = "")
public class GxSysUser {
    private String rowId;
    private String userName;
    private String userShowName;
    private String userEnName;
    private String userId;
    private Timestamp createTime;
    private String createUserId;
    private Timestamp modifyTime;
    private String modifyUserId;
    private String dataStatus;
    private Integer dataOrder;
    private String userMobileNum;
    private String userSex;
    private String userType;
    private String userPhoto;
    private String userMail;
    private String userLevel;
    private Integer powerLevel;
    private String userCardId;
    private String sysColorId;
    private String clientId;
    private String country;
    private String city;
    private String language;
    private String nickName;
    private String province;
    private String openid;
    private String avatarUrl;
    private Integer age;

    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "row_id")
    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
    }

    @Basic
    @Column(name = "user_name")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "user_show_name")
    public String getUserShowName() {
        return userShowName;
    }

    public void setUserShowName(String userShowName) {
        this.userShowName = userShowName;
    }

    @Basic
    @Column(name = "user_en_name")
    public String getUserEnName() {
        return userEnName;
    }

    public void setUserEnName(String userEnName) {
        this.userEnName = userEnName;
    }

    @Basic
    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "create_time")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "create_user_id")
    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Basic
    @Column(name = "modify_time")
    public Timestamp getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Timestamp modifyTime) {
        this.modifyTime = modifyTime;
    }

    @Basic
    @Column(name = "modify_user_id")
    public String getModifyUserId() {
        return modifyUserId;
    }

    public void setModifyUserId(String modifyUserId) {
        this.modifyUserId = modifyUserId;
    }

    @Basic
    @Column(name = "data_status")
    public String getDataStatus() {
        return dataStatus;
    }

    public void setDataStatus(String dataStatus) {
        this.dataStatus = dataStatus;
    }

    @Basic
    @Column(name = "data_order")
    public Integer getDataOrder() {
        return dataOrder;
    }

    public void setDataOrder(Integer dataOrder) {
        this.dataOrder = dataOrder;
    }

    @Basic
    @Column(name = "user_mobile_num")
    public String getUserMobileNum() {
        return userMobileNum;
    }

    public void setUserMobileNum(String userMobileNum) {
        this.userMobileNum = userMobileNum;
    }

    @Basic
    @Column(name = "user_sex")
    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    @Basic
    @Column(name = "user_type")
    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Basic
    @Column(name = "user_photo")
    public String getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(String userPhoto) {
        this.userPhoto = userPhoto;
    }

    @Basic
    @Column(name = "user_mail")
    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    @Basic
    @Column(name = "user_level")
    public String getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(String userLevel) {
        this.userLevel = userLevel;
    }

    @Basic
    @Column(name = "power_level")
    public Integer getPowerLevel() {
        return powerLevel;
    }

    public void setPowerLevel(Integer powerLevel) {
        this.powerLevel = powerLevel;
    }

    @Basic
    @Column(name = "user_card_id")
    public String getUserCardId() {
        return userCardId;
    }

    public void setUserCardId(String userCardId) {
        this.userCardId = userCardId;
    }

    @Basic
    @Column(name = "sys_color_id")
    public String getSysColorId() {
        return sysColorId;
    }

    public void setSysColorId(String sysColorId) {
        this.sysColorId = sysColorId;
    }

    @Basic
    @Column(name = "client_id")
    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    @Basic
    @Column(name = "country")
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Basic
    @Column(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "language")
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    @Basic
    @Column(name = "nickName")
    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    @Basic
    @Column(name = "province")
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Basic
    @Column(name = "openid")
    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    @Basic
    @Column(name = "avatarUrl")
    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    @Basic
    @Column(name = "age")
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GxSysUser sysUser = (GxSysUser) o;

        if (rowId != null ? !rowId.equals(sysUser.rowId) : sysUser.rowId != null) return false;
        if (userName != null ? !userName.equals(sysUser.userName) : sysUser.userName != null) return false;
        if (userShowName != null ? !userShowName.equals(sysUser.userShowName) : sysUser.userShowName != null)
            return false;
        if (userEnName != null ? !userEnName.equals(sysUser.userEnName) : sysUser.userEnName != null) return false;
        if (userId != null ? !userId.equals(sysUser.userId) : sysUser.userId != null) return false;
        if (createTime != null ? !createTime.equals(sysUser.createTime) : sysUser.createTime != null) return false;
        if (createUserId != null ? !createUserId.equals(sysUser.createUserId) : sysUser.createUserId != null)
            return false;
        if (modifyTime != null ? !modifyTime.equals(sysUser.modifyTime) : sysUser.modifyTime != null) return false;
        if (modifyUserId != null ? !modifyUserId.equals(sysUser.modifyUserId) : sysUser.modifyUserId != null)
            return false;
        if (dataStatus != null ? !dataStatus.equals(sysUser.dataStatus) : sysUser.dataStatus != null) return false;
        if (dataOrder != null ? !dataOrder.equals(sysUser.dataOrder) : sysUser.dataOrder != null) return false;
        if (userMobileNum != null ? !userMobileNum.equals(sysUser.userMobileNum) : sysUser.userMobileNum != null)
            return false;
        if (userSex != null ? !userSex.equals(sysUser.userSex) : sysUser.userSex != null) return false;
        if (userType != null ? !userType.equals(sysUser.userType) : sysUser.userType != null) return false;
        if (userPhoto != null ? !userPhoto.equals(sysUser.userPhoto) : sysUser.userPhoto != null) return false;
        if (userMail != null ? !userMail.equals(sysUser.userMail) : sysUser.userMail != null) return false;
        if (userLevel != null ? !userLevel.equals(sysUser.userLevel) : sysUser.userLevel != null) return false;
        if (powerLevel != null ? !powerLevel.equals(sysUser.powerLevel) : sysUser.powerLevel != null) return false;
        if (userCardId != null ? !userCardId.equals(sysUser.userCardId) : sysUser.userCardId != null) return false;
        if (sysColorId != null ? !sysColorId.equals(sysUser.sysColorId) : sysUser.sysColorId != null) return false;
        if (clientId != null ? !clientId.equals(sysUser.clientId) : sysUser.clientId != null) return false;
        if (country != null ? !country.equals(sysUser.country) : sysUser.country != null) return false;
        if (city != null ? !city.equals(sysUser.city) : sysUser.city != null) return false;
        if (language != null ? !language.equals(sysUser.language) : sysUser.language != null) return false;
        if (nickName != null ? !nickName.equals(sysUser.nickName) : sysUser.nickName != null) return false;
        if (province != null ? !province.equals(sysUser.province) : sysUser.province != null) return false;
        if (openid != null ? !openid.equals(sysUser.openid) : sysUser.openid != null) return false;
        if (avatarUrl != null ? !avatarUrl.equals(sysUser.avatarUrl) : sysUser.avatarUrl != null) return false;
        if (age != null ? !age.equals(sysUser.age) : sysUser.age != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rowId != null ? rowId.hashCode() : 0;
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (userShowName != null ? userShowName.hashCode() : 0);
        result = 31 * result + (userEnName != null ? userEnName.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (createUserId != null ? createUserId.hashCode() : 0);
        result = 31 * result + (modifyTime != null ? modifyTime.hashCode() : 0);
        result = 31 * result + (modifyUserId != null ? modifyUserId.hashCode() : 0);
        result = 31 * result + (dataStatus != null ? dataStatus.hashCode() : 0);
        result = 31 * result + (dataOrder != null ? dataOrder.hashCode() : 0);
        result = 31 * result + (userMobileNum != null ? userMobileNum.hashCode() : 0);
        result = 31 * result + (userSex != null ? userSex.hashCode() : 0);
        result = 31 * result + (userType != null ? userType.hashCode() : 0);
        result = 31 * result + (userPhoto != null ? userPhoto.hashCode() : 0);
        result = 31 * result + (userMail != null ? userMail.hashCode() : 0);
        result = 31 * result + (userLevel != null ? userLevel.hashCode() : 0);
        result = 31 * result + (powerLevel != null ? powerLevel.hashCode() : 0);
        result = 31 * result + (userCardId != null ? userCardId.hashCode() : 0);
        result = 31 * result + (sysColorId != null ? sysColorId.hashCode() : 0);
        result = 31 * result + (clientId != null ? clientId.hashCode() : 0);
        result = 31 * result + (country != null ? country.hashCode() : 0);
        result = 31 * result + (city != null ? city.hashCode() : 0);
        result = 31 * result + (language != null ? language.hashCode() : 0);
        result = 31 * result + (nickName != null ? nickName.hashCode() : 0);
        result = 31 * result + (province != null ? province.hashCode() : 0);
        result = 31 * result + (openid != null ? openid.hashCode() : 0);
        result = 31 * result + (avatarUrl != null ? avatarUrl.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        return result;
    }
}
