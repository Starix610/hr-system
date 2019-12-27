package com.hrsystem.mapper;

import com.hrsystem.pojo.RecordQueryCondition;
import com.hrsystem.pojo.StaffRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StaffRecordMapper {


    int insert(StaffRecord record);

    StaffRecord selectByPrimaryKey(String recordId);

    Integer getRecheckCount(Integer status);

    List<StaffRecord> queryStaffListByCondition(RecordQueryCondition condition);

    void update(StaffRecord staffRecord);

    void updateStatusToDeleted(@Param("record_id") String record_id, @Param("status")Integer status);
}