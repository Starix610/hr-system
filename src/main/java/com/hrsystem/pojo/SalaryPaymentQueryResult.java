package com.hrsystem.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

/**
 * 封装薪酬发放页面所需展示数据的Pojo
 */
public class SalaryPaymentQueryResult {

    private String salaryPaymentId;

    private Map<Integer,String> organizations; //封装三级机构的id和名字

    private Integer numberOfStaff;

    private BigDecimal totalBaseSalary;

    private BigDecimal realPay;

    private String registrant;

    private String recheckName;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date registerTime;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date recheckTime;



    public String getSalaryPaymentId() {
        return salaryPaymentId;
    }

    public void setSalaryPaymentId(String salaryPaymentId) {
        this.salaryPaymentId = salaryPaymentId;
    }

    public Map<Integer, String> getOrganizations() {
        return organizations;
    }

    public void setOrganizations(Map<Integer, String> organizations) {
        this.organizations = organizations;
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

    public BigDecimal getRealPay() {
        return realPay;
    }

    public void setRealPay(BigDecimal realPay) {
        this.realPay = realPay;
    }

    public String getRegistrant() {
        return registrant;
    }

    public void setRegistrant(String registrant) {
        this.registrant = registrant;
    }

    public String getRecheckName() {
        return recheckName;
    }

    public void setRecheckName(String recheckName) {
        this.recheckName = recheckName;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getRecheckTime() {
        return recheckTime;
    }

    public void setRecheckTime(Date recheckTime) {
        this.recheckTime = recheckTime;
    }
}
