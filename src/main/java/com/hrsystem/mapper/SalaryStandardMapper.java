package com.hrsystem.mapper;

import com.hrsystem.pojo.SalaryStandardQueryCondition;
import com.hrsystem.pojo.SalaryStandard;

import java.util.List;

public interface SalaryStandardMapper {

    int insert(SalaryStandard record);

    SalaryStandard selectByPrimaryKey(String salaryStandardId);

    Integer getRecheckCount(Integer status);

    List<SalaryStandard> selectByCondition(SalaryStandardQueryCondition condition);

    void updateSalaryStandard(SalaryStandard salaryStandard);
}