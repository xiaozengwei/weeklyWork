package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "gx_sys_function", schema = "meeting", catalog = "")
public class GxSysFunction {
    private long rowId;
    private String functionName;
    private String functionShowName;
    private String functionEnName;
    private String functionIntro;
    private Timestamp createTime;
    private String createUserId;
    private Timestamp modifyTime;
    private String modifyUserId;
    private String dataStatus;
    private Long dataOrder;
    private String parentFunctionId;
    private String parentFunctionName;
    private String functionType;
    private String isMainPage;
    private String functionIcon;
    private String mainPageIcon;
    private String mainFunctionName;
    private Integer mainOrder;

    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "row_id")
    public long getRowId() {
        return rowId;
    }

    public void setRowId(long rowId) {
        this.rowId = rowId;
    }

    @Basic
    @Column(name = "function_name")
    public String getFunctionName() {
        return functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName;
    }

    @Basic
    @Column(name = "function_show_name")
    public String getFunctionShowName() {
        return functionShowName;
    }

    public void setFunctionShowName(String functionShowName) {
        this.functionShowName = functionShowName;
    }

    @Basic
    @Column(name = "function_en_name")
    public String getFunctionEnName() {
        return functionEnName;
    }

    public void setFunctionEnName(String functionEnName) {
        this.functionEnName = functionEnName;
    }

    @Basic
    @Column(name = "function_intro")
    public String getFunctionIntro() {
        return functionIntro;
    }

    public void setFunctionIntro(String functionIntro) {
        this.functionIntro = functionIntro;
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
    @Column(name = "parent_function_id")
    public String getParentFunctionId() {
        return parentFunctionId;
    }

    public void setParentFunctionId(String parentFunctionId) {
        this.parentFunctionId = parentFunctionId;
    }

    @Basic
    @Column(name = "parent_function_name")
    public String getParentFunctionName() {
        return parentFunctionName;
    }

    public void setParentFunctionName(String parentFunctionName) {
        this.parentFunctionName = parentFunctionName;
    }

    @Basic
    @Column(name = "function_type")
    public String getFunctionType() {
        return functionType;
    }

    public void setFunctionType(String functionType) {
        this.functionType = functionType;
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
    @Column(name = "function_icon")
    public String getFunctionIcon() {
        return functionIcon;
    }

    public void setFunctionIcon(String functionIcon) {
        this.functionIcon = functionIcon;
    }

    @Basic
    @Column(name = "main_page_icon")
    public String getMainPageIcon() {
        return mainPageIcon;
    }

    public void setMainPageIcon(String mainPageIcon) {
        this.mainPageIcon = mainPageIcon;
    }

    @Basic
    @Column(name = "main_function_name")
    public String getMainFunctionName() {
        return mainFunctionName;
    }

    public void setMainFunctionName(String mainFunctionName) {
        this.mainFunctionName = mainFunctionName;
    }

    @Basic
    @Column(name = "main_order")
    public Integer getMainOrder() {
        return mainOrder;
    }

    public void setMainOrder(Integer mainOrder) {
        this.mainOrder = mainOrder;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GxSysFunction that = (GxSysFunction) o;
        return rowId == that.rowId &&
                Objects.equals(functionName, that.functionName) &&
                Objects.equals(functionShowName, that.functionShowName) &&
                Objects.equals(functionEnName, that.functionEnName) &&
                Objects.equals(functionIntro, that.functionIntro) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(createUserId, that.createUserId) &&
                Objects.equals(modifyTime, that.modifyTime) &&
                Objects.equals(modifyUserId, that.modifyUserId) &&
                Objects.equals(dataStatus, that.dataStatus) &&
                Objects.equals(dataOrder, that.dataOrder) &&
                Objects.equals(parentFunctionId, that.parentFunctionId) &&
                Objects.equals(parentFunctionName, that.parentFunctionName) &&
                Objects.equals(functionType, that.functionType) &&
                Objects.equals(isMainPage, that.isMainPage) &&
                Objects.equals(functionIcon, that.functionIcon) &&
                Objects.equals(mainPageIcon, that.mainPageIcon) &&
                Objects.equals(mainFunctionName, that.mainFunctionName) &&
                Objects.equals(mainOrder, that.mainOrder);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, functionName, functionShowName, functionEnName, functionIntro, createTime, createUserId, modifyTime, modifyUserId, dataStatus, dataOrder, parentFunctionId, parentFunctionName, functionType, isMainPage, functionIcon, mainPageIcon, mainFunctionName, mainOrder);
    }
}
