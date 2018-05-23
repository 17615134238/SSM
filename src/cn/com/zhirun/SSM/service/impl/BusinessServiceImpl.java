package cn.com.zhirun.SSM.service.impl;

import cn.com.zhirun.SSM.dao.BusinessModelMapper;
import cn.com.zhirun.SSM.dao.CBusinessModelMapper;
import cn.com.zhirun.SSM.model.BusinessModel;
import cn.com.zhirun.SSM.model.Pages;
import cn.com.zhirun.SSM.service.IBusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class BusinessServiceImpl implements IBusinessService {

    @Autowired
    CBusinessModelMapper cBusinessModelMapper;

    @Autowired
    BusinessModelMapper businessModelMapper;

    @Override
    public String createBnsId() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String nowDate = sdf.format(new Date());
        String bnsId = "LYJ"+nowDate;
        return bnsId;
    }

    @Override
    public int checkBnsByName(BusinessModel business) {

        return cBusinessModelMapper.checkBnsByName(business);
    }

    @Override
    public void addBns(BusinessModel business) {
        cBusinessModelMapper.insert(business);
    }

    @Override
    public List<BusinessModel> selectBns(Pages pages) {

        int sum = (pages.getNowPage()-1)*pages.getBusinessModel().getRowNum();
        pages.setStart(sum);
        List<BusinessModel> businessModelList = cBusinessModelMapper.selectBns(pages);
        return businessModelList;
    }

    @Override
    public void deleteBns(BusinessModel businessModel){
        cBusinessModelMapper.deleteBns(businessModel);
    }

    @Override
    public BusinessModel selectBnsById(BusinessModel businessModel) {
        return businessModelMapper.selectByPrimaryKey(businessModel.getBnsId());
    }

    @Override
    public int updateByPrimaryKey(BusinessModel record) {
        record.setBnsUpdateDate(new UserServiceImpl().getNowDate());
        return businessModelMapper.updateByPrimaryKey(record);
    }
}
