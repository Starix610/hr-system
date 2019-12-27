package com.hrsystem.pojo;


/**
 * 薪酬标准的查询条件pojo类
 */

public class SalaryStandardQueryCondition {

    private String salaryStandardId;

    //查询关键字
    private String keyword;

    private Integer status;

    //薪酬标准登记时间start
    private String startTime;

    //薪酬标准登记时间end
    private String endTime;

    public SalaryStandardQueryCondition() {

    }

    public SalaryStandardQueryCondition(String salaryStandardId, String keyword, Integer status, String startTime, String endTime) {
        this.salaryStandardId = salaryStandardId;
        this.keyword = keyword;
        this.status = status;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public String getSalaryStandardId() {
        return salaryStandardId;
    }

    public void setSalaryStandardId(String salaryStandardId) {
        this.salaryStandardId = salaryStandardId.equals("")?null:salaryStandardId;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword.equals("")?null:keyword;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
}
