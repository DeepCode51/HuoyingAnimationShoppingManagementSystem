package com.ly.controller;

import com.ly.pojo.*;
import com.ly.service.Comment.CommentService;
import com.ly.service.HyrzResource.HyrzResourceService;
import com.ly.service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class HyrzResourceController {
    @Autowired
    @Qualifier("HyrzResourceServiceImpl")
    private HyrzResourceService hyrzResourceService;
    @Autowired
    @Qualifier("CommentServiceImpl")
    private CommentService commentService;

    @RequestMapping("/toaddResource")
    public String toaddResource(){
        return "HyrzResource/addResource";
    }
    @RequestMapping("addResource.do")
    public String addResource(HyrzResource hyrzResource){
        hyrzResourceService.addResource(hyrzResource);
        return "redirect:/toAdminHyrzResource";
//        return "redirect:/tohyrzResource";
    }
    @RequestMapping("/DeleteResourceById/{hyrzResourceId}")
    public String DeleteResourceById(@PathVariable("hyrzResourceId") int id){
        hyrzResourceService.deleteResourceById(id);
        return "redirect:/tohyrzResource";
    }
    @RequestMapping("/toupdateResource")
    public String toupdateResource(Model model, int id){
        HyrzResource hyrzResource= hyrzResourceService.queryResourceById(id);
        model.addAttribute("updateResource",hyrzResource);
        return "HyrzResource/updateResource";
    }
    @RequestMapping("/updateResource.do")
    public String updateResource(HyrzResource hyrzResource){
        hyrzResourceService.updateResource(hyrzResource);
        return "redirect:/toAdminHyrzResource";
//        return "redirect:/tohyrzResource";
    }
    @RequestMapping("/toComment")
    public String toComment(Model model){
        List<Emoji> emojiList=commentService.allEmoji();
        model.addAttribute("allEmoji",emojiList);
        List<Comment> commentList=commentService.allComment();
        model.addAttribute("commentList",commentList);
        return "HyrzResource/comment";
    }
    //去用户上传资源界面
    @RequestMapping("/toUserApplyAddResource")
    public String toUserApplyAddResource(Model model){
        return "HyrzResource/UserApplyAddResource";
    }
    //用户上传自己的资源（经过管理员审核后，方可加入资源列表中）
    @RequestMapping("/UserApplyAddResource")
    public String UserApplyAddResource(Model model, HyrzResourceApply hyrzResourceApply, HttpSession session){
        //用户上传资源的时间
        Date day=new Date();
        //格式化成yyyyMMdd格式，注意大小写
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String applyAddTime=format.format(day);

        hyrzResourceApply.setApplyAddTime(applyAddTime);
        User user=(User) session.getAttribute("loginSession");
        hyrzResourceApply.setUserid(user.getUserid());
        hyrzResourceApply.setUsername(user.getUsername());
        hyrzResourceService.UserApplyAddResource(hyrzResourceApply);
        return "redirect:/tohyrzResource";
    }
    //去管理员审核用户上传资源的界面
    @RequestMapping("/toAdminAllApplyResource")
    public String toAdminAllApplyResource(Model model){
        List<HyrzResourceApply> hyrzResourceApplyList=hyrzResourceService.AdminShowAllResourceApply();
        model.addAttribute("AdminShowAllResourceApply",hyrzResourceApplyList);
        System.out.println(hyrzResourceApplyList);
        return "HyrzResource/AdminShowAllResourceApply";
    }
    //去管理员审核通过用户上传的资源，并将新资源信息添加到资源列表中，然后将审核结果同步到用户的上传审核状态
    @RequestMapping("/AdminPassApplyResource/{resourceApplyAddID}")
    public String AdminPassApplyResource(@PathVariable("resourceApplyAddID") int resourceApplyAddID,HyrzResource resource){
        HyrzResourceApply hyrzResourceApply=hyrzResourceService.queryApplyResourceById(resourceApplyAddID);
        System.out.println(hyrzResourceApply);
        resource.setHyrzResourceName(hyrzResourceApply.getHyrzResourceName());
        resource.setHyrzResourceLink(hyrzResourceApply.getHyrzResourceLink());

        hyrzResourceService.AdminPassApplyResource(resource);
        hyrzResourceService.AdminUpdateApplyResource(resourceApplyAddID);
//        refundService.deleteRefund(orderId);
        return "redirect:/toAdminAllApplyResource";
    }
    //去管理员拒绝通过用户上传的资源，然后将审核结果同步到用户的上传审核状态
    @RequestMapping("/AdminRefuseApplyResource/{resourceApplyAddID}")
    public String AdminRefuseApplyResource(@PathVariable("resourceApplyAddID")int resourceApplyAddID){
        hyrzResourceService.AdminReduceApplyResource(resourceApplyAddID);
        return "redirect:/toAdminAllApplyResource";
    }
    //用户通过点击上传审核状态页面，查询自己上传的资源的目前审核进度
    @RequestMapping("/toUserShowApplyResource")
    public String toUserShowApplyResource(Model model,HttpSession session){
        User user=(User) session.getAttribute("loginSession");
        List<HyrzResourceApply> hyrzResourceApplyList= hyrzResourceService.UserQueryApplyResourceByUserid(user.getUserid());
        model.addAttribute("UserShowAllResourceApply",hyrzResourceApplyList);
        return "HyrzResource/UserShowApplyResource";
    }
}
