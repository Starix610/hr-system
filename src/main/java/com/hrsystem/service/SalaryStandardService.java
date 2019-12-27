package com.hrsystem.service;

import com.hrsystem.pojo.SalaryStandardQueryCondition;
import com.hrsystem.pojo.SalaryStandard;

import java.util.List;

public interface SalaryStandardService {

    void addSalaryStandard(SalaryStandard salaryStandard);

    Integer getRecheckCount(Integer status);

    List<SalaryStandard> querySalaryStandardByCondition(SalaryStandardQueryCondition condition);

    SalaryStandard getSalaryStandarad(String id);

    void updateSalaryStandard(SalaryStandard salaryStandard);
}
