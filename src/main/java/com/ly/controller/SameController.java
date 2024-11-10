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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class SameController {
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

    @RequestMapping("/toindex")
    public String toindex(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Renzhe> renzheList=renZheService.lidaihuoying();
        model.addAttribute("renzheclassify",renzheList);

        List<Music> musicList=musicService.selectED();
        model.addAttribute("musicclassify",musicList);

        List<HyrzResource> hyrzResourceList= hyrzResourceService.allResource();
        model.addAttribute("allhyrzResourceList",hyrzResourceList);
//        return "redirect:/index.jsp";
//        request.getRequestDispatcher("/index.jsp").forward(request,response);
        return "forward:/index.jsp";
    }
    @RequestMapping("/tohyrzIntroduce")
    public String tohyrzIntroduce(Model model){
        HyrzIntroduce hyrzIntroduce= hyrzIntroduceService.selectHyrzIntroduce();
        model.addAttribute("hyrzIntroduce",hyrzIntroduce);
        return "HyrzIntroduce/hyrzIntroduce";
    }
    @RequestMapping("/torenzhejianjie")
    public String torenzhejianjie(Model model){
        List<Renzhe> renzheList=renZheService.allrenzhe();
        model.addAttribute("allrenzhe",renzheList);
        return "renzhe/renzhejianjie";
    }
    @RequestMapping("toOPED")
    public String toOPED(Model model){
        List<Music> musicList= musicService.allmusic();
        model.addAttribute("allmusic",musicList);
        return "OPED/OPED";
    }
    @RequestMapping("tohyrzResource")
    public String tohyrzResource(Model model){
        List<HyrzResource> hyrzResourceList= hyrzResourceService.allResource();
        model.addAttribute("allhyrzResourceList",hyrzResourceList);
        return "HyrzResource/hyrzResource";
    }
    @RequestMapping("/toFigure")
    public String toFigure(Model model){
        List<Figure> figureList= figureService.allrenzheFigure();
        model.addAttribute("allrenzheFigureList",figureList);
        return "Figure/figure";
    }
    @RequestMapping("/toPersonal")
    public String toPersonal(HttpSession session){
//        String test= (String) session.getAttribute("UserOrAdmin");
//        if (test.equals("User")){
//            return "Personal/personal";
//        }
//        if (test.equals("Admin")){
//            return "Personal/adminPersonal";
//        }
//        return "redirect:/toindex";
        return "Personal/personal";
    }
    @RequestMapping("/toAdminPersonal")
    public String toAdminPersonal(HttpSession session){
            return "Personal/adminPersonal";
    }
    @RequestMapping("/toaddrenzhe")
    public String toaddrenzhe(){
        return "renzhe/addrenzhe";
    }
    @RequestMapping("/tologin")
    public String tologin(HttpSession session){
        session.setAttribute("iflogin","iflogin的alert测试成功");
        return "login";
    }
    @RequestMapping("/toregister")
    public String toregister(){
        return "register";
    }
    @RequestMapping("/login")
    public String login(HttpSession session,User user) throws IOException {
//        model.addAttribute("user",username);
        if (userService.checkUser(user)==null){
            String iflogin="输入存在问题，请重新输入";
            session.setAttribute("iflogin",iflogin);
            return "login";
        }
        if (user.getUsername().equals(userService.checkUser(user).getUsername())){
            User loginSession=userService.checkUser(user);
            session.setAttribute("loginSession",loginSession);
            System.out.println("loginSession===="+loginSession);
            session.setAttribute("iflogin","这位用户，欢迎你来到此网站！！！");
            System.out.println(userService.checkUser(user));
            session.setAttribute("UserID",loginSession.getUserid());
//            session.setAttribute("UserOrAdmin","User");
//            return "redirect:/index.jsp";
            return "redirect:/toindex";
//            response.getWriter().print("true");
        }
//        response.getWriter().print("false");
//        System.out.println("6666666666666666"+userService.checkUser(username));
        String iflogin="输入存在问题，请重新输入";
        session.setAttribute("iflogin",iflogin);
//        return "redirect:/index.jsp";
        return "login";
    }
    @RequestMapping("/Userlogout")
    public String Userlogout(HttpSession session){
        session.setAttribute("loginSession",null);//清空用户登录的数据
        return "redirect:/toindex";
    }@RequestMapping("/Adminlogout")
    public String Adminlogout(HttpSession session){
        session.setAttribute("AdminLoginSession",null);//清空管理员登录的数据
        return "redirect:/toAdminIndex";
    }
    @RequestMapping("/TotalLogout")
    public String TotalLogout(HttpSession session,String username){
//        model.addAttribute("user",null);
        session.invalidate();//清空数据
//        return "redirect:/index.jsp";
        return "redirect:/toindex";
    }
//    @RequestMapping("/register")
//    public String register(MultipartFile userAvatarFile, User user) throws IOException {
//        //图片上传成功后，将图片的地址写到数据库
//        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\User";//保存图片的路径
//        //获取原始图片的拓展名
//        String originalFilename = userAvatarFile.getOriginalFilename();
//        if (originalFilename.equals("")||originalFilename==null){
//            originalFilename="Default-avatar.png";
//        }else {
//            File targetFile = new File(filePath,originalFilename);
//            if (!targetFile.exists()){
//                //把本地文件上传到封装上传文件位置的全路径
//                userAvatarFile.transferTo(targetFile);
//                System.out.println("originalFilename="+originalFilename);
//            }
////            File targetFile = new File(filePath,originalFilename);
////            //把本地文件上传到封装上传文件位置的全路径
////            userAvatarFile.transferTo(targetFile);
////            System.out.println("originalFilename="+originalFilename);
//        }
//        //上传到数据库
//        user.setUserAvatar(originalFilename);
//        userService.addUser(user);
//        return "login";
//    }
    @RequestMapping("/register")
    public String register(HttpSession session,User user){
//        if(userService.checkRegisterUser(user)==null){
//            session.setAttribute("existUser","用户名不存在，请重新填写！！！");
//            System.out.println("啊啊啊啊啊啊");
//            return "register";
//        }
        if((userService.checkRegisterUser(user))!=null) //不能加.getUsername()，因为前面是空，但你想从空里提名字当然是空指针操作了
            if (user.getUsername().equals(userService.checkRegisterUser(user).getUsername())){
                session.setAttribute("existUser","用户名已经存在，请重新填写！！！");
                return "register";
            }
        user.setUserAvatar("Default-avatar.png");
        userService.addUser(user);
        return "login";
    }
    @RequestMapping("/personalUpdate.do")
    public String personalUpdate(MultipartFile userAvatarUpdate,HttpSession session,Comment comment,User user,Model model) throws IOException {
        User loginSession= (User) session.getAttribute("loginSession");
        //图片上传成功后，将图片的地址写到数据库
        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\User";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = userAvatarUpdate.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){
            originalFilename=loginSession.getUserAvatar();
        }else {
            File targetFile = new File(filePath,originalFilename);
//            String testFile=filePath+"\\"+originalFilename;
//            System.out.println(testFile);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                userAvatarUpdate.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
        }
        //修改所有comment表中名字为当前用户的名字和头像
        String CommentPersonalName=loginSession.getUsername();
        comment.setCommentName(CommentPersonalName);

        String updateCommentPersonalName=user.getUsername();
        comment.setCommentNewName(updateCommentPersonalName);

        comment.setCommentImg(originalFilename);
        commentService.updateCommentPersonalName(comment);
        //更新数据库，修改user表中的所有用户信息
        user.setUserAvatar(originalFilename);
        user.setUserNewName(user.getUsername());
        user.setUsername(loginSession.getUsername());
        userService.updatePersonal(user);
        //重新存loginSession的session
        user.setUsername(user.getUserNewName());
        session.setAttribute("loginSession",user);
        return "redirect:/toPersonal";
    }
    @RequestMapping("/toadmin")
    public String toadmin(){
        return "admin";
    }
    @RequestMapping("/adminLogin")
    public String adminLogin(HttpSession session,Admin admin) throws IOException {
//        model.addAttribute("user",username);
        if (userService.checkAdmin(admin)==null){
            String iflogin="输入存在问题，请重新输入";
            session.setAttribute("iflogin",iflogin);
            return "admin";
        }
        if (admin.getAdminName().equals(userService.checkAdmin(admin).getAdminName())){
            Admin loginSession=userService.checkAdmin(admin);
            session.setAttribute("AdminLoginSession",loginSession);
            System.out.println("loginSession===="+loginSession);
            session.setAttribute("iflogin","这位用户，欢迎你来到此网站！！！");
            System.out.println(userService.checkAdmin(admin));
//            session.setAttribute("UserOrAdmin","Admin");
            return "redirect:/toAdminIndex";
//            return "redirect:/toindex";
        }
        String iflogin="输入存在问题，请重新输入";
        session.setAttribute("iflogin",iflogin);
        return "redirect:/toadmin";
    }
    @RequestMapping("/adminPersonalUpdate.do")
    public String adminPersonalUpdate(MultipartFile userAvatarUpdate,HttpSession session,Comment comment,Admin admin,Model model) throws IOException {
        Admin loginSession= (Admin) session.getAttribute("AdminLoginSession");
        //图片上传成功后，将图片的地址写到数据库
        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\User";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = userAvatarUpdate.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){
            originalFilename=loginSession.getAdminAvatar();
        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                userAvatarUpdate.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
        }
        //修改所有comment表中名字为当前用户的名字和头像
        String CommentPersonalName=loginSession.getAdminName();
        comment.setCommentName(CommentPersonalName);

        String updateCommentPersonalName=admin.getAdminName();
        comment.setCommentNewName(updateCommentPersonalName);

        comment.setCommentImg(originalFilename);
        commentService.updateCommentPersonalName(comment);
        //更新数据库，修改admin表中的所有用户信息
        admin.setAdminAvatar(originalFilename);
        admin.setAdminNewName(admin.getAdminName());
        admin.setAdminName(loginSession.getAdminName());
        userService.updateAdminPersonal(admin);
        //重新存AdminLoginSession的session
        admin.setAdminName(admin.getAdminNewName());
        session.setAttribute("AdminLoginSession",admin);
        return "redirect:/toAdminPersonal";
//        return "redirect:/toPersonal";
    }
}
