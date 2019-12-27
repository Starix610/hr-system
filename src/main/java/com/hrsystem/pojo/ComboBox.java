package com.hrsystem.pojo;

import java.util.List;

public class ComboBox {

    private List<Nationality> nationalityList;

    private List<Nation> nationList;

    private List<Major> majorList;

    private List<SalaryStandard> salaryStandardList;

    //默认给页面提供一级机构下拉框数据，选择一级机构的某一项后二级和三级出现联动效果(前端实现)
    private List<Organization> organizationList;

    //职位分类和职位同样也实现联动效果
    private List<PositionCategory> positionCategoryList;

    private List<ProfessionalTitle> professionalTitleList;

    public ComboBox(List<Nationality> nationalityList, List<Nation> nationList, List<Major> majorList, List<SalaryStandard> salaryStandardList, List<Organization> organizationList, List<PositionCategory> positionCategoryList, List<ProfessionalTitle> professionalTitleList) {
        this.nationalityList = nationalityList;
        this.nationList = nationList;
        this.majorList = majorList;
        this.salaryStandardList = salaryStandardList;
        this.organizationList = organizationList;
        this.positionCategoryList = positionCategoryList;
        this.professionalTitleList = professionalTitleList;
    }

    public List<Nationality> getNationalityList() {
        return nationalityList;
    }

    public void setNationalityList(List<Nationality> nationalityList) {
        this.nationalityList = nationalityList;
    }

    public List<Nation> getNationList() {
        return nationList;
    }

    public void setNationList(List<Nation> nationList) {
        this.nationList = nationList;
    }

    public List<Major> getMajorList() {
        return majorList;
    }

    public void setMajorList(List<Major> majorList) {
        this.majorList = majorList;
    }

    public List<SalaryStandard> getSalaryStandardList() {
        return salaryStandardList;
    }

    public void setSalaryStandardList(List<SalaryStandard> salaryStandardList) {
        this.salaryStandardList = salaryStandardList;
    }

    public List<Organization> getOrganizationList() {
        return organizationList;
    }

    public void setOrganizationList(List<Organization> organizationList) {
        this.organizationList = organizationList;
    }

    public List<PositionCategory> getPositionCategoryList() {
        return positionCategoryList;
    }

    public void setPositionCategoryList(List<PositionCategory> positionCategoryList) {
        this.positionCategoryList = positionCategoryList;
    }

    public List<ProfessionalTitle> getProfessionalTitleList() {
        return professionalTitleList;
    }

    public void setProfessionalTitleList(List<ProfessionalTitle> professionalTitleList) {
        this.professionalTitleList = professionalTitleList;
    }
}
