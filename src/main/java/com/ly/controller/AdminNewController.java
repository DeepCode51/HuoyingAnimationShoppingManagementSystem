package com.ly.controller;

import com.ly.pojo.*;
import com.ly.service.Comment.CommentService;
import com.ly.service.Figure.FigureService;
import com.ly.service.HyrzIntroduce.HyrzIntroduceService;
import com.ly.service.HyrzResource.HyrzResourceService;
import com.ly.service.Music.MusicService;
import com.ly.service.RenZhe.RenZheService;
import com.ly.service.User.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class AdminNewController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("RenZheServiceImpl")
    private RenZheService renZheService;
    @Autowired
    @Qualifier("MusicServiceImpl")
    private MusicService musicService;
    @Autowired
    @Qualifier("HyrzIntroduceServiceImpl")
    private HyrzIntroduceService hyrzIntroduceService;
    @Autowired
    @Qualifier("HyrzResourceServiceImpl")
    private HyrzResourceService hyrzResourceService;
    @Autowired
    @Qualifier("CommentServiceImpl")
    private CommentService commentService;
    @Autowired
    @Qualifier("FigureServiceImpl")
    private FigureService figureService;

    @RequestMapping("/toAdminIndex")
    public String toAdminIndex(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Renzhe> renzheList=renZheService.lidaihuoying();
        model.addAttribute("renzheclassify",renzheList);

        List<Music> musicList=musicService.selectED();
        model.addAttribute("musicclassify",musicList);

        List<HyrzResource> hyrzResourceList= hyrzResourceService.allResource();
        model.addAttribute("allhyrzResourceList",hyrzResourceList);
//        return "redirect:/index.jsp";
//        request.getRequestDispatcher("/index.jsp").forward(request,response);
        return "forward:/AdminIndex.jsp";
    }
    @RequestMapping("/toAdminFigure")
    public String toAdminFigure(Model model){
        List<Figure> figureList= figureService.allrenzheFigure();
        model.addAttribute("allrenzheFigureList",figureList);

        List<FigureBelong> figureBelongList=figureService.allFigureBelong();
        model.addAttribute("allFigureBelongList",figureBelongList);
        return "AdminNew/AdminFigure";
    }
    @RequestMapping("/toAdminxiaozuzhiFigure")
    public String toAdminxiaozuzhiFigure(Model model){
        List<Figure> figureList=figureService.xiaozuzhiFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "AdminNew/AdminFigure";
    }
    @RequestMapping("/toAdminlidaihuoyingFigure")
    public String toAdminlidaihuoyingFigure(Model model){
        List<Figure> figureList=figureService.lidaihuoyingFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "AdminNew/AdminFigure";
    }
    @RequestMapping("/toAdminrendaoqirenFigure")
    public String toAdminrendaoqirenFigure(Model model){
        List<Figure> figureList=figureService.rendaoqirenFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "AdminNew/AdminFigure";
    }
    @RequestMapping("/toAdminbamendunjiaFigure")
    public String toAdminbamendunjiaFigure(Model model){
        List<Figure> figureList=figureService.bamendunjiaFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "AdminNew/AdminFigure";
    }
    @RequestMapping("/toAdminSalesSortFigure")
    public String toAdminSalesSortFigure(Model model){
        List<Figure> figureList=figureService.SalesSort();
        model.addAttribute("allrenzheFigureList",figureList);
        return "AdminNew/AdminFigure";
    }
    @RequestMapping("/toAdminHyrzIntroduce")
    public String toAdminHyrzIntroduce(Model model){
        HyrzIntroduce hyrzIntroduce= hyrzIntroduceService.selectHyrzIntroduce();
        model.addAttribute("hyrzIntroduce",hyrzIntroduce);
        return "AdminNew/AdminHyrzIntroduce";
    }
//    @RequestMapping("/toAdminIntroduceClassify")
//    public String toAdminIntroduceClassify(Model model){
//        HyrzIntroduce hyrzIntroduce= hyrzIntroduceService.selectHyrzIntroduce();
//        model.addAttribute("hyrzIntroduce",hyrzIntroduce);
//        return "AdminNew/AdminIntroduceClassify";
//    }
    @RequestMapping("/toAdminXuanWoMingRenIntroduce")
    public String toAdminXuanWoMingRenIntroduce(Model model){
        HyrzIntroduce hyrzIntroduce=hyrzIntroduceService.Selectxuanwomingren();
        model.addAttribute("IntroduceClassify",hyrzIntroduce);
        return "AdminNew/AdminIntroduceClassify";
    }
    @RequestMapping("/toAdminZuoZhuIntroduce")
    public String toAdminZuoZhuIntroduce(Model model){
        HyrzIntroduce hyrzIntroduce=hyrzIntroduceService.Selectzhuzhu();
        model.addAttribute("IntroduceClassify",hyrzIntroduce);
        return "AdminNew/AdminIntroduceClassify";
    }
    @RequestMapping("toAdminHyrzResource")
    public String toAdminHyrzResource(Model model){
        List<HyrzResource> hyrzResourceList= hyrzResourceService.allResource();
        model.addAttribute("allhyrzResourceList",hyrzResourceList);
        return "AdminNew/AdminHyrzResource";
    }
    @RequestMapping("/toAdminComment")
    public String toAdminComment(Model model){
        List<Emoji> emojiList=commentService.allEmoji();
        model.addAttribute("allEmoji",emojiList);
        List<Comment> commentList=commentService.allComment();
        model.addAttribute("commentList",commentList);
        return "AdminNew/AdminComment";
    }
    @RequestMapping("/AdminfabiaoComment")
    public String AdminfabiaoComment(Comment comment){
        commentService.addComment(comment);
        System.out.println("文本框输入的内容是："+comment.getCommentMain());
        return "redirect:/toAdminComment";
    }
    @RequestMapping("toAdminOPED")
    public String toAdminOPED(Model model){
        List<Music> musicList= musicService.allmusic();
        model.addAttribute("allmusic",musicList);
        return "AdminNew/AdminOPED";
    }
    @RequestMapping("toAdminOPmusicclassify")
    public String toAdminOPmusicclassify(Model model){
        List<Music> musicList=musicService.selectOP();
        model.addAttribute("musicclassify",musicList);
        return "AdminNew/AdminMusicClassify";
    }
    @RequestMapping("toAdminEDmusicclassify")
    public String toAdminEDmusicclassify(Model model){
        List<Music> musicList=musicService.selectED();
        model.addAttribute("musicclassify",musicList);
        return "AdminNew/AdminMusicClassify";
    }
    @RequestMapping("/toAdminrenzhejianjie")
    public String toAdminrenzhejianjie(Model model){
        List<Renzhe> renzheList=renZheService.allrenzhe();
        model.addAttribute("allrenzhe",renzheList);
        return "AdminNew/AdminRenzheJianjie";
    }
    @RequestMapping("/toAdminxiaozuzhi")
    public String toAdminxiaozuzhi(Model model){
        List<Renzhe> renzheList=renZheService.xiaozuzhi();
        model.addAttribute("renzheclassify",renzheList);
        return "AdminNew/AdminRenzheClassify";
    }
    @RequestMapping("/toAdminlidaihuoying")
    public String toAdminlidaihuoying(Model model){
        List<Renzhe> renzheList=renZheService.lidaihuoying();
        model.addAttribute("renzheclassify",renzheList);
        return "AdminNew/AdminRenzheClassify";
    }
    @RequestMapping("/toAdminrendaoqiren")
    public String toAdminrendaoqiren(Model model){
        List<Renzhe> renzheList=renZheService.rendaoqiren();
        model.addAttribute("renzheclassify",renzheList);
        return "AdminNew/AdminRenzheClassify";
    }
    @RequestMapping("/toAdminbamendunjia")
    public String toAdminbamendunjia(Model model){
        List<Renzhe> renzheList=renZheService.bamendunjia();
        model.addAttribute("renzheclassify",renzheList);
        return "AdminNew/AdminRenzheClassify";
    }
    //管理员去查看所有手办分类（可以进行增删改）
    @RequestMapping("/toAdminShowFigureBelong")
    public String toAdminShowFigureBelong(Model model, HttpSession session){
        List<FigureBelong> figureBelongs= figureService.allFigureBelong();
        model.addAttribute("AdminAllFigureBelong",figureBelongs);
        System.out.println(figureBelongs);
        return "AdminNew/AdminShowFigureBelong";
    }
    //管理员去新增手办分类的页面
    @RequestMapping("/toAddFigureBelong")
    public String toAddFigure(){
        return "AdminNew/AdminAddFigureBelong";
    }
    //管理员新增手办分类
    @RequestMapping("/AdminAddFigureBelong")
    public String AdminAddFigureBelong(FigureBelong figureBelong){
        figureService.addFigureBelong(figureBelong);
        return "redirect:/toAdminShowFigureBelong";
    }
    @RequestMapping("/toAdminUpdateFigureBelong")
    public String toAdminUpdateFigureBelong(Model model, int id){
        FigureBelong figureBelong= figureService.queryFigureBelongById(id);
        model.addAttribute("updateFigureBelong",figureBelong);
        return "AdminNew/AdminUpdateFigureBelong";
    }
    //管理员修改手办分类
    @RequestMapping("/AdminUpdateFigureBelong")
    public String AdminUpdateFigureBelong(FigureBelong figureBelong){
        figureService.updateFigureBelong(figureBelong);
        return "redirect:/toAdminShowFigureBelong";
    }
    //管理员删除手办分类
    @RequestMapping("/AdminDeleteFigureBelongById/{figureBelongId}")
    public String AdminDeleteFigureBelongById(@PathVariable("figureBelongId") int id){
        figureService.deleteFigureBelongById(id);
        return "redirect:/toAdminShowFigureBelong";
    }

}
