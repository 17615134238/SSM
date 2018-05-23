package cn.com.zhirun.SSM.dao;

import cn.com.zhirun.SSM.model.BusinessModel;
import cn.com.zhirun.SSM.model.Pages;

import java.util.List;

public interface BusinessModelMapper {
    int deleteByPrimaryKey(String bnsId);

    int insert(BusinessModel record);

    BusinessModel selectByPrimaryKey(String bnsId);

    List<BusinessModel> selectAll();

    int updateByPrimaryKey(BusinessModel record);

}