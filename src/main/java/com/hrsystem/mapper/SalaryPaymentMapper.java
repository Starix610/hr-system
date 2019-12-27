package com.hrsystem.mapper;

import com.hrsystem.pojo.SalaryPayment;
import com.hrsystem.pojo.SalaryPaymentDetail;
import com.hrsystem.pojo.SalaryPaymentQueryCondition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SalaryPaymentMapper {

    int insert(SalaryPayment record);

    SalaryPayment selectByPrimaryKey(String salaryPaymentId);

    int recheckUpdate(SalaryPayment record);

    List<SalaryPayment> selectNoRegisterList();

    SalaryPayment selectSalaryPaymentByOrgId(@Param("orgId1") Integer orgId1, @Param("orgId2") Integer orgId2, @Param("orgId3") Integer orgId3);

    Integer getRececkCount(Integer status);

    List<SalaryPayment> selectRechceckList(Integer status);

    List<SalaryPayment> queryByCondition(SalaryPaymentQueryCondition condition);
}