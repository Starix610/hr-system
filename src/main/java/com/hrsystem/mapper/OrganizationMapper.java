package com.hrsystem.mapper;

import com.hrsystem.pojo.Organization;
import java.util.List;

public interface OrganizationMapper {

    List<Organization> getListByLevel(Integer level);

    List<Organization> getListByParentId(Integer parentId);

    String getOrgNameById(Integer organization1Id);
}