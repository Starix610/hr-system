package com.hrsystem.pojo;

public class Position {
    private Integer positionId;

    private String positionName;

    private Integer positionCategoryId;

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName == null ? null : positionName.trim();
    }

    public Integer getPositionCategoryId() {
        return positionCategoryId;
    }

    public void setPositionCategoryId(Integer positionCategoryId) {
        this.positionCategoryId = positionCategoryId;
    }
}