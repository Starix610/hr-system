package com.hrsystem.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class StaffRecord {
    private String recordId;

    private Integer organization1Id;

    private Integer organization2Id;

    private Integer organization3Id;

    private Integer positionCategoryId;

    private Integer positionId;

    private String professionalTitle;

    private String staffName;

    private String sex;

    private String email;

    private String phone;

    private String qq;

    private String mobilephone;

    private String address;

    private String zip;

    private Integer nationalityId;

    private String birthplace;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;

    private Integer nationId;

    private String faith;

    private String politicsStatus;

    private String idCard;

    private String socialSecurityId;

    private Integer age;

    private String education;

    private Integer majorId;

    private String salaryStandardId;

    private String bank;

    private String creditCard;

    private String speciality;

    private String hobby;

    private String registrant;

    private String recheckName;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date registerTime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date recheckTime;

    private String photoUrl;

    private Integer status;

    private String updateName;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private String personalResume;

    private String familyRelationshipInformation;

    private String remark;

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId;
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

    public Integer getPositionCategoryId() {
        return positionCategoryId;
    }

    public void setPositionCategoryId(Integer positionCategoryId) {
        this.positionCategoryId = positionCategoryId;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public String getProfessionalTitle() {
        return professionalTitle;
    }

    public void setProfessionalTitle(String professionalTitle) {
        this.professionalTitle = professionalTitle;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public Integer getNationalityId() {
        return nationalityId;
    }

    public void setNationalityId(Integer nationalityId) {
        this.nationalityId = nationalityId;
    }

    public String getBirthplace() {
        return birthplace;
    }

    public void setBirthplace(String birthplace) {
        this.birthplace = birthplace;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getNationId() {
        return nationId;
    }

    public void setNationId(Integer nationId) {
        this.nationId = nationId;
    }

    public String getFaith() {
        return faith;
    }

    public void setFaith(String faith) {
        this.faith = faith;
    }

    public String getPoliticsStatus() {
        return politicsStatus;
    }

    public void setPoliticsStatus(String politicsStatus) {
        this.politicsStatus = politicsStatus;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getSocialSecurityId() {
        return socialSecurityId;
    }

    public void setSocialSecurityId(String socialSecurityId) {
        this.socialSecurityId = socialSecurityId;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public Integer getMajorId() {
        return majorId;
    }

    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    public String getSalaryStandardId() {
        return salaryStandardId;
    }

    public void setSalaryStandardId(String salaryStandardId) {
        this.salaryStandardId = salaryStandardId;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(String creditCard) {
        this.creditCard = creditCard;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
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

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public String getPersonalResume() {
        return personalResume;
    }

    public void setPersonalResume(String personalResume) {
        this.personalResume = personalResume;
    }

    public String getFamilyRelationshipInformation() {
        return familyRelationshipInformation;
    }

    public void setFamilyRelationshipInformation(String familyRelationshipInformation) {
        this.familyRelationshipInformation = familyRelationshipInformation;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}