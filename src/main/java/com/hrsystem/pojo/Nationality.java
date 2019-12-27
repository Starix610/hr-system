package com.hrsystem.pojo;

public class Nationality {
    private Integer nationalityId;

    private String nationalityName;

    public Integer getNationalityId() {
        return nationalityId;
    }

    public void setNationalityId(Integer nationalityId) {
        this.nationalityId = nationalityId;
    }

    public String getNationalityName() {
        return nationalityName;
    }

    public void setNationalityName(String nationalityName) {
        this.nationalityName = nationalityName == null ? null : nationalityName.trim();
    }
}