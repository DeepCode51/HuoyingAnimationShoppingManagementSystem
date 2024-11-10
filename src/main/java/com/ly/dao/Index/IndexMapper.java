package com.ly.dao.Index;

import com.ly.pojo.HyrzResource;
import com.ly.pojo.Music;
import com.ly.pojo.Renzhe;

import java.util.List;

public interface IndexMapper {
    //查询历代火影
    List<Renzhe> lidaihuoying();
    //查询所有ED
    List<Music> selectED();
    //查询所有资源
    List<HyrzResource> allResource();
}
