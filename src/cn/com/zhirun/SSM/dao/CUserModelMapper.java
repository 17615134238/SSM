package cn.com.zhirun.SSM.dao;

import cn.com.zhirun.SSM.model.UserModel;

import java.util.List;


public interface CUserModelMapper extends UserModelMapper {


    public List<String> selectUser();

    public int checkUser(UserModel user);

    public int checkUserExistByName(UserModel user);


}