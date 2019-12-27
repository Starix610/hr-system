package com.hrsystem.pojo;


/**
 * 员工档案的查询条件的POJO类
 */

public class RecordQueryCondition {

    private Integer organization1Id;

    private Integer organization2Id;

    private Integer organization3Id;

    private Integer positionId;

    //建档时间start
    private String startTime;

    //建档时间end
    private String endTime;

    //档案状态
    private Integer status;

    public RecordQueryCondition() {

    }

    public RecordQueryCondition(Integer organization1Id, Integer organization2Id, Integer organization3Id, Integer positionId, String startTime, String endTime, Integer status) {
        this.organization1Id = organization1Id;
        this.organization2Id = organization2Id;
        this.organization3Id = organization3Id;
        this.positionId = positionId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    public Integer getOrganization1Id() {
        return organization1Id;
    }

    public void setOrganization1Id(Integer organization1Id) {
        this.organization1Id = organization1Id;
    }

    public Integer getOrganization2Id() {
        return organization2Id;
    }

    public void setOrganization2Id(Integer organization2Id) {
        this.organization2Id = organization2Id;
    }

    public Integer getOrganization3Id() {
        return organization3Id;
    }

    public void setOrganization3Id(Integer organization3Id) {
        this.organization3Id = organization3Id;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime.equals("")?null:startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime.equals("")?null:endTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
