package com.ly.controller;

import com.ly.pojo.Comment;
import com.ly.service.Comment.CommentService;
import com.ly.service.HyrzResource.HyrzResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    @Qualifier("CommentServiceImpl")
    private CommentService commentService;

//    @RequestMapping("/fabiaoComment")
//    public List<Comment> fabiaoComment(Model model){
//        List<Comment> commentList=commentService.allComment();
//        model.addAttribute("commentList",commentList);
//        return commentList;
//    }
    @RequestMapping("/fabiaoComment")
    public String fabiaoComment(Comment comment){
        commentService.addComment(comment);
        System.out.println("文本框输入的内容是："+comment.getCommentMain());
        return "redirect:/toComment";
    }
    @RequestMapping("/deleteCommentById/{commentId}")
    public String deleteCommentById(@PathVariable("commentId") int id){
        commentService.deleteCommentById(id);
        return "redirect:/AdminfabiaoComment";
    }
}
