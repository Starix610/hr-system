package com.hrsystem.service.impl;

import com.hrsystem.mapper.*;
import com.hrsystem.pojo.*;
import com.hrsystem.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OptionsServiceImpl implements OptionsService {

    @Autowired
    private NationalityMapper nationalityMapper;
    @Autowired
    private NationMapper nationMapper;
    @Autowired
    private MajorMapper majorMapper;
    @Autowired
    private SalaryStandardMapper salaryStandardMapper;
    @Autowired
    private OrganizationMapper organizationMapper;
    @Autowired
    private PositionMapper positionMapper;
    @Autowired
    private PositionCategoryMapper positionCategoryMapper;
    @Autowired
    private ProfessionalTitleMapper professionalTitleMapper;

    //返回页面下拉框的初始化选项数据
    @Override
    public ComboBox getComboBox() {

        List<Nationality> nationalityList = nationalityMapper.selectAll();
        List<Nation> nationList = nationMapper.selectAll();
        List<Major> majorList = majorMapper.selectAll();
        SalaryStandardQueryCondition condition = new SalaryStandardQueryCondition();
        condition.setStatus(1); //只查审核通过的薪酬标准
        List<SalaryStandard> salaryStandardList = salaryStandardMapper.selectByCondition(condition);
        List<Organization> organizationList = organizationMapper.getListByLevel(1);
        List<PositionCategory> positionCategoryList = positionCategoryMapper.selectAll();
        List<ProfessionalTitle> professionalTitleList = professionalTitleMapper.selectAll();

        //封装好页面基础的下拉框数据对象ComboBox返回给控制层
        ComboBox comboBox = new ComboBox(nationalityList, nationList, majorList, salaryStandardList, organizationList, positionCategoryList, professionalTitleList);

        return comboBox;
    }

    @Override
    public List<Organization> getOrgByParentId(Integer parentId) {
        return organizationMapper.getListByParentId(parentId);
    }

    @Override
    public List<Position> getPositionsByCid(Integer cid) {
        return positionMapper.getPositionsByCid(cid);
    }
}
