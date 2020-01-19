package com.gx.soft.weeklywork.persistence.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "file_record", schema = "meeting", catalog = "")
public class FileRecord {
    private String rowId;
    private String arrangementId;
    private String fileName;
    private String fileType;
    private String fileIdentifyName;
    private String filePath;
    private String uploadUserId;
    private String uploadUserName;
    private Timestamp uploadTime;
    private String dataStatus;
    private String dataOrder;
    private String dataDelete;

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
    @Column(name = "arrangement_id")
    public String getArrangementId() {
        return arrangementId;
    }

    public void setArrangementId(String arrangementId) {
        this.arrangementId = arrangementId;
    }

    @Basic
    @Column(name = "file_name")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Basic
    @Column(name = "file_type")
    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    @Basic
    @Column(name = "file_identify_name")
    public String getFileIdentifyName() {
        return fileIdentifyName;
    }

    public void setFileIdentifyName(String fileIdentifyName) {
        this.fileIdentifyName = fileIdentifyName;
    }

    @Basic
    @Column(name = "file_path")
    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    @Basic
    @Column(name = "upload_user_id")
    public String getUploadUserId() {
        return uploadUserId;
    }

    public void setUploadUserId(String uploadUserId) {
        this.uploadUserId = uploadUserId;
    }

    @Basic
    @Column(name = "upload_user_name")
    public String getUploadUserName() {
        return uploadUserName;
    }

    public void setUploadUserName(String uploadUserName) {
        this.uploadUserName = uploadUserName;
    }

    @Basic
    @Column(name = "upload_time")
    public Timestamp getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Timestamp uploadTime) {
        this.uploadTime = uploadTime;
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
    public String getDataOrder() {
        return dataOrder;
    }

    public void setDataOrder(String dataOrder) {
        this.dataOrder = dataOrder;
    }

    @Basic
    @Column(name = "data_delete")
    public String getDataDelete() {
        return dataDelete;
    }

    public void setDataDelete(String dataDelete) {
        this.dataDelete = dataDelete;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FileRecord that = (FileRecord) o;
        return Objects.equals(rowId, that.rowId) &&
                Objects.equals(arrangementId, that.arrangementId) &&
                Objects.equals(fileName, that.fileName) &&
                Objects.equals(fileType, that.fileType) &&
                Objects.equals(fileIdentifyName, that.fileIdentifyName) &&
                Objects.equals(filePath, that.filePath) &&
                Objects.equals(uploadUserId, that.uploadUserId) &&
                Objects.equals(uploadUserName, that.uploadUserName) &&
                Objects.equals(uploadTime, that.uploadTime) &&
                Objects.equals(dataStatus, that.dataStatus) &&
                Objects.equals(dataOrder, that.dataOrder) &&
                Objects.equals(dataDelete, that.dataDelete);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId, arrangementId, fileName, fileType, fileIdentifyName, filePath, uploadUserId, uploadUserName, uploadTime, dataStatus, dataOrder, dataDelete);
    }
}
