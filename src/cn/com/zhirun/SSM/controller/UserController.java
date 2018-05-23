package cn.com.zhirun.SSM.controller;

import cn.com.zhirun.SSM.model.UserModel;
import cn.com.zhirun.SSM.service.IUserService;
import cn.com.zhirun.SSM.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    IUserService userService;

    @RequestMapping("/InsertUser")
    public String addUser(UserModel user, HttpServletResponse response, HttpServletRequest request) throws IOException {
        int num = userService.checkUserExistByName(user);
        if(num==0) {
            String userId = userService.createUserId();
            String nowDate = userService.getNowDate();
            user.setUserId(userId);
            user.setUserCreateDate(nowDate);
            userService.addUser(user);
            return "redirect:/jsp/zhuceResult.jsp";
        }else {
            return "redirect:/jsp/zhuce.jsp";
        }
    }

    @ResponseBody
    @RequestMapping("/selectUserByName")
    public ModelMap selectUserByName(UserModel user){
        ModelMap modelMap = new ModelMap();
        int num = userService.checkUserExistByName(user);
        modelMap.put("num",num);
        return modelMap;
    }

    @ResponseBody
    @RequestMapping("/SelectUser")
    public ModelMap selectUser(UserModel user , HttpSession session){
        int num = userService.checkUser(user);
        ModelMap modelMap = new ModelMap();
        if(num>0){
            session.setAttribute("userName",user.getUserName());
        }
        modelMap.put("num",num);
        return modelMap;
    }

}
