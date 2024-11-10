package com.ly.dao.RenZhe;

import com.ly.pojo.Renzhe;

import java.util.List;

public interface RenZheMapper {
    //新增忍者
    int addrenzhe(Renzhe renzhe);
    //查询所有忍者
    List<Renzhe> allrenzhe();
    //查询所有晓组织成员
    List<Renzhe> xiaozuzhi();
    //查询历代火影
    List<Renzhe> lidaihuoying();
    //查询所有忍刀七人众成员
    List<Renzhe> rendaoqiren();
    //查询所有会八门遁甲的忍者
    List<Renzhe> bamendunjia();
    //根据当前选中的忍者id删除忍者
    int deleterenzheById(int id);
    //更新忍者
    int updaterenzhe(Renzhe renzhe);
    //更新时点击该忍者的修改，根据该忍者的id去查找信息，将信息赋值给model或session，通过存储的数据输出
    Renzhe queryrenzheById(int id);
}
