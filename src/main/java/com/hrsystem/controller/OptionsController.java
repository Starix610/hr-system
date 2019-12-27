package com.hrsystem.controller;


import com.hrsystem.pojo.ComboBox;
import com.hrsystem.pojo.Organization;
import com.hrsystem.pojo.Position;
import com.hrsystem.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 下拉框数据Controller
 */

@Controller
public class OptionsController {

    @Autowired
    private OptionsService optionsService;

    //返回表单下拉框数据，同时返回视图
    @RequestMapping("/options/{page}")
    public String getComboBox(@PathVariable("page") String page,Model model){
        ComboBox comboBox = optionsService.getComboBox();
        model.addAttribute("comboBox",comboBox);
        return page;
    }

    //根据上级机构ID获取该机构的下级机构
    @RequestMapping("/options/organization/{parentId}")
    @ResponseBody
    public List<Organization> getOrganization(@PathVariable("parentId") Integer parentId, Model model){
        List<Organization> organizationList =  optionsService.getOrgByParentId(parentId);
        return organizationList;
    }

    @RequestMapping("/options/position/{cid}")
    @ResponseBody
    public List<Position> getPosition(@PathVariable("cid") Integer cid){
        return optionsService.getPositionsByCid(cid);
    }
}
