package com.hrsystem.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @RequestMapping("/user/login")
    public String loginPage(Model model, HttpServletRequest request){
        //登录失败后回显用户名
        String username = request.getParameter("username");
        model.addAttribute("last_username", username);
        return "login";

    }

    @RequestMapping("/accessDenied")
    public String accessDenied(){
        return "access_denied";
    }

}
