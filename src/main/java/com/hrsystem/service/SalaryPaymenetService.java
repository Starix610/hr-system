package com.hrsystem.service;

import com.hrsystem.pojo.SalaryPayment;
import com.hrsystem.pojo.SalaryPaymentDetail;
import com.hrsystem.pojo.SalaryPaymentQueryCondition;
import com.hrsystem.pojo.SalaryPaymentQueryResult;

import java.util.List;

public interface SalaryPaymenetService {


    List<SalaryPaymentQueryResult> getNoRegisterList();

    SalaryPaymentQueryResult getPaymentQueryResultByOrgId(Integer orgId1, Integer orgId2, Integer orgId3);

    List<SalaryPaymentDetail> getPaymentDetailListByOrgId(Integer orgId1, Integer orgId2, Integer orgId3);

    void insertSalaryPayment(SalaryPayment salaryPayment);

    void insertPaymentDetail(List<SalaryPaymentDetail> paymentDetailList);

    Integer getRecheckPaymentCount(Integer status);

    List<SalaryPaymentQueryResult> getPaymentRecheckList(Integer status);

    SalaryPaymentQueryResult getPaymentQueryResultById(String paymentId);

    List<SalaryPaymentDetail> getPaymentDetailListById(String paymentId);

    void updatePayment(SalaryPayment salaryPayment,Integer status);

    void updatePaymentDetail(List<SalaryPaymentDetail> paymentDetailList);

    List<SalaryPaymentQueryResult> queryPaymentByCondition(SalaryPaymentQueryCondition condition);
}
