package cn.com.zhirun.SSM.service;

import cn.com.zhirun.SSM.model.BusinessModel;
import cn.com.zhirun.SSM.model.Pages;

import java.util.List;


public interface IBusinessService {

     String createBnsId();

     int checkBnsByName(BusinessModel business);

     void addBns(BusinessModel business);

     List<BusinessModel> selectBns(Pages pages);

     void deleteBns(BusinessModel businessModel);

    BusinessModel selectBnsById(BusinessModel businessModel);

     int updateByPrimaryKey(BusinessModel record);
}
