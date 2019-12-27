package com.hrsystem.service.impl;

import com.hrsystem.mapper.SalaryStandardMapper;
import com.hrsystem.pojo.SalaryStandardQueryCondition;
import com.hrsystem.pojo.SalaryStandard;
import com.hrsystem.service.SalaryStandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SalaryStandardServiceImpl implements SalaryStandardService {

    @Autowired
    private SalaryStandardMapper salaryStandardMapper;

    @Override
    public void addSalaryStandard(SalaryStandard salaryStandard) {
        salaryStandard.setStatus(2);
        salaryStandardMapper.insert(salaryStandard);
    }

    @Override
    public Integer getRecheckCount(Integer status) {

        return salaryStandardMapper.getRecheckCount(status);
    }

    @Override
    public List<SalaryStandard> querySalaryStandardByCondition(SalaryStandardQueryCondition condition) {

        List<SalaryStandard> list = salaryStandardMapper.selectByCondition(condition);
        return list;
    }

    @Override
    public SalaryStandard getSalaryStandarad(String id) {
        SalaryStandard salaryStandard = salaryStandardMapper.selectByPrimaryKey(id);
        return salaryStandard;
    }

    @Override
    public void updateSalaryStandard(SalaryStandard salaryStandard) {
        //页面未设置复核时间和复核人，在此设置
        salaryStandard.setRecheckTime(new Date());
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        salaryStandard.setRecheckName(user.getUsername());
        salaryStandardMapper.updateSalaryStandard(salaryStandard);
    }
}
