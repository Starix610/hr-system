package com.hrsystem.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class SalaryPayment {
    private String salaryPaymentId;

    private Integer organization1Id;

    private Integer organization2Id;

    private Integer organization3Id;

    private Integer numberOfStaff;

    private BigDecimal totalBaseSalary;

    private Integer status;

    private String registrant;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date registerTime;

    private String recheckName;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date recheckTime;

    private BigDecimal realPay;

    public String getSalaryPaymentId() {
        return salaryPaymentId;
    }

    public void setSalaryPaymentId(String salaryPaymentId) {
        this.salaryPaymentId = salaryPaymentId;
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

    public Integer getNumberOfStaff() {
        return numberOfStaff;
    }

    public void setNumberOfStaff(Integer numberOfStaff) {
        this.numberOfStaff = numberOfStaff;
    }

    public BigDecimal getTotalBaseSalary() {
        return totalBaseSalary;
    }

    public void setTotalBaseSalary(BigDecimal totalBaseSalary) {
        this.totalBaseSalary = totalBaseSalary;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public BigDecimal getRealPay() {
        return realPay;
    }

    public void setRealPay(BigDecimal realPay) {
        this.realPay = realPay;
    }
}