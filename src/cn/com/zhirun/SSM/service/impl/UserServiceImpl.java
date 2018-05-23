package cn.com.zhirun.SSM.service.impl;

import cn.com.zhirun.SSM.dao.CUserModelMapper;
import cn.com.zhirun.SSM.dao.UserModelMapper;
import cn.com.zhirun.SSM.model.UserModel;
import cn.com.zhirun.SSM.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {


    @Autowired
    CUserModelMapper cUserModelMapper;

    @Override
    public String  createUserId(){
        String userId = "000001";
        List<String> userList = cUserModelMapper.selectUser();
        if(userList==null||userList.isEmpty()){
            return userId;
        }else {
            int id = Integer.valueOf(userList.get(userList.size()-1))+1;
            userId = checkId(String.valueOf(id));
            return userId;
        }
    }

    @Override
    public String checkId(String id){
        if(id.length()==1){
            id = "00000"+id;
        }
        else if(id.length()==2){
            id = "0000"+id;
        }
        else if(id.length()==3){
            id = "000"+id;
        }
        else if(id.length()==4){
            id = "00"+id;
        }
        else{
            id = "0"+id;
        }


        return id;
    }

    @Override
    public int checkUserExistByName(UserModel user){
        int num = 0;
        num = cUserModelMapper.checkUserExistByName(user);
        return num;
    }

    @Override
    public void addUser(UserModel user){
        cUserModelMapper.insert(user);
    }

    @Override
    public String getNowDate(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String nowDate = sdf.format(new Date());
        return nowDate;
    }


    @Override
    public int checkUser(UserModel user) {
        int num = cUserModelMapper.checkUser(user);
        return  num;
    }
}
