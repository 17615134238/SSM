package cn.com.zhirun.SSM.service;

import cn.com.zhirun.SSM.model.UserModel;



public interface IUserService {
    public String  createUserId();

    public String checkId(String id);

    public int checkUserExistByName(UserModel user);

    public void addUser(UserModel user);

    public String getNowDate();

    public int checkUser(UserModel user);
}
