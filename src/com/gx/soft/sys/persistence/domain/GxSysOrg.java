package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "gx_sys_org", schema = "meeting", catalog = "")
public class GxSysOrg {
    private String rowId;
    private String orgName;
    private String orgShowName;
    private String orgEnName;
    private String orgIntro;
    private Timestamp createTime;
    private String createUserId;
    private Timestamp modifyTime;
    private String modifyUserId;
    private String dataStatus;
    private Long dataOrder;
    private String parentOrgId;
    private String parentOrgName;
    private String orgType;
    private String isMainPage;
    private String orgBdId;
    private String orgBdName;
    private String orgComId;
    private String isShow;

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
    @Column(name = "org_name")
    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    @Basic
    @Column(name = "org_show_name")
    public String getOrgShowName() {
        return orgShowName;
    }

    public void setOrgShowName(String orgShowName) {
        this.orgShowName = orgShowName;
    }

    @Basic
    @Column(name = "org_en_name")
    public String getOrgEnName() {
        return orgEnName;
    }

    public void setOrgEnName(String orgEnName) {
        this.orgEnName = orgEnName;
    }

    @Basic
    @Column(name = "org_intro")
    public String getOrgIntro() {
        return orgIntro;
    }

    public void setOrgIntro(String orgIntro) {
        this.orgIntro = orgIntro;
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
    public Long getDataOrder() {
        return dataOrder;
    }

    public void setDataOrder(Long dataOrder) {
        this.dataOrder = dataOrder;
    }

    @Basic
    @Column(name = "parent_org_id")
    public String getParentOrgId() {
        return parentOrgId;
    }

    public void setParentOrgId(String parentOrgId) {
        this.parentOrgId = parentOrgId;
    }

    @Basic
    @Column(name = "parent_org_name")
    public String getParentOrgName() {
        return parentOrgName;
    }

    public void setParentOrgName(String parentOrgName) {
        this.parentOrgName = parentOrgName;
    }

    @Basic
    @Column(name = "org_type")
    public String getOrgType() {
        return orgType;
    }

    public void setOrgType(String orgType) {
        this.orgType = orgType;
    }

    @Basic
    @Column(name = "is_main_page")
    public String getIsMainPage() {
        return isMainPage;
    }

    public void setIsMainPage(String isMainPage) {
        this.isMainPage = isMainPage;
    }

    @Basic
    @Column(name = "org_bd_id")
    public String getOrgBdId() {
        return orgBdId;
    }

    public void setOrgBdId(String orgBdId) {
        this.orgBdId = orgBdId;
    }

    @Basic
    @Column(name = "org_bd_name")
    public String getOrgBdName() {
        return orgBdName;
    }

    public void setOrgBdName(String orgBdName) {
        this.orgBdName = orgBdName;
    }

    @Basic
    @Column(name = "org_com_id")
    public String getOrgComId() {
        return orgComId;
    }

    public void setOrgComId(String orgComId) {
        this.orgComId = orgComId;
    }

    @Basic
    @Column(name = "is_show")
    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GxSysOrg gxSysOrg = (GxSysOrg) o;
        return Objects.equals(rowId, gxSysOrg.rowId) &&
                Objects.equals(orgName, gxSysOrg.orgName) &&
                Objects.equals(orgShowName, gxSysOrg.orgShowName) &&
                Objects.equals(orgEnName, gxSysOrg.orgEnName) &&
                Objects.equals(orgIntro, gxSysOrg.orgIntro) &&
                Objects.equals(createTime, gxSysOrg.createTime) &&
                Objects.equals(createUserId, gxSysOrg.createUserId) &&
                Objects.equals(modifyTime, gxSysOrg.modifyTime) &&
                Objects.equals(modifyUserId, gxSysOrg.modifyUserId) &&
                Objects.equals(dataStatus, gxSysOrg.dataStatus) &&
                Objects.equals(dataOrder, gxSysOrg.dataOrder) &&
                Objects.equals(parentOrgId, gxSysOrg.parentOrgId) &&
                Objects.equals(parentOrgName, gxSysOrg.parentOrgName) &&
                Objects.equals(orgType, gxSysOrg.orgType) &&
                Objects.equals(isMainPage, gxSysOrg.isMainPage) &&
                Objects.equals(orgBdId, gxSysOrg.orgBdId) &&
                Objects.equals(orgBdName, gxSysOrg.orgBdName) &&
                Objects.equals(orgComId, gxSysOrg.orgComId) &&
                Objects.equals(isShow, gxSysOrg.isShow);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, orgName, orgShowName, orgEnName, orgIntro, createTime, createUserId, modifyTime, modifyUserId, dataStatus, dataOrder, parentOrgId, parentOrgName, orgType, isMainPage, orgBdId, orgBdName, orgComId, isShow);
    }
}
