package com.hrsystem.service.impl;

import com.hrsystem.mapper.OrganizationMapper;
import com.hrsystem.mapper.PositionMapper;
import com.hrsystem.mapper.SalaryPaymentMapper;
import com.hrsystem.mapper.StaffRecordMapper;
import com.hrsystem.pojo.RecordQueryCondition;
import com.hrsystem.pojo.StaffRecordQueryResult;
import com.hrsystem.pojo.StaffRecord;
import com.hrsystem.service.StaffService;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffRecordMapper staffRecordMapper;
    @Autowired
    private OrganizationMapper organizationMapper;
    @Autowired
    private PositionMapper positionMapper;

    @Override
    public StaffRecord getStaffById(String record_id) {
        return staffRecordMapper.selectByPrimaryKey(record_id);
    }

    //员工档案添加
    @Override
    public void insertRecord(StaffRecord staffRecord) throws Exception {

        //需要手动封装档案编号、档案状态和图片路径
        staffRecord.setRegisterTime(new Date()); //设置登记时间
        staffRecord.setStatus(2);  //设置状态，默认2，代表未审核
        SimpleDateFormat format = new SimpleDateFormat("yyyy");

        StringBuffer sb = new StringBuffer();
        sb.append(format.format(new Date()));//四位年份
        sb.append(staffRecord.getOrganization1Id()<10?"0"+staffRecord.getOrganization1Id():staffRecord.getOrganization1Id());//两位I级机构编号
        sb.append(staffRecord.getOrganization2Id()<10?"0"+staffRecord.getOrganization2Id():staffRecord.getOrganization2Id());//两位II级机构编号
        sb.append(staffRecord.getOrganization3Id()<10?"0"+staffRecord.getOrganization3Id():staffRecord.getOrganization3Id());//两位III级机构编号
        String radom = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        sb.append(RandomStringUtils.random(2,radom));//末尾两位采用生成两位随机字符串拼接

        //字母加数字的两位随机串大概有1260种排列组合
        String recordId = sb.toString(); //这个编号还是有很大可能重复
        StaffRecord record = staffRecordMapper.selectByPrimaryKey(recordId); //先查数据库，判断是否存在以这个档案ID为主键的记录
        if (record==null){ //如果不存在记录，则代表该编号可用
            staffRecord.setRecordId(recordId);
        }else {
            sb.replace(10,12,RandomStringUtils.random(2,radom));//否则重新生成两位随机串
            recordId=sb.toString();
            staffRecord.setRecordId(recordId);
        }
        //如果编号还是不可用，则抛出异常给Controller处理
        staffRecordMapper.insert(staffRecord);
    }

    //获取未审核档案数量
    @Override
    public Integer getRecheckCount(Integer status) {
        Integer count = staffRecordMapper.getRecheckCount(status);
        return count;
    }

    //根据条件查询档案
    @Override
    public List<StaffRecordQueryResult> queryByCondition(RecordQueryCondition condition) {

        List<StaffRecord> list = staffRecordMapper.queryStaffListByCondition(condition);
        List<StaffRecordQueryResult> recheckList = new ArrayList<>();
        for (StaffRecord staffRecord : list) {
            StaffRecordQueryResult staffRecordQueryResult = new StaffRecordQueryResult();
            staffRecordQueryResult.setOrganization1Name(organizationMapper.getOrgNameById(staffRecord.getOrganization1Id()));
            staffRecordQueryResult.setOrganization2Name(organizationMapper.getOrgNameById(staffRecord.getOrganization2Id()));
            staffRecordQueryResult.setOrganization3Name(organizationMapper.getOrgNameById(staffRecord.getOrganization3Id()));
            staffRecordQueryResult.setPositionName(positionMapper.getPositionNameById(staffRecord.getPositionId()));
            staffRecordQueryResult.setRecordId(staffRecord.getRecordId());
            staffRecordQueryResult.setStaffName(staffRecord.getStaffName());
            staffRecordQueryResult.setSex(staffRecord.getSex());
            recheckList.add(staffRecordQueryResult);
        }
        return recheckList;
    }

    //更新档案信息
    @Override
    public void updateRecord(String record_id, StaffRecord staffRecord,Integer status) throws Exception {

        staffRecord.setRecordId(record_id);
        staffRecord.setStatus(status);
        staffRecordMapper.update(staffRecord);

    }

    @Override
    public void deleteRecord(String record_id, Integer status) {
        staffRecordMapper.updateStatusToDeleted(record_id,status);
    }
}