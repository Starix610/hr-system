package com.hrsystem.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class SalaryStandard {

    private String salaryStandardId;

    private String salaryStandardName;

    private String creator;

    private String registrant;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")  //格式化返回给页面的时间
    private Date registerTime;

    private BigDecimal baseSalary;

    private BigDecimal travelAllowance;

    private BigDecimal lunchAllowance;

    private BigDecimal communicationAllowance;

    private BigDecimal endowmentInsurance;

    private BigDecimal medicalInsurance;

    private BigDecimal unemploymentInsurance;

    private BigDecimal housingFund;

    private BigDecimal totalSalary;

    private Integer status;

    private String recheckName;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date recheckTime;

    private String updateName;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private String auditOpinion;

    public String getSalaryStandardId() {
        return salaryStandardId;
    }

    public void setSalaryStandardId(String salaryStandardId) {
        this.salaryStandardId = salaryStandardId;
    }

    public String getSalaryStandardName() {
        return salaryStandardName;
    }

    public void setSalaryStandardName(String salaryStandardName) {
        this.salaryStandardName = salaryStandardName;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getRegistrant() {
        return registrant;
    }

    public void setRegistrant(String registrant) {
        this.registrant = registrant;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public BigDecimal getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(BigDecimal baseSalary) {
        this.baseSalary = baseSalary;
    }

    public BigDecimal getTravelAllowance() {
        return travelAllowance;
    }

    public void setTravelAllowance(BigDecimal travelAllowance) {
        this.travelAllowance = travelAllowance;
    }

    public BigDecimal getLunchAllowance() {
        return lunchAllowance;
    }

    public void setLunchAllowance(BigDecimal lunchAllowance) {
        this.lunchAllowance = lunchAllowance;
    }

    public BigDecimal getCommunicationAllowance() {
        return communicationAllowance;
    }

    public void setCommunicationAllowance(BigDecimal communicationAllowance) {
        this.communicationAllowance = communicationAllowance;
    }

    public BigDecimal getEndowmentInsurance() {
        return endowmentInsurance;
    }

    public void setEndowmentInsurance(BigDecimal endowmentInsurance) {
        this.endowmentInsurance = endowmentInsurance;
    }

    public BigDecimal getMedicalInsurance() {
        return medicalInsurance;
    }

    public void setMedicalInsurance(BigDecimal medicalInsurance) {
        this.medicalInsurance = medicalInsurance;
    }

    public BigDecimal getUnemploymentInsurance() {
        return unemploymentInsurance;
    }

    public void setUnemploymentInsurance(BigDecimal unemploymentInsurance) {
        this.unemploymentInsurance = unemploymentInsurance;
    }

    public BigDecimal getHousingFund() {
        return housingFund;
    }

    public void setHousingFund(BigDecimal housingFund) {
        this.housingFund = housingFund;
    }

    public BigDecimal getTotalSalary() {
        return totalSalary;
    }

    public void setTotalSalary(BigDecimal totalSalary) {
        this.totalSalary = totalSalary;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRecheckName() {
        return recheckName;
    }

    public void setRecheckName(String recheckName) {
        this.recheckName = recheckName;
    }

    public Date getRecheckTime() {
        return recheckTime;
    }

    public void setRecheckTime(Date recheckTime) {
        this.recheckTime = recheckTime;
    }

    public String getUpdateName() {
        return updateName;
    }

    public void setUpdateName(String updateName) {
        this.updateName = updateName;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }
}