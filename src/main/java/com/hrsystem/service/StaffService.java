package com.hrsystem.service;

import com.hrsystem.pojo.RecordQueryCondition;
import com.hrsystem.pojo.StaffRecord;
import com.hrsystem.pojo.StaffRecordQueryResult;

import java.util.List;

public interface StaffService {

    StaffRecord getStaffById(String record_id);

    void insertRecord(StaffRecord staffRecord) throws Exception;

    Integer getRecheckCount(Integer status);

    List<StaffRecordQueryResult> queryByCondition(RecordQueryCondition condition);

    void updateRecord(String record_id, StaffRecord staffRecord,Integer status) throws Exception;

    void deleteRecord(String record_id, Integer status);
}
