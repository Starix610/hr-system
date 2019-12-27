package com.hrsystem.pojo;

public class SalaryPaymentQueryCondition {

    private String salaryPaymentId;

    //查询关键字
    private String keyword;

    private Integer status;

    //薪酬标准登记时间start
    private String startTime;

    //薪酬标准登记时间end
    private String endTime;

    public SalaryPaymentQueryCondition() {

    }

    public SalaryPaymentQueryCondition(String salaryPaymentId, String keyword, Integer status, String startTime, String endTime) {
        this.salaryPaymentId = salaryPaymentId;
        this.keyword = keyword;
        this.status = status;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public String getSalaryPaymentId() {
        return salaryPaymentId;
    }

    public void setSalaryPaymentId(String salaryPaymentId) {
        this.salaryPaymentId = salaryPaymentId.equals("")?null:salaryPaymentId;
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
