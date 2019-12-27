package com.hrsystem.controller;

import com.hrsystem.pojo.SalaryStandardQueryCondition;
import com.hrsystem.pojo.SalaryStandard;
import com.hrsystem.service.SalaryStandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SalaryStandardController {

    @Autowired
    private SalaryStandardService salaryService;


    @RequestMapping("/salary/standard/register/{page}")
    public String salaryRegister(@PathVariable("page") String page) {
        return page;
    }


    //薪酬标准添加
    @RequestMapping(value = "/salary/standard",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Integer> addSalaryStandard(SalaryStandard salaryStandard){

        salaryService.addSalaryStandard(salaryStandard);
        Integer count = salaryService.getRecheckCount(2);
        Map<String,Integer> map = new HashMap<>();
        map.put("count",count);
        return map;

    }

    //获取薪酬标准待复核列表
    @RequestMapping("/salary/standard/recheck/list")
    public String getRecheckSalaryStandardList(Model model){
        SalaryStandardQueryCondition condition = new SalaryStandardQueryCondition();
        condition.setStatus(2);
        List<SalaryStandard> list =  salaryService.querySalaryStandardByCondition(condition);
        model.addAttribute("SalaryStandardList", list);
        return "salary_recheck_list";
    }

    //获取薪酬标准详情
    @RequestMapping("/salary/standard/{id}")
    public String salaryStandaradDetail(@PathVariable("id") String id,String page,Model model){

        SalaryStandard salaryStandard = salaryService.getSalaryStandarad(id);
        model.addAttribute("salaryStandard", salaryStandard);
        return page;
    }

    @RequestMapping("/salary/standard/recheck")
    @ResponseBody
    public Map<String,Integer> doRecheck(SalaryStandard salaryStandard){

        salaryStandard.setStatus(1);
        salaryService.updateSalaryStandard(salaryStandard);
        Integer count = salaryService.getRecheckCount(2);
        HashMap<String, Integer> map = new HashMap<>();
        map.put("count", count);

        return map;
    }

    @RequestMapping("/salary/standard/querypage/{page}")
    public String queryPage(@PathVariable("page") String page){

        return page;
    }

    //薪酬标准查询
    @RequestMapping(value = "/salary/standards")
    @ResponseBody
    public List<SalaryStandard> querySalaryStandard(SalaryStandardQueryCondition condition){

        condition.setStatus(1); //只查复核通过的薪酬标准
        List<SalaryStandard> list = salaryService.querySalaryStandardByCondition(condition);
        return list;

    }



}


