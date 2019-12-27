package com.hrsystem.service.impl;

import com.hrsystem.mapper.OrganizationMapper;
import com.hrsystem.mapper.SalaryPaymentDetailMapper;
import com.hrsystem.mapper.SalaryPaymentMapper;
import com.hrsystem.pojo.SalaryPayment;
import com.hrsystem.pojo.SalaryPaymentDetail;
import com.hrsystem.pojo.SalaryPaymentQueryCondition;
import com.hrsystem.pojo.SalaryPaymentQueryResult;
import com.hrsystem.service.SalaryPaymenetService;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SalaryPaymenetServiceImpl implements SalaryPaymenetService {

    @Autowired
    private SalaryPaymentMapper salaryPaymentMapper;
    @Autowired
    private OrganizationMapper organizationMapper;
    @Autowired
    private SalaryPaymentDetailMapper salaryPaymentDetailMapper;


    //联表查询待登记的列表
    @Override
    public List<SalaryPaymentQueryResult> getNoRegisterList() {

        List<SalaryPayment> list = salaryPaymentMapper.selectNoRegisterList();
        List<SalaryPaymentQueryResult> paymentQueryResults = toPaymentQueryResultList(list);
        return paymentQueryResults;
    }


    public List<SalaryPaymentQueryResult> toPaymentQueryResultList(List<SalaryPayment> list){

        List<SalaryPaymentQueryResult> paymentQueryResults = new ArrayList<>();
        for (SalaryPayment salaryPayment : list) {
            SalaryPaymentQueryResult queryResult = new SalaryPaymentQueryResult();
            queryResult.setSalaryPaymentId(salaryPayment.getSalaryPaymentId());
            HashMap<Integer, String> orgMap = new LinkedHashMap<>();
            orgMap.put(salaryPayment.getOrganization1Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization1Id()));
            orgMap.put(salaryPayment.getOrganization2Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization2Id()));
            orgMap.put(salaryPayment.getOrganization3Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization3Id()));
            queryResult.setOrganizations(orgMap);
            queryResult.setNumberOfStaff(salaryPayment.getNumberOfStaff());
            queryResult.setTotalBaseSalary(salaryPayment.getTotalBaseSalary());
            queryResult.setRealPay(salaryPayment.getRealPay());
            queryResult.setRegistrant(salaryPayment.getRegistrant());
            queryResult.setRecheckName(salaryPayment.getRecheckName());
            queryResult.setRegisterTime(salaryPayment.getRegisterTime());
            queryResult.setRecheckTime(salaryPayment.getRecheckTime());
            paymentQueryResults.add(queryResult);
        }
        return paymentQueryResults;
    }

    @Override
    public SalaryPaymentQueryResult getPaymentQueryResultByOrgId(Integer orgId1, Integer orgId2, Integer orgId3) {

        SalaryPayment salaryPayment = salaryPaymentMapper.selectSalaryPaymentByOrgId(orgId1,orgId2,orgId3);
        SalaryPaymentQueryResult queryResult = new SalaryPaymentQueryResult();
        queryResult.setSalaryPaymentId("SG"+RandomStringUtils.randomNumeric(10)); //随机生成12位薪酬发放单号
        HashMap<Integer, String> orgMap = new LinkedHashMap<>();
        orgMap.put(salaryPayment.getOrganization1Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization1Id()));
        orgMap.put(salaryPayment.getOrganization2Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization2Id()));
        orgMap.put(salaryPayment.getOrganization3Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization3Id()));
        queryResult.setOrganizations(orgMap);
        queryResult.setNumberOfStaff(salaryPayment.getNumberOfStaff());
        queryResult.setTotalBaseSalary(salaryPayment.getTotalBaseSalary());
        return queryResult;
    }

    @Override
    public List<SalaryPaymentDetail> getPaymentDetailListByOrgId(Integer orgId1, Integer orgId2, Integer orgId3) {
        List<SalaryPaymentDetail> list =  salaryPaymentDetailMapper.selectPaymentDetailListByOrgId(orgId1,orgId2,orgId3);
        return list;
    }

    @Override
    public void insertSalaryPayment(SalaryPayment salaryPayment) {
        salaryPayment.setStatus(0); //设置待复核状态
        salaryPayment.setRegisterTime(new Date());
        salaryPaymentMapper.insert(salaryPayment);
    }

    @Override
    public void insertPaymentDetail(List<SalaryPaymentDetail> paymentDetailList) {
        for (SalaryPaymentDetail paymentDetail : paymentDetailList) {
            paymentDetail.setSalaryPaymentDetailId(UUID.randomUUID().toString()); //36位随机字符串
            salaryPaymentDetailMapper.insert(paymentDetail);
        }
    }

    @Override
    public Integer getRecheckPaymentCount(Integer status) {
        Integer count = salaryPaymentMapper.getRececkCount(status);
        return count;
    }

    @Override
    public List<SalaryPaymentQueryResult> getPaymentRecheckList(Integer status) {

        List<SalaryPayment> salaryPaymentList = salaryPaymentMapper.selectRechceckList(status);//直接从薪酬发放表查询
        List<SalaryPaymentQueryResult> queryResultList = toPaymentQueryResultList(salaryPaymentList);
        return queryResultList;
    }

    @Override
    public SalaryPaymentQueryResult getPaymentQueryResultById(String paymentId) {
        SalaryPayment salaryPayment = salaryPaymentMapper.selectByPrimaryKey(paymentId);//直接从薪酬发放表查询
        SalaryPaymentQueryResult queryResult = new SalaryPaymentQueryResult();
        queryResult.setSalaryPaymentId(salaryPayment.getSalaryPaymentId());
        HashMap<Integer, String> orgMap = new LinkedHashMap<>();
        orgMap.put(salaryPayment.getOrganization1Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization1Id()));
        orgMap.put(salaryPayment.getOrganization2Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization2Id()));
        orgMap.put(salaryPayment.getOrganization3Id(), organizationMapper.getOrgNameById(salaryPayment.getOrganization3Id()));
        queryResult.setOrganizations(orgMap);
        queryResult.setNumberOfStaff(salaryPayment.getNumberOfStaff());
        queryResult.setTotalBaseSalary(salaryPayment.getTotalBaseSalary());
        queryResult.setRealPay(salaryPayment.getRealPay());
        queryResult.setRegistrant(salaryPayment.getRegistrant());
        queryResult.setRecheckName(salaryPayment.getRecheckName());
        queryResult.setRegisterTime(salaryPayment.getRegisterTime());
        queryResult.setRecheckTime(salaryPayment.getRecheckTime());
        return queryResult;
    }

    @Override
    public List<SalaryPaymentDetail> getPaymentDetailListById(String paymentId) {

        List<SalaryPaymentDetail> list =  salaryPaymentDetailMapper.selectByPaymentId(paymentId);
        return list;
    }

    @Override
    public void updatePayment(SalaryPayment salaryPayment,Integer status) {

        salaryPayment.setStatus(status);
        salaryPayment.setRecheckTime(new Date());
        salaryPaymentMapper.recheckUpdate(salaryPayment);
    }

    @Override
    public void updatePaymentDetail(List<SalaryPaymentDetail> paymentDetailList) {
        for (SalaryPaymentDetail paymentDetail : paymentDetailList) {
            salaryPaymentDetailMapper.updateByPrimaryKey(paymentDetail);
        }
    }

    @Override
    public List<SalaryPaymentQueryResult> queryPaymentByCondition(SalaryPaymentQueryCondition condition) {

        List<SalaryPayment> paymentList = salaryPaymentMapper.queryByCondition(condition);
        List<SalaryPaymentQueryResult> resultList = toPaymentQueryResultList(paymentList);
        return resultList;
    }
}
