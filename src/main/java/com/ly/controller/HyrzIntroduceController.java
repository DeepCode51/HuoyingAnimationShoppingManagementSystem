package com.ly.controller;

import com.ly.pojo.HyrzIntroduce;
import com.ly.service.HyrzIntroduce.HyrzIntroduceService;
import com.ly.service.RenZhe.RenZheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HyrzIntroduceController {
    @Autowired
    @Qualifier("HyrzIntroduceServiceImpl")
    private HyrzIntroduceService hyrzIntroduceService;

    @RequestMapping("toupdateIntroduce")
    public String toupdateIntroduce(Model model,int id){
        HyrzIntroduce hyrzIntroduce= hyrzIntroduceService.queryIntroduceById(id);
        model.addAttribute("updateIntroduce",hyrzIntroduce);
        return "HyrzIntroduce/updateIntroduce";
    }
    @RequestMapping("updateIntroduce.do")
    public String updateIntroduce(HyrzIntroduce hyrzIntroduce){
        hyrzIntroduceService.updateIntroduce(hyrzIntroduce);
        return "redirect:/toAdminHyrzIntroduce";
//        return "redirect:/tohyrzIntroduce";
    }
    @RequestMapping("toXuanWoMingRenIntroduce")
    public String toXuanWoMingRenIntroduce(Model model){
        HyrzIntroduce hyrzIntroduce=hyrzIntroduceService.Selectxuanwomingren();
        model.addAttribute("IntroduceClassify",hyrzIntroduce);
        return "HyrzIntroduce/IntroduceClassify";
    }
    @RequestMapping("toZuoZhuIntroduce")
    public String toZuoZhuIntroduce(Model model){
        HyrzIntroduce hyrzIntroduce=hyrzIntroduceService.Selectzhuzhu();
        model.addAttribute("IntroduceClassify",hyrzIntroduce);
        return "HyrzIntroduce/IntroduceClassify";
    }
}
