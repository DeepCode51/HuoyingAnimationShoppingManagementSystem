package com.ly.controller;

import com.ly.pojo.Music;
import com.ly.pojo.Renzhe;
import com.ly.service.Music.MusicService;
import com.ly.service.RenZhe.RenZheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class MusicController {
    @Autowired
    @Qualifier("MusicServiceImpl")
    private MusicService musicService;

    @RequestMapping("toaddmusic")
    public String toaddmusic(){
        return "OPED/addmusic";
    }
    @RequestMapping("/addmusic.do")
    public String addmusic(MultipartFile musicRsc, Music music) throws IOException {
        //音乐上传成功后，将音乐的资源写到数据库
        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\music";//保存音乐的路径
        //获取原始音乐的拓展名
        String originalFilename = musicRsc.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                musicRsc.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
        }
//        File targetFile = new File(filePath,originalFilename);
//        //把本地音乐上传到封装上传文件位置的全路径
//        musicRsc.transferTo(targetFile);
        //上传到数据库
        System.out.println("originalFilename="+originalFilename);
        music.setMusicResource(originalFilename);
        musicService.addmusic(music);
        return "redirect:/toAdminOPED";
//        return "redirect:/toOPED";
    }
    @RequestMapping("toOPmusicclassify")
    public String toOPmusicclassify(Model model){
        List<Music> musicList=musicService.selectOP();
        model.addAttribute("musicclassify",musicList);
        return "OPED/musicclassify";
    }
    @RequestMapping("toEDmusicclassify")
    public String toEDmusicclassify(Model model){
        List<Music> musicList=musicService.selectED();
        model.addAttribute("musicclassify",musicList);
        return "OPED/musicclassify";
    }
    @RequestMapping("/DeletemusicById/{musicId}")
    public String DeletemusicById(@PathVariable("musicId") int id){
        musicService.deletemusicById(id);
        return "redirect:/toAdminOPED";
    }
    @RequestMapping("toupdatemusic")
    public String toupdatemusic(Model model,int id){
        Music music=musicService.querymusicById(id);
        model.addAttribute("updatemusic",music);
        return "OPED/updatemusic";
    }
    @RequestMapping("/updatemusic.do")
    public String updatemusic(MultipartFile musicRsc, Music music) throws IOException {
        //音乐上传成功后，将音乐的资源写到数据库
        String filePath = "F:\\idea\\J2EE\\hyrz\\web\\WEB-INF\\statics\\music";//保存音乐的路径
        //获取原始音乐的拓展名
        String originalFilename = musicRsc.getOriginalFilename();
        if (originalFilename.equals("")||originalFilename==null){

        }else {
            File targetFile = new File(filePath,originalFilename);
            if (!targetFile.exists()){
                //把本地文件上传到封装上传文件位置的全路径
                musicRsc.transferTo(targetFile);
                System.out.println("originalFilename="+originalFilename);
            }
        }
//        File targetFile = new File(filePath,originalFilename);
//        //把本地音乐上传到封装上传文件位置的全路径
//        musicRsc.transferTo(targetFile);
        //上传到数据库
        System.out.println("originalFilename="+originalFilename);
        music.setMusicResource(originalFilename);
        musicService.updatemusic(music);
        System.out.println(music);
        return "redirect:/toAdminOPED";
//        return "redirect:/toOPED";
    }
}
