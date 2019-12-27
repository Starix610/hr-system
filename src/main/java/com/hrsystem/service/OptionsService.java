package com.hrsystem.service;

import com.hrsystem.pojo.ComboBox;
import com.hrsystem.pojo.Organization;
import com.hrsystem.pojo.Position;

import java.util.List;

public interface OptionsService {


    ComboBox getComboBox();

    List<Organization> getOrgByParentId(Integer parentId);

    List<Position> getPositionsByCid(Integer cid);

}
