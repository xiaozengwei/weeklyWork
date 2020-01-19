package com.gx.soft.sys.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "v_sys_dic", schema = "meeting", catalog = "")
public class VSysDic {
    private String vSysDicKey;
    private String indexDicName;
    private String indexDicId;
    private String indexDicDesc;
    private String recordDicName;
    private String recordDicId;
    private String dicShowVal;
    private String dicValue;
    private String dicType;
    private Long orderNum;
    private String maxStatus;
    private String maxId;

    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "v_sys_dic_key")
    public String getvSysDicKey() {
        return vSysDicKey;
    }

    public void setvSysDicKey(String vSysDicKey) {
        this.vSysDicKey = vSysDicKey;
    }

    @Basic
    @Column(name = "index_dic_name")
    public String getIndexDicName() {
        return indexDicName;
    }

    public void setIndexDicName(String indexDicName) {
        this.indexDicName = indexDicName;
    }

    @Basic
    @Column(name = "index_dic_id")
    public String getIndexDicId() {
        return indexDicId;
    }

    public void setIndexDicId(String indexDicId) {
        this.indexDicId = indexDicId;
    }

    @Basic
    @Column(name = "index_dic_desc")
    public String getIndexDicDesc() {
        return indexDicDesc;
    }

    public void setIndexDicDesc(String indexDicDesc) {
        this.indexDicDesc = indexDicDesc;
    }

    @Basic
    @Column(name = "record_dic_name")
    public String getRecordDicName() {
        return recordDicName;
    }

    public void setRecordDicName(String recordDicName) {
        this.recordDicName = recordDicName;
    }

    @Basic
    @Column(name = "record_dic_id")
    public String getRecordDicId() {
        return recordDicId;
    }

    public void setRecordDicId(String recordDicId) {
        this.recordDicId = recordDicId;
    }

    @Basic
    @Column(name = "DIC_SHOW_VAL")
    public String getDicShowVal() {
        return dicShowVal;
    }

    public void setDicShowVal(String dicShowVal) {
        this.dicShowVal = dicShowVal;
    }

    @Basic
    @Column(name = "DIC_VALUE")
    public String getDicValue() {
        return dicValue;
    }

    public void setDicValue(String dicValue) {
        this.dicValue = dicValue;
    }

    @Basic
    @Column(name = "DIC_TYPE")
    public String getDicType() {
        return dicType;
    }

    public void setDicType(String dicType) {
        this.dicType = dicType;
    }

    @Basic
    @Column(name = "ORDER_NUM")
    public Long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

    @Basic
    @Column(name = "max_status")
    public String getMaxStatus() {
        return maxStatus;
    }

    public void setMaxStatus(String maxStatus) {
        this.maxStatus = maxStatus;
    }

    @Basic
    @Column(name = "max_id")
    public String getMaxId() {
        return maxId;
    }

    public void setMaxId(String maxId) {
        this.maxId = maxId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        VSysDic vSysDic = (VSysDic) o;
        return Objects.equals(vSysDicKey, vSysDic.vSysDicKey) &&
                Objects.equals(indexDicName, vSysDic.indexDicName) &&
                Objects.equals(indexDicId, vSysDic.indexDicId) &&
                Objects.equals(indexDicDesc, vSysDic.indexDicDesc) &&
                Objects.equals(recordDicName, vSysDic.recordDicName) &&
                Objects.equals(recordDicId, vSysDic.recordDicId) &&
                Objects.equals(dicShowVal, vSysDic.dicShowVal) &&
                Objects.equals(dicValue, vSysDic.dicValue) &&
                Objects.equals(dicType, vSysDic.dicType) &&
                Objects.equals(orderNum, vSysDic.orderNum) &&
                Objects.equals(maxStatus, vSysDic.maxStatus) &&
                Objects.equals(maxId, vSysDic.maxId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(vSysDicKey, indexDicName, indexDicId, indexDicDesc, recordDicName, recordDicId, dicShowVal, dicValue, dicType, orderNum, maxStatus, maxId);
    }
}
