package com.ems.controller;


import com.ems.dal.example.Notify;
import com.ems.from.NotifySearchForm;
import com.ems.mode.ConsoleResultModel;
import com.ems.service.INotifyService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/notify")
public class NotifyCongtroller {

    @Resource
    private INotifyService notifyService;

    @RequestMapping("/to-list")
    public String toList(Model model) throws Exception
    {
      
        return "Notify";
    }

    @RequestMapping(value="select")
    @ResponseBody
    public ConsoleResultModel<PageInfo<List<Notify>>> select(NotifySearchForm form) throws Exception
    {
        ConsoleResultModel<PageInfo<List<Notify>>>  resultModel = new ConsoleResultModel<>();
        List<Notify> list =  notifyService.select(form);
        PageInfo<List<Notify>> pageInfo = new PageInfo(list);
        resultModel.setData(pageInfo);
        return resultModel;
    }

	@RequestMapping("/search-detail")
    @ResponseBody
    public ConsoleResultModel<Notify> searchDetail(Long id)throws Exception{
        ConsoleResultModel<Notify> resultModel = new ConsoleResultModel<>();
        Notify model = this.notifyService.selectById(id);
        resultModel.setData(model);
        return resultModel;
    }
    
    @RequestMapping("/update")
    @ResponseBody
    public ConsoleResultModel<Integer> update(NotifySearchForm form)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Notify model = new Notify();
		BeanUtils.copyProperties(form, model);
        Integer result = this.notifyService.update(model);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("/delete")
    @ResponseBody
    public ConsoleResultModel<Integer> delete(Long id)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Integer result = this.notifyService.delete(id);
        resultModel.setData(result);
        return resultModel;
    }
    
    @RequestMapping("insert")
    @ResponseBody
    public ConsoleResultModel<Integer> insert(NotifySearchForm form)throws Exception{
        ConsoleResultModel<Integer> resultModel = new ConsoleResultModel<>();
        Notify model = new Notify();
        BeanUtils.copyProperties(form, model);
        model.setReleaseTime(new Date());
        model.setReleaseUser("admin");
        model.setReleaseUserId(1l);
        int row = this.notifyService.insert(model);
        if(row<=0){
            resultModel.setSuccess(false);
        }
        resultModel.setData(row);
        return resultModel;
    }
}
