package com.ly.service.HyrzIntroduce;

import com.ly.pojo.HyrzIntroduce;

public interface HyrzIntroduceService {
    //查询一个模块的内容
    HyrzIntroduce selectHyrzIntroduce();
    //更新该模块的介绍
    int updateIntroduce(HyrzIntroduce hyrzIntroduce);
    //更新时点击该模块的修改，根据该模块的id去查找信息，将信息赋值给model或session，通过存储的数据输出
    HyrzIntroduce queryIntroduceById(int id);
    //查询漩涡鸣人
    HyrzIntroduce Selectxuanwomingren();
    //查询佐助
    HyrzIntroduce Selectzhuzhu();
}
