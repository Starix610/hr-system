package com.hrsystem.pojo;

public class ProfessionalTitle {

    private Integer professionalTitleId;

    private String professionalTitleName;

    public Integer getProfessionalTitleId() {
        return professionalTitleId;
    }

    public void setProfessionalTitleId(Integer professionalTitleId) {
        this.professionalTitleId = professionalTitleId;
    }

    public String getProfessionalTitleName() {
        return professionalTitleName;
    }

    public void setProfessionalTitleName(String professionalTitleName) {
        this.professionalTitleName = professionalTitleName == null ? null : professionalTitleName.trim();
    }
}