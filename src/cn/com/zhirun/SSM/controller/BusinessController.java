package cn.com.zhirun.SSM.controller;

import cn.com.zhirun.SSM.model.BusinessModel;
import cn.com.zhirun.SSM.model.Pages;
import cn.com.zhirun.SSM.service.IBusinessService;
import cn.com.zhirun.SSM.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Controller
public class BusinessController {

    @Autowired
    IBusinessService businessService;

    @Autowired
    ApplicationContext applicationContext;

    @RequestMapping("/InsertBns")
    public String addBusiness(BusinessModel businessModel){
        int num = businessService.checkBnsByName(businessModel);
        if(num==0){
            businessModel.setBnsId(businessService.createBnsId());
            businessModel.setBnsCreateDate(new UserServiceImpl().getNowDate());
            businessModel.setBnsUpdateDate(new UserServiceImpl().getNowDate());
            businessModel.setBnsDeleflg(0);
            businessService.addBns(businessModel);
            return "redirect:/jsp/chaxun.jsp";
        }
            return "redirect:/jsp/tianjia.jsp";
    }

    @ResponseBody
    @RequestMapping("/SelectBns")
    public ModelMap selectBns(Pages page,HttpSession session){
        if(page.getNum()!=null){
            page.setNowPage(1);
            List<BusinessModel> businessList = new ArrayList<>();
            businessList = businessService.selectBns(page);
            page.getBusinessModel().setNum(0);
            session.setAttribute("business",page.getBusinessModel());
            ModelMap modelMap = new ModelMap();
            modelMap.put("businessList",businessList);
            return modelMap;
        }
        else {
            page.setBusinessModel((BusinessModel) session.getAttribute("business"));
            List<BusinessModel> businessList = new ArrayList<>();
            businessList = businessService.selectBns(page);
            ModelMap modelMap = new ModelMap();
            modelMap.put("businessList",businessList);
            return modelMap;
        }
    }

    @ResponseBody
    @RequestMapping("/DeleteBns")
    public ModelMap deleteBns(BusinessModel businessModel){

        businessService.deleteBns(businessModel);

        ModelMap modelMap = new ModelMap();

        return modelMap;

    }

    @ResponseBody
    @RequestMapping("/SelectBnsById")
    public ModelMap selectBnsById(BusinessModel businessModel){

        BusinessModel business = businessService.selectBnsById(businessModel);
        ModelMap modelMap = new ModelMap();
        modelMap.put("business",business);
        return modelMap;
    }


    @ResponseBody
    @RequestMapping("/UpdateBns")
    public ModelMap updateBns(BusinessModel businessModel,HttpSession session){
        int num = businessService.updateByPrimaryKey(businessModel);
        if(num==1) {
            session.setAttribute("business1", businessModel);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.put("num",num);
        return modelMap;
    }

    @ResponseBody
    @RequestMapping("/Out")
    public ModelMap logOut(HttpSession session){
        session.removeAttribute("userName");
        ModelMap modelMap = new ModelMap();
        return modelMap;
    }

    @RequestMapping("/Qurey")
    public String qurey(){
       return "redirect:/jsp/chaxun.jsp";
    }

    @RequestMapping("/Add")
    public String add(){
        return "redirect:/jsp/tianjia.jsp";
    }

    @RequestMapping("/testLanguage")
    public ModelAndView testLanguage(String userName, Locale locale){

        Object[] object = new Object[1];
        object[0] = userName;
        String result = applicationContext.getMessage("login",object,locale);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("result",result);
        modelAndView.setViewName("result");
        return modelAndView;
    }
    @RequestMapping("/changeLanguage")
    public String changeLanguage(){
        return "forward:/jsp/testLanguage.jsp";
    }


}
