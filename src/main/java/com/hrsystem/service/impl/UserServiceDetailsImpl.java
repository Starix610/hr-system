package com.hrsystem.service.impl;

import com.hrsystem.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import java.util.ArrayList;
import java.util.List;


/**
 * 登录认证类
 */
public class UserServiceDetailsImpl implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

//        System.out.println("经过了UserServiceDetailsImpl");
        com.hrsystem.pojo.User user = userMapper.selectByPrimaryKey(username);
        if (user!=null){
            List<GrantedAuthority> grantedAuthorities = new ArrayList<>();  //用户的角色(不同角色拥有不同权限)
            grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole()));  //构建角色列表
            return new User(username,user.getPassword(),grantedAuthorities);
        }else{
            throw new UsernameNotFoundException(username);  //关键在这。。。。不抛出这个异常的话即使配置了配置文件页面也捕获不到相关信息
        }
    }
}
