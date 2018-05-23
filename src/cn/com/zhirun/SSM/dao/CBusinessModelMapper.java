package cn.com.zhirun.SSM.dao;

import cn.com.zhirun.SSM.model.BusinessModel;
import cn.com.zhirun.SSM.model.Pages;

import java.util.List;


public interface CBusinessModelMapper extends BusinessModelMapper {

     int checkBnsByName(BusinessModel business);

     List<BusinessModel> selectBns(Pages pages);

     void deleteBns(BusinessModel businessModel);

     int updateBnsById(BusinessModel businessModel);

}