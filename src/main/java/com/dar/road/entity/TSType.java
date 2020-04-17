package com.dar.road.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "T_S_TYPE")
public class TSType {
    @Id
    @Column(name = "TYPE_ID")
    private String typeId;

    @Column(name = "TYPE_CODE")
    private String typeCode;

    @Column(name = "TYPE_NAME")
    private String typeName;

    @Column(name = "TYPE_DESC")
    private String typeDesc;

    @Column(name = "TYPE_GROUP_ID")
    private String typeGroupId;

    @Column(name = "CREATE_DATE")
    private Date createDate;

    @Column(name = "CREATE_NAME")
    private String createName;

    @Column(name = "IS_ENABLED")
    private String isEnabled;

    @Column(name = "IS_VALID")
    private Short isValid;

    /**
     * @return TYPE_ID
     */
    public String getTypeId() {
        return typeId;
    }

    /**
     * @param typeId
     */
    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

    /**
     * @return TYPE_CODE
     */
    public String getTypeCode() {
        return typeCode;
    }

    /**
     * @param typeCode
     */
    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode == null ? null : typeCode.trim();
    }

    /**
     * @return TYPE_NAME
     */
    public String getTypeName() {
        return typeName;
    }

    /**
     * @param typeName
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    /**
     * @return TYPE_DESC
     */
    public String getTypeDesc() {
        return typeDesc;
    }

    /**
     * @param typeDesc
     */
    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc == null ? null : typeDesc.trim();
    }

    /**
     * @return TYPE_GROUP_ID
     */
    public String getTypeGroupId() {
        return typeGroupId;
    }

    /**
     * @param typeGroupId
     */
    public void setTypeGroupId(String typeGroupId) {
        this.typeGroupId = typeGroupId == null ? null : typeGroupId.trim();
    }

    /**
     * @return CREATE_DATE
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return CREATE_NAME
     */
    public String getCreateName() {
        return createName;
    }

    /**
     * @param createName
     */
    public void setCreateName(String createName) {
        this.createName = createName == null ? null : createName.trim();
    }

    /**
     * @return IS_ENABLED
     */
    public String getIsEnabled() {
        return isEnabled;
    }

    /**
     * @param isEnabled
     */
    public void setIsEnabled(String isEnabled) {
        this.isEnabled = isEnabled == null ? null : isEnabled.trim();
    }

    /**
     * @return IS_VALID
     */
    public Short getIsValid() {
        return isValid;
    }

    /**
     * @param isValid
     */
    public void setIsValid(Short isValid) {
        this.isValid = isValid;
    }
}