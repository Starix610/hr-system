package com.hrsystem.pojo;


/**
 * 封装档案查询结果的Pojo类
 */
public class StaffRecordQueryResult {

    private String recordId;

    private String staffName;

    private String sex;

    private String organization1Name;

    private String organization2Name;

    private String organization3Name;

    private String positionName;


    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getOrganization1Name() {
        return organization1Name;
    }

    public void setOrganization1Name(String organization1Name) {
        this.organization1Name = organization1Name;
    }

    public String getOrganization2Name() {
        return organization2Name;
    }

    public void setOrganization2Name(String organization2Name) {
        this.organization2Name = organization2Name;
    }

    public String getOrganization3Name() {
        return organization3Name;
    }

    public void setOrganization3Name(String organization3Name) {
        this.organization3Name = organization3Name;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }
}
