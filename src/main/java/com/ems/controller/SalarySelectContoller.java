package com.ems.controller;


import com.ems.dal.example.*;
import com.ems.dal.mapper.BusinessMapper;
import com.ems.dal.mapper.SalaryMapper;
import com.ems.mode.ConsoleResultModel;
import com.ems.service.IAdminRoleService;
import com.ems.service.IBusinessService;
import com.ems.service.ISalaryService;
import com.ems.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/salaryselect")
public class SalarySelectContoller {

    @Resource
    private IUserService userService;

    @Resource
    private IAdminRoleService adminRoleService;

    @Resource
    private SalaryMapper salaryMapper;

    @Resource
    private BusinessMapper businessMapper;

    @RequestMapping("/to-list")
    public String toList(Model model) throws Exception {
        List<User> users = userService.selectAll();
        model.addAttribute("users", users);
        return "SalarySelect";
    }

    @RequestMapping(value = "select")
    @ResponseBody
    public ConsoleResultModel<String> select(Long userId) throws Exception {
        ConsoleResultModel<String> resultModel = new ConsoleResultModel<>();
        String string = "";
        if (userId==null){
            string="请选择用户";
        }else {
            User user = userService.selectById(userId);
            Role role = adminRoleService.selectById(user.getRoleId());
            SalaryExample exaple = new SalaryExample();
            exaple.createCriteria().andRoleIdEqualTo(role.getId());
            List<Salary> salaries = salaryMapper.selectByExample(exaple);
            if (CollectionUtils.isEmpty(salaries)){
                string = "薪水配置不存在,请联系管理员";
            }else {
                BusinessExample example = new BusinessExample();
                example.createCriteria().andUserIdEqualTo(userId);
                List<Business> businesses = businessMapper.selectByExample(example);
                if (CollectionUtils.isEmpty(businesses)){
                    string = "该员工业绩信息不存在,请联系管理员";
                }else{
                    Calendar calendar = Calendar.getInstance(Locale.CHINA);
                    Integer day = calendar.getActualMaximum(Calendar.DATE);
                    calendar.setTime(new Date());
                    Integer endDay = calendar.get(Calendar.DAY_OF_MONTH);
                    calendar.set(Calendar.DAY_OF_MONTH,1);
                    Integer startDay = calendar.get(Calendar.DAY_OF_MONTH);
                    Integer effectiveDay = endDay-startDay;
                    Salary salary = salaries.get(0);
                    Business business = businesses.get(0);
                    BigDecimal bigDecimal = business.getFraction().multiply(salary.getSalary()).multiply(new BigDecimal(effectiveDay)).
                            divide(new BigDecimal(10*day),2,BigDecimal.ROUND_HALF_UP);
                    string = String.valueOf(bigDecimal.doubleValue());
                }
            }
        }
        resultModel.setData(string);
        return resultModel;
    }
}
