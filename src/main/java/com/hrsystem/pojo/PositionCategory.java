package com.hrsystem.pojo;

public class PositionCategory {
    private Integer positionCategoryId;

    private String positionCategoryName;

    public Integer getPositionCategoryId() {
        return positionCategoryId;
    }

    public void setPositionCategoryId(Integer positionCategoryId) {
        this.positionCategoryId = positionCategoryId;
    }

    public String getPositionCategoryName() {
        return positionCategoryName;
    }

    public void setPositionCategoryName(String positionCategoryName) {
        this.positionCategoryName = positionCategoryName == null ? null : positionCategoryName.trim();
    }
}