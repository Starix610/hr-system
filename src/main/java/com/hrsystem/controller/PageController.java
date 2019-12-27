package com.hrsystem.controller;


import com.hrsystem.service.SalaryPaymenetService;
import com.hrsystem.service.SalaryStandardService;
import com.hrsystem.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * 页面相关Controller
 */

@Controller
public class PageController {

    @Autowired
    private StaffService staffService;
    @Autowired
    private SalaryStandardService salaryService;
    @Autowired
    private SalaryPaymenetService salaryPaymenetService;

    @RequestMapping("/")
    public String index(Model model, HttpSession session){

        //获得用户权限信息
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        GrantedAuthority[] authorities = userDetails.getAuthorities().toArray(new GrantedAuthority[0]);
        String authority="";
        switch (authorities[0].getAuthority()){
            case "ROLE_HR_specialist": authority = "人事专员";break;
            case "ROLE_HR_manager": authority = "人事经理";break;
            case "ROLE_CB_specialist":authority = "薪酬专员";break;
            case "ROLE_CB_manager":authority = "薪酬经理";break;
        }
        session.setAttribute("authority", authority);
        return "navigation-bar";
    }

    //操作成功后的信息提示页
    @RequestMapping("/info/{page}")
    public String showPage(@PathVariable("page")String page, String message,String back, Model model) {
        try {
            String str = new String(message.getBytes("ISO8859-1"),"UTF-8"); //get请求参数值转码
            model.addAttribute("message",str);
            model.addAttribute("back",back);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return page;
    }

    //获取导航栏未复核的数量
    @RequestMapping(value = "/count",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Integer> getCount(){

        Integer staffRecheckCount = staffService.getRecheckCount(2);
        Integer salaryStandardRecheckCount = salaryService.getRecheckCount(2);
        Integer recheckPaymentCount = salaryPaymenetService.getRecheckPaymentCount((0));

        Map<String,Integer> map = new HashMap<>();
        map.put("staffs",staffRecheckCount);
        map.put("salaryStandard",salaryStandardRecheckCount);
        map.put("recheckPaymentCount", recheckPaymentCount);
        return map;
    }


    //页面测试
    @RequestMapping("/page/{page}")
    public String testPage(@PathVariable("page")String page) {
        return page;
    }

}
