package com.ly.dao.Music;

import com.ly.pojo.Music;
import com.ly.pojo.Renzhe;

import java.util.List;

public interface MusicMapper {
    //新增音乐
    int addmusic(Music music);
    //查询所有音乐
    List<Music> allmusic();
    //查询所有OP
    List<Music> selectOP();
    //查询所有ED
    List<Music> selectED();
    //根据当前选中的音乐id删除音乐
    int deletemusicById(int id);
    //更新音乐
    int updatemusic(Music music);
    //更新时点击该音乐的修改，根据该音乐的id去查找信息，将信息赋值给model或session，通过存储的数据输出
    Music querymusicById(int id);
}
