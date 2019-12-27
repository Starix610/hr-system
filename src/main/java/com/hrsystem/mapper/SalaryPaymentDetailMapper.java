package com.hrsystem.mapper;

import com.hrsystem.pojo.SalaryPaymentDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SalaryPaymentDetailMapper {

    int insert(SalaryPaymentDetail record);

    int updateByPrimaryKey(SalaryPaymentDetail record);

    List<SalaryPaymentDetail> selectPaymentDetailListByOrgId(@Param("orgId1") Integer orgId1, @Param("orgId2") Integer orgId2, @Param("orgId3")Integer orgId3);

    List<SalaryPaymentDetail> selectByPaymentId(String paymentId);
}