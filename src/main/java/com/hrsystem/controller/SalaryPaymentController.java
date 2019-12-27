package com.hrsystem.controller;

import com.alibaba.fastjson.JSON;
import com.hrsystem.pojo.SalaryPayment;
import com.hrsystem.pojo.SalaryPaymentDetail;
import com.hrsystem.pojo.SalaryPaymentQueryCondition;
import com.hrsystem.pojo.SalaryPaymentQueryResult;
import com.hrsystem.service.SalaryPaymenetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SalaryPaymentController {

    @Autowired
    private SalaryPaymenetService salaryPaymenetService;

    @RequestMapping("/salary/payment/register/list")
    public String getSalaryPaymentList(Model model) {

        List<SalaryPaymentQueryResult> list = salaryPaymenetService.getNoRegisterList();  //联表查询待登记的列表
        model.addAttribute("salaryPaymentList", list);
        return "salary_payment_list";
    }

    @RequestMapping("/salary/payment/register/detail")
    public String paymentRegisterDetail(Integer orgId1,Integer orgId2,Integer orgId3,Model model) {

        SalaryPaymentQueryResult paymentQueryResult = salaryPaymenetService.getPaymentQueryResultByOrgId(orgId1,orgId2,orgId3);
        List<SalaryPaymentDetail> detailList = salaryPaymenetService.getPaymentDetailListByOrgId(orgId1,orgId2,orgId3);
        Map<String,Object> map = new HashMap<>();
        map.put("paymentQueryResult", paymentQueryResult);
        map.put("detailList", detailList);
        model.addAttribute("detailMap", map);
        return "salary_payment_detail";
    }

    @RequestMapping("/salary/payment/register")
    @ResponseBody
    public Map<String,Integer> doRegister(@RequestBody Map<String,Object> map){

        //接收的的map参数前端的Json转换而成，包含SalaryPayment和List<SalaryPaymentDetail>对象,将map转换成实体类
        SalaryPayment salaryPayment = JSON.parseObject(JSON.toJSONString(map.get("salaryPayment")), SalaryPayment.class);
        List<SalaryPaymentDetail> paymentDetailList = JSON.parseArray(JSON.toJSONString(map.get("salaryPaymentDetailList")), SalaryPaymentDetail.class);
        salaryPaymenetService.insertSalaryPayment(salaryPayment);
        salaryPaymenetService.insertPaymentDetail(paymentDetailList);
        Integer count = salaryPaymenetService.getRecheckPaymentCount(0); //获取待审核的发放单数量
        Map<String,Integer> countMap = new HashMap<>();
        countMap.put("count", count);
        return countMap;
    }


    //获取薪酬发放待复核列表
    @RequestMapping("/salary/payment/recheck/list")
    public String getRecheckList(Model model){

        List<SalaryPaymentQueryResult> list =  salaryPaymenetService.getPaymentRecheckList(0);
        model.addAttribute("paymentRecheckList", list);

        return "salary_payment_recheck_list";
    }

    //获取薪酬发放单详情
    @RequestMapping("/salary/payment/detail/{id}")
    public String paymentRecheckDetail(@PathVariable("id") String paymentId,String page, Model model){

        SalaryPaymentQueryResult paymentQueryResult = salaryPaymenetService.getPaymentQueryResultById(paymentId);
        List<SalaryPaymentDetail> detailList = salaryPaymenetService.getPaymentDetailListById(paymentId);
        Map<String,Object> map = new HashMap<>();
        map.put("paymentQueryResult", paymentQueryResult);
        map.put("detailList", detailList);
        model.addAttribute("detailMap", map);
        return page;
    }

    @RequestMapping("/salary/payment/recheck")
    @ResponseBody
    public Map<String,Integer> doRecheck(@RequestBody Map<String,Object> map){
        //接收的的map参数前端的Json转换而成，包含SalaryPayment和List<SalaryPaymentDetail>对象,将map转换成实体类
        SalaryPayment salaryPayment = JSON.parseObject(JSON.toJSONString(map.get("salaryPayment")), SalaryPayment.class);
        List<SalaryPaymentDetail> paymentDetailList = JSON.parseArray(JSON.toJSONString(map.get("salaryPaymentDetailList")), SalaryPaymentDetail.class);
        salaryPaymenetService.updatePayment(salaryPayment,1);
        salaryPaymenetService.updatePaymentDetail(paymentDetailList);
        Integer count = salaryPaymenetService.getRecheckPaymentCount(0); //获取待审核的发放单数量
        Map<String,Integer> countMap = new HashMap<>();
        countMap.put("count", count);
        return countMap;
    }

    @RequestMapping("/salary/payment/querypage/{page}")
    public String queryPage(@PathVariable("page") String page){
        return page;
    }

    //薪酬发放单查询
    @RequestMapping(value = "/salary/payment")
    @ResponseBody
    public List<SalaryPaymentQueryResult> queryPayment(SalaryPaymentQueryCondition condition){

        List<SalaryPaymentQueryResult> resultList = salaryPaymenetService.queryPaymentByCondition(condition);

        return resultList;
    }


}
