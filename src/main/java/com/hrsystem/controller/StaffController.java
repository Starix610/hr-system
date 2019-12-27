package com.hrsystem.controller;

import com.hrsystem.pojo.RecordQueryCondition;
import com.hrsystem.pojo.StaffRecord;
import com.hrsystem.pojo.StaffRecordQueryResult;
import com.hrsystem.service.StaffService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Controller
public class StaffController {

    @Autowired
    private StaffService staffService;

    //RESTful风格的URL，POST请求方式用来添加数据
    @RequestMapping(value = "/staffs",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Integer> addStaffRecord(StaffRecord staffRecord, MultipartFile pictureFile, HttpServletRequest request){

        try {
            if (pictureFile.getSize()>0){ //是否有文件上传
                String pictureURL = getPictureURL(pictureFile, request);
                staffRecord.setPhotoUrl(pictureURL);
            }else {
                staffRecord.setPhotoUrl("img/head.png");
            }
            staffService.insertRecord(staffRecord);
            Integer count =  staffService.getRecheckCount(2);//返回待审核的档案数
            Map<String,Integer> map = new HashMap<>();
            map.put("count",count);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    //获取待复核档案列表
    @RequestMapping("/staffs/recheck/list")
    public String getRecheckRecords(Model model){

        RecordQueryCondition condition = new RecordQueryCondition();
        condition.setStatus(2);
        List<StaffRecordQueryResult> recheckList = staffService.queryByCondition(condition);
        model.addAttribute("recheckList",recheckList);
        return "record_recheck_list";
    }


    //获取档案详情
    @RequestMapping(value = "/staffs/{record_id}",method = RequestMethod.GET)
    public String recordDetail(@PathVariable("record_id") String record_id ,String page, Model model){

        StaffRecord staffRecord = staffService.getStaffById(record_id);
        model.addAttribute("staffRecord",staffRecord);
        return "forward:/options/"+page;   //转发获取下拉框数据并返回视图
    }


    //档案审核
    @RequestMapping(value = "/staffs/recheck/{record_id}",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Integer> doRechcek(@PathVariable("record_id") String record_id,StaffRecord staffRecord, MultipartFile pictureFile, HttpServletRequest request){

        try {
            if (pictureFile.getSize()>0){ //是否有文件上传
                String pictureURL = getPictureURL(pictureFile, request);
                staffRecord.setPhotoUrl(pictureURL);
            }
            staffService.updateRecord(record_id,staffRecord,1);
            Integer count = staffService.getRecheckCount(2);
            Map<String,Integer> map = new HashMap<>();
            map.put("count",count);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //获取下拉框数据并跳转查询页面
    @RequestMapping("/staffs/querypage/{page}")
    public String queryPage(@PathVariable("page")String page) {
        return "forward:/options/"+page;  //获取下拉框数据并返回视图
    }


    //档案查询
    @RequestMapping(value = "/staffs",method = RequestMethod.GET)
    @ResponseBody
    public List<StaffRecordQueryResult> queryRecord(RecordQueryCondition condition){

        List<StaffRecordQueryResult> list = staffService.queryByCondition(condition);
        return list;

    }

    //档案变更
    @RequestMapping(value = "/staffs/{record_id}",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Integer> updateRecord(@PathVariable("record_id") String record_id,StaffRecord staffRecord,MultipartFile pictureFile, HttpServletRequest request){

        try {
            if (pictureFile.getSize()>0){ //是否有文件上传
                String pictureURL = getPictureURL(pictureFile, request);
                staffRecord.setPhotoUrl(pictureURL);
            }
            staffService.updateRecord(record_id,staffRecord,2);
            Integer count = staffService.getRecheckCount(2);
            Map<String,Integer> map = new HashMap<>();
            map.put("count",count);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    //档案删除
    @RequestMapping("/staffs/delete/{record_id}")
    @ResponseBody
    public String deleteRecord(@PathVariable("record_id") String record_id){

        staffService.deleteRecord(record_id,0);
        return "ok";
    }


    //封装图片上传的方法，代码重用
    public String getPictureURL(MultipartFile pictureFile, HttpServletRequest request) throws IOException {

        //保存到项目路径
        String realPath = request.getSession().getServletContext().getRealPath("/upload");
        //UUID替换文件名防止同名覆盖
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        //获取文件后缀名(不带.)
        String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
        //图片全路径
        String filePathName = realPath + "\\" + name + "." + ext;
        //保存图片
        pictureFile.transferTo(new File(filePathName));
        String pictureURL = "upload/" + name + "." + ext;

        return pictureURL;
    }


}
