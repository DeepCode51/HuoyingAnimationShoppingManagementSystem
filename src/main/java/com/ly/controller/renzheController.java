package com.ly.controller;

import com.ly.pojo.Renzhe;
import com.ly.service.RenZhe.RenZheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class renzheController {
    @Autowired
    @Qualifier("RenZheServiceImpl")
    private RenZheService renZheService;

    @RequestMapping("/addrenzhe.do")
    public String  allrenzhe(Model model,Renzhe renzhe){
        List<Renzhe> renzheList=renZheService.allrenzhe();
        model.addAttribute("allrenzhe",renzheList);
        return "AdminNew/AdminRenzheJianjie";
//        return "renzhe/renzhejianjie";
    }
    /*
     * 采用file.Transto 来保存上传的文件
     */
    //@RequestParam("renzheImage") CommonsMultipartFile renzheImage, HttpServletRequest request,
    @RequestMapping(value = "/addrenzheupload2" ,method = RequestMethod.POST)
    public String addrenzhe(MultipartFile renzheImg, HttpServletRequest request, Renzhe renzhe) throws IOException {
        //图片上传成功后，将图片的地址写到数据库
        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\renzhejianjie";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = renzheImg.getOriginalFilename();
        //新的文件名字
//        String newFileName = UUID.randomUUID()+originalFilename;
        //封装上传文件位置的全路径
//        File targetFile = new File(filePath,newFileName);
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                renzheImg.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
        }
//        File targetFile = new File(filePath,originalFilename);
//        //把本地文件上传到封装上传文件位置的全路径
//        renzheImg.transferTo(targetFile);
        //上传到数据库
        System.out.println("originalFilename="+originalFilename);
//        System.out.println("newFileName="+newFileName);
        renzhe.setRenzheImage(originalFilename);
        renZheService.addrenzhe(renzhe);
        return "redirect:/addrenzhe.do";
//        return "renzhejianjie";
//        return "redirect:/index.jsp";
    }
    @RequestMapping("/toxiaozuzhi")
    public String toxiaozuzhi(Model model){
        List<Renzhe> renzheList=renZheService.xiaozuzhi();
        model.addAttribute("renzheclassify",renzheList);
        return "renzhe/renzheclassify";
    }
    @RequestMapping("/tolidaihuoying")
    public String tolidaihuoying(Model model){
        List<Renzhe> renzheList=renZheService.lidaihuoying();
        model.addAttribute("renzheclassify",renzheList);
        return "renzhe/renzheclassify";
    }
    @RequestMapping("/torendaoqiren")
    public String torendaoqiren(Model model){
        List<Renzhe> renzheList=renZheService.rendaoqiren();
        model.addAttribute("renzheclassify",renzheList);
        return "renzhe/renzheclassify";
    }
    @RequestMapping("/tobamendunjia")
    public String tobamendunjia(Model model){
        List<Renzhe> renzheList=renZheService.bamendunjia();
        model.addAttribute("renzheclassify",renzheList);
        return "renzhe/renzheclassify";
    }
    @RequestMapping("/DeleterenzheById/{renzheId}")
    public String DeleterenzheById(@PathVariable("renzheId") int id){
        renZheService.deleterenzheById(id);
        return "redirect:/toAdminrenzhejianjie";
    }
    @RequestMapping("/toupdaterenzhe")
    public String toupdaterenzhe(Model model,int id){
        Renzhe renzhe=renZheService.queryrenzheById(id);
        model.addAttribute("updaterenzhe",renzhe);
        return "renzhe/updaterenzhe";
    }
    @RequestMapping("/updaterenzhe")
    public String updaterenzhe(MultipartFile renzheImg,Renzhe renzhe) throws IOException {
        //图片上传成功后，将图片的地址写到数据库
        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\images\\renzhejianjie";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = renzheImg.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                renzheImg.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
        }
//        File targetFile = new File(filePath,originalFilename);
//        //把本地文件上传到封装上传文件位置的全路径
//        renzheImg.transferTo(targetFile);
        //上传到数据库
        System.out.println("originalFilename="+originalFilename);
        renzhe.setRenzheImage(originalFilename);
        renZheService.updaterenzhe(renzhe);
        return "redirect:/toAdminrenzhejianjie";
//        return "redirect:/torenzhejianjie";
    }
}
