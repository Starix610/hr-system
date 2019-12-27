package com.hrsystem.pojo;

import java.math.BigDecimal;

public class SalaryPaymentDetail {

    private String salaryPaymentDetailId;

    private String recordId;

    private String staffName;

    private BigDecimal baseSalary;

    private BigDecimal travelAllowance;

    private BigDecimal lunchAllowance;

    private BigDecimal communicationAllowance;

    private BigDecimal endowmentInsurance;

    private BigDecimal medicalInsurance;

    private BigDecimal unemploymentInsurance;

    private BigDecimal housingFund;

    private BigDecimal bonus;

    private BigDecimal deductionBonus;

    private String salaryPaymentId;

    public String getSalaryPaymentDetailId() {
        return salaryPaymentDetailId;
    }

    public void setSalaryPaymentDetailId(String salaryPaymentDetailId) {
        this.salaryPaymentDetailId = salaryPaymentDetailId;
    }

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

    public BigDecimal getBonus() {
        return bonus;
    }

    public void setBonus(BigDecimal bonus) {
        this.bonus = bonus;
    }

    public BigDecimal getDeductionBonus() {
        return deductionBonus;
    }

    public void setDeductionBonus(BigDecimal deductionBonus) {
        this.deductionBonus = deductionBonus;
    }

    public String getSalaryPaymentId() {
        return salaryPaymentId;
    }

    public void setSalaryPaymentId(String salaryPaymentId) {
        this.salaryPaymentId = salaryPaymentId;
    }
}